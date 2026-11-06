-- Traveler access credentials. Generated only in the database; only SHA-256
-- hashes are stored and the plain values are returned exactly once.

-- Hashes and the revocation mark are never readable or writable by API roles.
-- A column-level REVOKE does not override a table-level GRANT, so the table
-- grant is replaced by explicit column grants.
revoke select, insert, update on table public.bookings from authenticated;

grant select (
  id, trip_id, passenger_id, status, access_expires_at, access_revoked_at,
  notes, created_at, updated_at
) on table public.bookings to authenticated;

grant insert (id, trip_id, passenger_id, status, access_expires_at, notes)
  on table public.bookings to authenticated;

grant update (status, access_expires_at, notes)
  on table public.bookings to authenticated;

create or replace function public.issue_booking_access(p_booking_id uuid)
returns table (token text, code text, access_expires_at timestamptz)
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare
  -- 31 symbols: no 0, O, 1, I or L.
  c_alphabet constant text := 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';
  c_code_length constant int := 8;
  v_booking public.bookings%rowtype;
  v_expires_at timestamptz;
  v_token text;
  v_code text := '';
  v_byte int;
begin
  if not public.is_admin() then
    raise exception 'only admins can issue booking access'
      using errcode = '42501';
  end if;

  select * into v_booking
    from public.bookings b
   where b.id = p_booking_id
     for update;

  if not found then
    raise exception 'booking % not found', p_booking_id
      using errcode = 'P0002';
  end if;

  if v_booking.status = 'cancelled' then
    raise exception 'cannot issue access for a cancelled booking'
      using errcode = '22023';
  end if;

  v_expires_at := coalesce(
    v_booking.access_expires_at,
    (select (t.end_date + 30)::timestamptz from public.trips t where t.id = v_booking.trip_id)
  );

  if v_expires_at <= now() then
    raise exception 'access window for booking % has ended', p_booking_id
      using errcode = '22023';
  end if;

  -- 32 random bytes, base64url without padding (43 chars).
  v_token := rtrim(
    translate(encode(extensions.gen_random_bytes(32), 'base64'), E'+/\n', '-_'),
    '='
  );

  -- Rejection sampling keeps every symbol equally likely (248 = 31 * 8).
  while length(v_code) < c_code_length loop
    v_byte := get_byte(extensions.gen_random_bytes(1), 0);
    if v_byte < 248 then
      v_code := v_code || substr(c_alphabet, (v_byte % 31) + 1, 1);
    end if;
  end loop;

  -- Overwriting the hashes invalidates any previous credentials.
  update public.bookings b
     set token_hash = encode(extensions.digest(v_token, 'sha256'), 'hex'),
         code_hash = encode(extensions.digest(v_code, 'sha256'), 'hex'),
         access_expires_at = v_expires_at,
         access_revoked_at = null
   where b.id = p_booking_id;

  insert into public.access_events (booking_id, event_type, metadata)
  values (
    p_booking_id,
    'access_issued',
    jsonb_build_object(
      'actor_id', auth.uid(),
      'access_expires_at', v_expires_at,
      'replaced_previous', v_booking.token_hash is not null
    )
  );

  return query select v_token, v_code, v_expires_at;
end;
$$;

create or replace function public.revoke_booking_access(p_booking_id uuid)
returns void
language plpgsql
volatile
security definer
set search_path = ''
as $$
begin
  if not public.is_admin() then
    raise exception 'only admins can revoke booking access'
      using errcode = '42501';
  end if;

  update public.bookings b
     set access_revoked_at = now()
   where b.id = p_booking_id;

  if not found then
    raise exception 'booking % not found', p_booking_id
      using errcode = 'P0002';
  end if;

  insert into public.access_events (booking_id, event_type, metadata)
  values (p_booking_id, 'access_revoked', jsonb_build_object('actor_id', auth.uid()));
end;
$$;

revoke execute on function public.issue_booking_access(uuid) from public, anon;
revoke execute on function public.revoke_booking_access(uuid) from public, anon;
grant execute on function public.issue_booking_access(uuid) to authenticated;
grant execute on function public.revoke_booking_access(uuid) to authenticated;

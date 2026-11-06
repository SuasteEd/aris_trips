-- Passenger import: one transaction for many passengers and their bookings.
--
-- Matching rule (agreed for milestone 5): an existing passenger is reused
-- when email, first name and last name match, ignoring case, accents and
-- extra spaces. Same email with another name is a different passenger
-- (e.g. siblings sharing a parent's email). Rows without email always
-- create a new passenger.

-- Comparison key. The app (Dart) uses the same mapping.
create or replace function public.person_key(p_value text)
returns text
language sql
immutable
set search_path = ''
as $$
  select lower(
    translate(
      regexp_replace(trim(coalesce(p_value, '')), '\s+', ' ', 'g'),
      'ÁÀÄÂÉÈËÊÍÌÏÎÓÒÖÔÚÙÜÛÑÇáàäâéèëêíìïîóòöôúùüûñç',
      'AAAAEEEEIIIIOOOOUUUUNCaaaaeeeeiiiioooouuuunc'
    )
  );
$$;

-- Runs with the caller's rights: RLS keeps it admin-only. Any invalid row
-- or a passenger already booked on the trip aborts the whole import.
create or replace function public.import_trip_passengers(
  p_trip_id uuid,
  p_rows jsonb
)
returns table (row_index int, passenger_id uuid, booking_id uuid, reused boolean)
language plpgsql
volatile
security invoker
set search_path = ''
as $$
declare
  v_row jsonb;
  v_index int := 0;
  v_first text;
  v_last text;
  v_email text;
  v_phone text;
  v_passenger uuid;
  v_booking uuid;
  v_reused boolean;
begin
  -- Clear error for non-admins; RLS would block the writes anyway.
  if not public.is_admin() then
    raise exception 'only admins can import passengers' using errcode = '42501';
  end if;

  if jsonb_typeof(p_rows) is distinct from 'array' then
    raise exception 'p_rows must be a JSON array' using errcode = '22023';
  end if;

  if not exists (select 1 from public.trips t where t.id = p_trip_id) then
    raise exception 'trip % not found', p_trip_id using errcode = 'P0002';
  end if;

  for v_row in select value from jsonb_array_elements(p_rows)
  loop
    v_index := v_index + 1;
    v_first := nullif(regexp_replace(trim(coalesce(v_row->>'first_name', '')), '\s+', ' ', 'g'), '');
    v_last := nullif(regexp_replace(trim(coalesce(v_row->>'last_name', '')), '\s+', ' ', 'g'), '');
    v_email := nullif(lower(trim(coalesce(v_row->>'email', ''))), '');
    v_phone := nullif(trim(coalesce(v_row->>'phone', '')), '');

    if v_first is null or v_last is null then
      raise exception 'row %: first and last name are required', v_index
        using errcode = '22023';
    end if;

    v_passenger := null;
    if v_email is not null then
      select p.id into v_passenger
        from public.passengers p
       where lower(p.email) = v_email
         and public.person_key(p.first_name) = public.person_key(v_first)
         and public.person_key(p.last_name) = public.person_key(v_last)
       order by p.created_at
       limit 1;
    end if;

    v_reused := v_passenger is not null;
    if not v_reused then
      insert into public.passengers (first_name, last_name, email, phone)
      values (v_first, v_last, v_email, v_phone)
      returning id into v_passenger;
    end if;

    begin
      insert into public.bookings (trip_id, passenger_id)
      values (p_trip_id, v_passenger)
      returning id into v_booking;
    exception
      when unique_violation then
        raise exception 'row %: passenger is already on this trip', v_index
          using errcode = '23505';
    end;

    row_index := v_index;
    passenger_id := v_passenger;
    booking_id := v_booking;
    reused := v_reused;
    return next;
  end loop;
end;
$$;

revoke execute on function public.import_trip_passengers(uuid, jsonb) from public, anon;
grant execute on function public.import_trip_passengers(uuid, jsonb) to authenticated;

-- Speeds up the reuse lookup.
create index passengers_email_lower_idx on public.passengers (lower(email))
  where email is not null;

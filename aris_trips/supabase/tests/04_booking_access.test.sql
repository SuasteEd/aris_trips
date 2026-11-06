begin;
create extension if not exists pgtap with schema extensions;

select plan(27);

-- Fixtures (as postgres).
insert into auth.users (id, email, aud, role)
values
  ('40000000-0000-4000-8000-000000000001', 'admin@test.local', 'authenticated', 'authenticated'),
  ('40000000-0000-4000-8000-000000000002', 'user@test.local', 'authenticated', 'authenticated');

insert into public.admins (user_id, full_name)
values ('40000000-0000-4000-8000-000000000001', 'Admin de prueba');

insert into public.trips (id, name, destination, start_date, end_date)
values ('41000000-0000-4000-8000-000000000001', 'Viaje acceso', 'Oaxaca',
        current_date + 10, current_date + 15);

insert into public.passengers (id, first_name, last_name)
values
  ('42000000-0000-4000-8000-000000000001', 'Rita', 'Lara'),
  ('42000000-0000-4000-8000-000000000002', 'Iván', 'Soto');

insert into public.bookings (id, trip_id, passenger_id, status)
values
  ('43000000-0000-4000-8000-000000000001', '41000000-0000-4000-8000-000000000001',
   '42000000-0000-4000-8000-000000000001', 'confirmed'),
  ('43000000-0000-4000-8000-000000000002', '41000000-0000-4000-8000-000000000001',
   '42000000-0000-4000-8000-000000000002', 'cancelled');

-- Function hardening ---------------------------------------------------------
select is_definer('public', 'issue_booking_access', array['uuid']::name[],
  'issue_booking_access is SECURITY DEFINER');
select is_definer('public', 'revoke_booking_access', array['uuid']::name[],
  'revoke_booking_access is SECURITY DEFINER');

select ok(
  (select bool_and('search_path=""' = any(p.proconfig))
     from pg_proc p
    where p.oid in ('public.issue_booking_access(uuid)'::regprocedure,
                    'public.revoke_booking_access(uuid)'::regprocedure)),
  'access functions pin an empty search_path'
);

select ok(
  not has_function_privilege('anon', 'public.issue_booking_access(uuid)', 'execute'),
  'anon cannot execute issue_booking_access'
);
select ok(
  not has_function_privilege('anon', 'public.revoke_booking_access(uuid)', 'execute'),
  'anon cannot execute revoke_booking_access'
);
select ok(
  not exists (
    select 1
      from pg_proc p, aclexplode(p.proacl) a
     where p.oid in ('public.issue_booking_access(uuid)'::regprocedure,
                     'public.revoke_booking_access(uuid)'::regprocedure)
       and a.grantee = 0
       and a.privilege_type = 'EXECUTE'
  ),
  'PUBLIC cannot execute the access functions'
);

-- Non-admin ------------------------------------------------------------------
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"40000000-0000-4000-8000-000000000002","role":"authenticated"}', true);

select throws_ok(
  $$ select * from public.issue_booking_access('43000000-0000-4000-8000-000000000001') $$,
  '42501', null, 'non-admin cannot issue access'
);
select throws_ok(
  $$ select public.revoke_booking_access('43000000-0000-4000-8000-000000000001') $$,
  '42501', null, 'non-admin cannot revoke access'
);
reset role;

-- Admin: first issue ---------------------------------------------------------
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"40000000-0000-4000-8000-000000000001","role":"authenticated"}', true);

select lives_ok(
  $$ select set_config('test.token_1', r.token, true),
            set_config('test.code_1', r.code, true),
            set_config('test.expires_1', r.access_expires_at::text, true)
       from public.issue_booking_access('43000000-0000-4000-8000-000000000001') r $$,
  'admin issues access'
);

select throws_ok(
  $$ select token_hash from public.bookings $$,
  '42501', null, 'API roles cannot read token_hash'
);
select throws_ok(
  $$ select code_hash from public.bookings $$,
  '42501', null, 'API roles cannot read code_hash'
);
select throws_ok(
  $$ update public.bookings set token_hash = 'x'
      where id = '43000000-0000-4000-8000-000000000001' $$,
  '42501', null, 'API roles cannot write token_hash'
);
select throws_ok(
  $$ update public.bookings set access_revoked_at = null
      where id = '43000000-0000-4000-8000-000000000001' $$,
  '42501', null, 'API roles cannot clear a revocation directly'
);
select throws_ok(
  $$ select * from public.issue_booking_access('43000000-0000-4000-8000-000000000002') $$,
  '22023', null, 'cancelled bookings cannot get access'
);
reset role;

select matches(current_setting('test.token_1'), '^[A-Za-z0-9_-]{43}$',
  'token is 32 bytes in base64url without padding');
select matches(current_setting('test.code_1'), '^[ABCDEFGHJKMNPQRSTUVWXYZ23456789]{8}$',
  'code has 8 unambiguous characters');

select is(
  (select token_hash from public.bookings where id = '43000000-0000-4000-8000-000000000001'),
  encode(extensions.digest(current_setting('test.token_1'), 'sha256'), 'hex'),
  'token is stored as its SHA-256 hash'
);
select is(
  (select code_hash from public.bookings where id = '43000000-0000-4000-8000-000000000001'),
  encode(extensions.digest(current_setting('test.code_1'), 'sha256'), 'hex'),
  'code is stored as its SHA-256 hash'
);
select is(
  current_setting('test.expires_1')::timestamptz,
  ((current_date + 15) + 30)::timestamptz,
  'access expires 30 days after the trip ends'
);
select is(
  (select count(*)::int from public.access_events
    where booking_id = '43000000-0000-4000-8000-000000000001' and event_type = 'access_issued'),
  1,
  'issue is logged'
);
select ok(
  (select not (metadata::text like '%' || current_setting('test.token_1') || '%'
            or metadata::text like '%' || current_setting('test.code_1') || '%')
     from public.access_events
    where booking_id = '43000000-0000-4000-8000-000000000001'),
  'access log contains neither token nor code'
);

-- Admin: revoke, then regenerate ---------------------------------------------
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"40000000-0000-4000-8000-000000000001","role":"authenticated"}', true);

select lives_ok(
  $$ select public.revoke_booking_access('43000000-0000-4000-8000-000000000001') $$,
  'admin revokes access'
);
select isnt(
  (select access_revoked_at from public.bookings where id = '43000000-0000-4000-8000-000000000001'),
  null,
  'revocation is recorded'
);
select lives_ok(
  $$ select set_config('test.token_2', r.token, true)
       from public.issue_booking_access('43000000-0000-4000-8000-000000000001') r $$,
  'admin regenerates access'
);
reset role;

select isnt(current_setting('test.token_2'), current_setting('test.token_1'),
  'regenerated token is new');
select results_eq(
  $$ select token_hash, access_revoked_at from public.bookings
      where id = '43000000-0000-4000-8000-000000000001' $$,
  $$ values (encode(extensions.digest(current_setting('test.token_2'), 'sha256'), 'hex'),
             null::timestamptz) $$,
  'regenerating replaces the old hash and clears the revocation'
);
select results_eq(
  $$ select event_type from public.access_events
      where booking_id = '43000000-0000-4000-8000-000000000001'
      order by created_at, event_type $$,
  -- created_at is the transaction time, so order falls back to event_type.
  array['access_issued', 'access_issued', 'access_revoked'],
  'every issue and revoke is logged'
);

select * from finish();
rollback;

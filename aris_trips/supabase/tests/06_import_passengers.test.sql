begin;
create extension if not exists pgtap with schema extensions;

select plan(16);

insert into auth.users (id, email, aud, role)
values
  ('60000000-0000-4000-8000-000000000001', 'admin@test.local', 'authenticated', 'authenticated'),
  ('60000000-0000-4000-8000-000000000002', 'user@test.local', 'authenticated', 'authenticated');

insert into public.admins (user_id, full_name)
values ('60000000-0000-4000-8000-000000000001', 'Admin de prueba');

insert into public.trips (id, name, destination, start_date, end_date)
values
  ('61000000-0000-4000-8000-000000000001', 'Viaje import', 'Puebla', current_date + 5, current_date + 8),
  ('61000000-0000-4000-8000-000000000002', 'Otro viaje', 'Taxco', current_date + 5, current_date + 8);

-- Existing passenger from another trip, to be reused.
insert into public.passengers (id, first_name, last_name, email)
values ('62000000-0000-4000-8000-000000000001', 'Ana', 'López', 'ana@example.com');

-- Function hardening ---------------------------------------------------------
select ok(
  not (select prosecdef from pg_proc
        where oid = 'public.import_trip_passengers(uuid, jsonb)'::regprocedure),
  'import runs with the caller rights (SECURITY INVOKER)'
);
select ok(
  (select 'search_path=""' = any(proconfig) from pg_proc
    where oid = 'public.import_trip_passengers(uuid, jsonb)'::regprocedure),
  'import pins an empty search_path'
);
select ok(
  not has_function_privilege('anon', 'public.import_trip_passengers(uuid, jsonb)', 'execute'),
  'anon cannot import'
);
select is(public.person_key('  José   ÑÚÑEZ '), 'jose nunez', 'person_key ignores case, accents and spaces');

-- Non-admin ------------------------------------------------------------------
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"60000000-0000-4000-8000-000000000002","role":"authenticated"}', true);
select throws_ok(
  $$ select * from public.import_trip_passengers('61000000-0000-4000-8000-000000000001',
       '[{"first_name":"X","last_name":"Y"}]') $$,
  '42501', null, 'non-admin cannot import'
);
reset role;

-- Admin ----------------------------------------------------------------------
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"60000000-0000-4000-8000-000000000001","role":"authenticated"}', true);

select results_eq(
  $$ select row_index, reused from public.import_trip_passengers(
       '61000000-0000-4000-8000-000000000001',
       '[{"first_name":" ana ","last_name":"LOPEZ","email":"ANA@example.com"},
         {"first_name":"Luis","last_name":"López","email":"ana@example.com"},
         {"first_name":"Rita","last_name":"Lara","phone":" 555 "}]') $$,
  $$ values (1, true), (2, false), (3, false) $$,
  'same email and name reuses; same email with another name creates'
);

select is(
  (select count(*)::int from public.passengers where lower(email) = 'ana@example.com'),
  2,
  'Ana was reused, Luis was created'
);
select is(
  (select count(*)::int from public.bookings
    where trip_id = '61000000-0000-4000-8000-000000000001'),
  3,
  'one booking per row'
);
select is(
  (select phone from public.passengers where first_name = 'Rita'),
  '555',
  'values are trimmed'
);
select is(
  (select email from public.passengers where first_name = 'Rita'),
  null,
  'missing email stays null'
);

-- Atomicity: a duplicate booking aborts the whole import.
select throws_ok(
  $$ select * from public.import_trip_passengers(
       '61000000-0000-4000-8000-000000000001',
       '[{"first_name":"Nuevo","last_name":"Pasajero"},
         {"first_name":"Ana","last_name":"López","email":"ana@example.com"}]') $$,
  '23505', 'row 2: passenger is already on this trip',
  'a passenger already on the trip aborts the import'
);
select is(
  (select count(*)::int from public.passengers where first_name = 'Nuevo'),
  0,
  'nothing from the failed import is kept'
);

select throws_ok(
  $$ select * from public.import_trip_passengers(
       '61000000-0000-4000-8000-000000000002',
       '[{"first_name":"Ok","last_name":"Fila"}, {"first_name":"","last_name":"Sin nombre"}]') $$,
  '22023', 'row 2: first and last name are required',
  'a row without name aborts the import'
);
select is(
  (select count(*)::int from public.bookings
    where trip_id = '61000000-0000-4000-8000-000000000002'),
  0,
  'no bookings were left on the other trip'
);

select throws_ok(
  $$ select * from public.import_trip_passengers(
       '61000000-0000-4000-8000-0000000000ff', '[]') $$,
  'P0002', null, 'unknown trip'
);
select throws_ok(
  $$ select * from public.import_trip_passengers(
       '61000000-0000-4000-8000-000000000001', '{}') $$,
  '22023', null, 'rows must be an array'
);
reset role;

select * from finish();
rollback;

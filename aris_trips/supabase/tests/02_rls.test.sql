begin;
create extension if not exists pgtap with schema extensions;

select plan(16);

-- Fixtures (as postgres).
insert into auth.users (id, email, aud, role)
values
  ('20000000-0000-4000-8000-000000000001', 'admin@test.local', 'authenticated', 'authenticated'),
  ('20000000-0000-4000-8000-000000000002', 'user@test.local', 'authenticated', 'authenticated');

insert into public.admins (user_id, full_name)
values ('20000000-0000-4000-8000-000000000001', 'Admin de prueba');

insert into public.trips (id, name, destination, start_date, end_date)
values ('21000000-0000-4000-8000-000000000001', 'Viaje RLS', 'Mérida',
        current_date + 10, current_date + 15);

insert into public.passengers (id, first_name, last_name)
values ('22000000-0000-4000-8000-000000000001', 'Rita', 'Lara');

insert into public.bookings (id, trip_id, passenger_id)
values ('23000000-0000-4000-8000-000000000001',
        '21000000-0000-4000-8000-000000000001',
        '22000000-0000-4000-8000-000000000001');

-- Only the first one is published and inside its window.
insert into public.promotions (title, status, published_at, expires_at)
values
  ('test-live', 'published', now() - interval '1 day', now() + interval '1 day'),
  ('test-draft', 'draft', null, null),
  ('test-scheduled', 'published', now() + interval '1 day', null),
  ('test-expired', 'published', now() - interval '2 days', now() - interval '1 day'),
  ('test-retired', 'retired', now() - interval '1 day', null);

-- anon -----------------------------------------------------------------------
set local role anon;
select set_config('request.jwt.claims', '{"role":"anon"}', true);

select results_eq(
  $$ select title from public.promotions where title like 'test-%' $$,
  array['test-live'],
  'anon only sees published promotions inside their window'
);
select throws_ok($$ select * from public.trips $$, '42501', null, 'anon cannot read trips');
select throws_ok($$ select * from public.passengers $$, '42501', null, 'anon cannot read passengers');
select throws_ok($$ select id from public.bookings $$, '42501', null, 'anon cannot read bookings');
select throws_ok(
  $$ insert into public.promotions (title) values ('hack') $$,
  '42501', null, 'anon cannot create promotions'
);
reset role;

-- authenticated, not admin ---------------------------------------------------
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"20000000-0000-4000-8000-000000000002","role":"authenticated"}', true);

select is((select count(*)::int from public.trips), 0, 'non-admin sees no trips');
select is((select count(*)::int from public.passengers), 0, 'non-admin sees no passengers');
select is((select count(*)::int from public.bookings), 0, 'non-admin sees no bookings');
select is((select count(*)::int from public.access_events), 0, 'non-admin sees no access events');
select is(
  (select count(*)::int from public.promotions where title like 'test-%'),
  1,
  'non-admin only sees live promotions'
);
select throws_ok(
  $$ insert into public.trips (name, destination, start_date, end_date)
     values ('X', 'Y', current_date, current_date) $$,
  '42501', null, 'non-admin cannot create trips'
);
reset role;

-- admin ----------------------------------------------------------------------
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"20000000-0000-4000-8000-000000000001","role":"authenticated"}', true);

select is((select count(*)::int from public.trips where id = '21000000-0000-4000-8000-000000000001'),
  1, 'admin reads trips');
select is((select count(*)::int from public.promotions where title like 'test-%'),
  5, 'admin reads every promotion');
select lives_ok(
  $$ insert into public.trips (name, destination, start_date, end_date)
     values ('Nuevo', 'Puebla', current_date, current_date + 2) $$,
  'admin creates trips'
);
select lives_ok(
  $$ update public.trips set status = 'published'
      where id = '21000000-0000-4000-8000-000000000001' $$,
  'admin updates trips'
);
select throws_ok(
  $$ insert into public.access_events (booking_id, event_type)
     values ('23000000-0000-4000-8000-000000000001', 'access_issued') $$,
  '42501', null, 'access events are written only by the access functions'
);
reset role;

select * from finish();
rollback;

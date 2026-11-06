begin;
create extension if not exists pgtap with schema extensions;

select plan(10);

insert into public.trips (id, name, destination, start_date, end_date)
values
  ('31000000-0000-4000-8000-00000000000a', 'Viaje A', 'Mérida', '2027-01-10', '2027-01-15'),
  ('31000000-0000-4000-8000-00000000000b', 'Viaje B', 'Tulum', '2027-02-10', '2027-02-15');

insert into public.passengers (id, first_name, last_name)
values ('32000000-0000-4000-8000-000000000001', 'Rita', 'Lara');

insert into public.bookings (id, trip_id, passenger_id)
values ('33000000-0000-4000-8000-000000000001',
        '31000000-0000-4000-8000-00000000000a',
        '32000000-0000-4000-8000-000000000001');

insert into public.flights (id, trip_id, airline, flight_number, origin, destination,
                            departs_at, departure_tz, arrives_at, arrival_tz)
values
  ('34000000-0000-4000-8000-00000000000a', '31000000-0000-4000-8000-00000000000a',
   'Volaris', 'Y4 100', 'MEX', 'MID',
   '2027-01-10 08:00-06', 'America/Mexico_City', '2027-01-10 10:00-06', 'America/Merida'),
  ('34000000-0000-4000-8000-00000000000b', '31000000-0000-4000-8000-00000000000b',
   'Volaris', 'Y4 200', 'MEX', 'TQO',
   '2027-02-10 08:00-06', 'America/Mexico_City', '2027-02-10 11:00-05', 'America/Cancun');

insert into public.lodgings (id, trip_id, name, check_in_at, check_out_at, timezone)
values
  ('35000000-0000-4000-8000-00000000000b', '31000000-0000-4000-8000-00000000000b',
   'Hotel B', '2027-02-10 15:00-05', '2027-02-15 12:00-05', 'America/Cancun');

select is(
  (select access_expires_at from public.bookings
    where id = '33000000-0000-4000-8000-000000000001'),
  ('2027-01-15'::date + 30)::timestamptz,
  'access_expires_at defaults to trip end date + 30 days'
);

select lives_ok(
  $$ insert into public.flight_assignments (booking_id, flight_id)
     values ('33000000-0000-4000-8000-000000000001', '34000000-0000-4000-8000-00000000000a') $$,
  'flight of the same trip can be assigned'
);

select throws_ok(
  $$ insert into public.flight_assignments (booking_id, flight_id)
     values ('33000000-0000-4000-8000-000000000001', '34000000-0000-4000-8000-00000000000b') $$,
  '23514', null, 'flight of another trip is rejected'
);

select throws_ok(
  $$ insert into public.lodging_assignments (booking_id, lodging_id)
     values ('33000000-0000-4000-8000-000000000001', '35000000-0000-4000-8000-00000000000b') $$,
  '23514', null, 'lodging of another trip is rejected'
);

select throws_ok(
  $$ insert into public.itinerary_items (trip_id, booking_id, starts_at, timezone, title)
     values ('31000000-0000-4000-8000-00000000000b', '33000000-0000-4000-8000-000000000001',
             now(), 'America/Cancun', 'X') $$,
  '23514', null, 'itinerary item with a booking of another trip is rejected'
);

select throws_ok(
  $$ insert into public.documents (trip_id, booking_id, title, storage_path)
     values ('31000000-0000-4000-8000-00000000000b', '33000000-0000-4000-8000-000000000001',
             'X', 'x/y.pdf') $$,
  '23514', null, 'document with a booking of another trip is rejected'
);

select throws_ok(
  $$ update public.bookings set trip_id = '31000000-0000-4000-8000-00000000000b'
      where id = '33000000-0000-4000-8000-000000000001' $$,
  '23514', null, 'a booking cannot move to another trip'
);

select throws_ok(
  $$ insert into public.lodgings (trip_id, name, check_in_at, check_out_at, timezone)
     values ('31000000-0000-4000-8000-00000000000a', 'X', now(), now() + interval '1 day',
             'Mexico/Not_A_Zone') $$,
  '23514', null, 'invalid IANA time zone is rejected'
);

select throws_ok(
  $$ insert into public.promotions (title, price_from, currency)
     values ('X', 100, 'mxn') $$,
  '23514', null, 'currency must be an uppercase ISO 4217 code'
);

select throws_ok(
  $$ insert into public.trips (name, destination, start_date, end_date)
     values ('X', 'Y', '2027-01-10', '2027-01-01') $$,
  '23514', null, 'trip cannot end before it starts'
);

select * from finish();
rollback;

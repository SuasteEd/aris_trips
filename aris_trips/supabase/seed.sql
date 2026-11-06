-- Development seed. Idempotent: safe to run more than once.
--
-- No passwords live here. Create the admin user from the Supabase dashboard
-- (Authentication > Users) with the email below, then run the seed: the user
-- is promoted to admin only if it already exists.

insert into public.admins (user_id, full_name)
select u.id, 'Administrador de desarrollo'
  from auth.users u
 where u.email = 'admin@aristrips.dev'
on conflict (user_id) do nothing;

insert into public.trips (id, name, destination, description, start_date, end_date, status)
values (
  '00000000-0000-4000-8000-000000000001',
  'Cancún Primavera 2027',
  'Cancún, Quintana Roo',
  'Viaje grupal de cinco noches con traslados incluidos.',
  '2027-03-20', '2027-03-25', 'published'
)
on conflict (id) do nothing;

insert into public.passengers (id, first_name, last_name, email, phone)
values
  ('00000000-0000-4000-8000-000000000101', 'Ana', 'López', 'ana.lopez@example.com', '+525511111111'),
  ('00000000-0000-4000-8000-000000000102', 'Luis', 'Martínez', 'luis.martinez@example.com', '+525522222222')
on conflict (id) do nothing;

insert into public.bookings (id, trip_id, passenger_id, status)
values
  ('00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000001', '00000000-0000-4000-8000-000000000101', 'confirmed'),
  ('00000000-0000-4000-8000-000000000202', '00000000-0000-4000-8000-000000000001', '00000000-0000-4000-8000-000000000102', 'confirmed')
on conflict (id) do nothing;

insert into public.flights (id, trip_id, airline, flight_number, origin, destination,
                            departs_at, departure_tz, arrives_at, arrival_tz, terminal)
values
  ('00000000-0000-4000-8000-000000000301', '00000000-0000-4000-8000-000000000001',
   'Aeroméxico', 'AM 523', 'MEX', 'CUN',
   '2027-03-20 08:00:00-06', 'America/Mexico_City',
   '2027-03-20 11:15:00-05', 'America/Cancun', 'T2'),
  ('00000000-0000-4000-8000-000000000302', '00000000-0000-4000-8000-000000000001',
   'Aeroméxico', 'AM 530', 'CUN', 'MEX',
   '2027-03-25 17:00:00-05', 'America/Cancun',
   '2027-03-25 18:20:00-06', 'America/Mexico_City', 'T3')
on conflict (id) do nothing;

insert into public.lodgings (id, trip_id, name, address, latitude, longitude,
                             check_in_at, check_out_at, timezone)
values (
  '00000000-0000-4000-8000-000000000401', '00000000-0000-4000-8000-000000000001',
  'Hotel Laguna Azul', 'Blvd. Kukulcán km 12, Zona Hotelera, Cancún',
  21.094500, -86.767300,
  '2027-03-20 15:00:00-05', '2027-03-25 12:00:00-05', 'America/Cancun'
)
on conflict (id) do nothing;

insert into public.flight_assignments (booking_id, flight_id, seat, record_locator)
values
  ('00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000301', '12A', 'QWERTY'),
  ('00000000-0000-4000-8000-000000000202', '00000000-0000-4000-8000-000000000301', '12B', 'QWERTY')
on conflict (booking_id, flight_id) do nothing;

insert into public.lodging_assignments (booking_id, lodging_id, room, confirmation_number)
values
  ('00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000401', '1204', 'LA-55821'),
  ('00000000-0000-4000-8000-000000000202', '00000000-0000-4000-8000-000000000401', '1204', 'LA-55821')
on conflict (booking_id, lodging_id) do nothing;

insert into public.itinerary_items (id, trip_id, booking_id, starts_at, ends_at, timezone, title, location)
values
  ('00000000-0000-4000-8000-000000000501', '00000000-0000-4000-8000-000000000001', null,
   '2027-03-21 09:00:00-05', '2027-03-21 17:00:00-05', 'America/Cancun',
   'Excursión a Isla Mujeres', 'Muelle Playa Langosta'),
  ('00000000-0000-4000-8000-000000000502', '00000000-0000-4000-8000-000000000001',
   '00000000-0000-4000-8000-000000000201',
   '2027-03-22 10:00:00-05', '2027-03-22 11:00:00-05', 'America/Cancun',
   'Spa (reservación individual)', 'Hotel Laguna Azul')
on conflict (id) do nothing;

insert into public.promotions (id, title, description, destination, starts_on, ends_on,
                               price_from, currency, whatsapp_url, status, published_at, expires_at)
values (
  '00000000-0000-4000-8000-000000000601',
  'Oaxaca en Día de Muertos',
  'Cuatro días con hospedaje en el centro histórico.',
  'Oaxaca, Oaxaca', '2027-10-30', '2027-11-02',
  12500.00, 'MXN', 'https://wa.me/525500000000',
  'published', '2026-11-01 00:00:00-06', '2027-10-15 00:00:00-06'
)
on conflict (id) do nothing;

begin;
create extension if not exists pgtap with schema extensions;

select plan(23);

select has_table('public'::name, t::name, format('table %s exists', t))
  from unnest(array[
    'admins', 'trips', 'passengers', 'bookings', 'flights', 'lodgings',
    'flight_assignments', 'lodging_assignments', 'itinerary_items',
    'documents', 'promotions', 'access_events'
  ]) as t;

select is(
  (select count(*)::int
     from pg_class c
     join pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'public'
      and c.relkind in ('r', 'p')
      and not c.relrowsecurity),
  0,
  'RLS is enabled on every public table'
);

select col_is_unique('public', 'bookings', array['trip_id', 'passenger_id'],
  'bookings are unique per trip and passenger');
select col_is_unique('public', 'flight_assignments', array['booking_id', 'flight_id'],
  'flight assignments are unique per booking and flight');
select col_is_unique('public', 'lodging_assignments', array['booking_id', 'lodging_id'],
  'lodging assignments are unique per booking and lodging');

select col_type_is('public', 'promotions', 'price_from', 'numeric(12,2)',
  'money uses numeric(12,2)');
select col_type_is('public', 'flights', 'departs_at', 'timestamp with time zone',
  'flight times are timestamptz');

select is(
  (select count(*)::int
     from information_schema.columns
    where table_schema = 'public'
      and column_name in ('passport', 'passport_number', 'birth_date', 'date_of_birth',
                          'card_number', 'payment_method')),
  0,
  'no passport, birth date or payment columns'
);

select is(
  (select count(*)::int
     from information_schema.columns
    where table_schema = 'public'
      and table_name in ('trips', 'passengers', 'bookings', 'flights', 'lodgings',
                         'flight_assignments', 'lodging_assignments', 'itinerary_items',
                         'documents', 'promotions')
      and column_name in ('created_at', 'updated_at')),
  20,
  'business tables have created_at and updated_at'
);

select is_definer('public', 'is_admin', '{}'::name[], 'is_admin is SECURITY DEFINER');

select ok(
  (select 'search_path=""' = any(p.proconfig)
     from pg_proc p
    where p.oid = 'public.is_admin()'::regprocedure),
  'is_admin has a fixed empty search_path'
);

select is(
  (select count(*)::int
     from pg_proc p
     join pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'public'
      and p.prosecdef
      and (p.proconfig is null
           or not exists (select 1 from unnest(p.proconfig) c where c like 'search_path=%'))),
  0,
  'every SECURITY DEFINER function in public pins search_path'
);

select * from finish();
rollback;

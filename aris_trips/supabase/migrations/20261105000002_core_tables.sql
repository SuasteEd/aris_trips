-- Business tables. Every timestamp is timestamptz paired with an IANA zone.

create table public.trips (
  id uuid primary key default gen_random_uuid(),
  name text not null check (length(trim(name)) > 0),
  destination text not null check (length(trim(destination)) > 0),
  description text,
  cover_path text,
  start_date date not null,
  end_date date not null,
  status text not null default 'draft'
    check (status in ('draft', 'published', 'archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint trips_dates_check check (end_date >= start_date)
);

create index trips_status_start_date_idx on public.trips (status, start_date);

create table public.passengers (
  id uuid primary key default gen_random_uuid(),
  first_name text not null check (length(trim(first_name)) > 0),
  last_name text not null check (length(trim(last_name)) > 0),
  email text check (email is null or email ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
  phone text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.bookings (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid not null references public.trips (id) on delete cascade,
  passenger_id uuid not null references public.passengers (id) on delete restrict,
  status text not null default 'confirmed'
    check (status in ('pending', 'confirmed', 'cancelled')),
  token_hash text unique,
  code_hash text,
  access_expires_at timestamptz,
  access_revoked_at timestamptz,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint bookings_trip_passenger_key unique (trip_id, passenger_id)
);

create index bookings_passenger_id_idx on public.bookings (passenger_id);

create table public.flights (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid not null references public.trips (id) on delete cascade,
  airline text not null check (length(trim(airline)) > 0),
  flight_number text not null check (length(trim(flight_number)) > 0),
  origin text not null,
  destination text not null,
  departs_at timestamptz not null,
  departure_tz text not null check (public.is_valid_timezone(departure_tz)),
  arrives_at timestamptz not null,
  arrival_tz text not null check (public.is_valid_timezone(arrival_tz)),
  terminal text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint flights_times_check check (arrives_at > departs_at)
);

create index flights_trip_id_idx on public.flights (trip_id, departs_at);

create table public.lodgings (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid not null references public.trips (id) on delete cascade,
  name text not null check (length(trim(name)) > 0),
  address text,
  latitude numeric(9,6) check (latitude between -90 and 90),
  longitude numeric(9,6) check (longitude between -180 and 180),
  check_in_at timestamptz not null,
  check_out_at timestamptz not null,
  timezone text not null check (public.is_valid_timezone(timezone)),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint lodgings_times_check check (check_out_at > check_in_at)
);

create index lodgings_trip_id_idx on public.lodgings (trip_id, check_in_at);

create table public.flight_assignments (
  id uuid primary key default gen_random_uuid(),
  booking_id uuid not null references public.bookings (id) on delete cascade,
  flight_id uuid not null references public.flights (id) on delete cascade,
  seat text,
  record_locator text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint flight_assignments_booking_flight_key unique (booking_id, flight_id)
);

create index flight_assignments_flight_id_idx on public.flight_assignments (flight_id);

create table public.lodging_assignments (
  id uuid primary key default gen_random_uuid(),
  booking_id uuid not null references public.bookings (id) on delete cascade,
  lodging_id uuid not null references public.lodgings (id) on delete cascade,
  room text,
  confirmation_number text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint lodging_assignments_booking_lodging_key unique (booking_id, lodging_id)
);

create index lodging_assignments_lodging_id_idx on public.lodging_assignments (lodging_id);

create table public.itinerary_items (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid not null references public.trips (id) on delete cascade,
  -- Null means the item applies to the whole group.
  booking_id uuid references public.bookings (id) on delete cascade,
  starts_at timestamptz not null,
  ends_at timestamptz,
  timezone text not null check (public.is_valid_timezone(timezone)),
  title text not null check (length(trim(title)) > 0),
  description text,
  location text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint itinerary_items_times_check check (ends_at is null or ends_at >= starts_at)
);

create index itinerary_items_trip_id_idx on public.itinerary_items (trip_id, starts_at);
create index itinerary_items_booking_id_idx on public.itinerary_items (booking_id);

create table public.documents (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid not null references public.trips (id) on delete cascade,
  -- Null means the document is shared with the whole group.
  booking_id uuid references public.bookings (id) on delete cascade,
  title text not null check (length(trim(title)) > 0),
  kind text not null default 'other'
    check (kind in ('ticket', 'voucher', 'insurance', 'itinerary', 'other')),
  storage_path text not null unique,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index documents_trip_id_idx on public.documents (trip_id);
create index documents_booking_id_idx on public.documents (booking_id);

create table public.promotions (
  id uuid primary key default gen_random_uuid(),
  title text not null check (length(trim(title)) > 0),
  description text,
  image_path text,
  destination text,
  starts_on date,
  ends_on date,
  price_from numeric(12,2) check (price_from is null or price_from >= 0),
  currency char(3) check (currency is null or currency ~ '^[A-Z]{3}$'),
  whatsapp_url text check (whatsapp_url is null or whatsapp_url ~ '^https://'),
  status text not null default 'draft'
    check (status in ('draft', 'published', 'retired')),
  -- A future published_at schedules the promotion.
  published_at timestamptz,
  expires_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint promotions_dates_check check (ends_on is null or starts_on is null or ends_on >= starts_on),
  constraint promotions_window_check check (expires_at is null or published_at is null or expires_at > published_at),
  constraint promotions_price_currency_check check ((price_from is null) = (currency is null)),
  constraint promotions_published_at_check check (status <> 'published' or published_at is not null)
);

create index promotions_public_idx on public.promotions (status, published_at, expires_at);

create table public.access_events (
  id uuid primary key default gen_random_uuid(),
  booking_id uuid not null references public.bookings (id) on delete cascade,
  event_type text not null check (event_type in ('access_issued', 'access_revoked')),
  created_at timestamptz not null default now(),
  metadata jsonb not null default '{}'::jsonb
);

create index access_events_booking_id_idx on public.access_events (booking_id, created_at desc);

-- updated_at triggers for business tables.
do $$
declare
  t text;
begin
  foreach t in array array[
    'trips', 'passengers', 'bookings', 'flights', 'lodgings',
    'flight_assignments', 'lodging_assignments', 'itinerary_items',
    'documents', 'promotions'
  ]
  loop
    execute format(
      'create trigger set_updated_at before update on public.%I
         for each row execute function public.set_updated_at()', t);
  end loop;
end;
$$;

-- Default access expiry: trip end date + 30 days.
create or replace function public.set_booking_access_expiry()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.access_expires_at is null then
    select (t.end_date + 30)::timestamptz
      into new.access_expires_at
      from public.trips t
     where t.id = new.trip_id;
  end if;
  return new;
end;
$$;

create trigger set_booking_access_expiry
  before insert on public.bookings
  for each row execute function public.set_booking_access_expiry();

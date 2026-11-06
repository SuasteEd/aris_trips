-- Assignments, itinerary items and documents must stay inside one trip.

create or replace function public.check_flight_assignment_trip()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if not exists (
    select 1
      from public.bookings b
      join public.flights f on f.trip_id = b.trip_id
     where b.id = new.booking_id and f.id = new.flight_id
  ) then
    raise exception 'flight % does not belong to the trip of booking %',
      new.flight_id, new.booking_id
      using errcode = '23514';
  end if;
  return new;
end;
$$;

create trigger check_flight_assignment_trip
  before insert or update of booking_id, flight_id on public.flight_assignments
  for each row execute function public.check_flight_assignment_trip();

create or replace function public.check_lodging_assignment_trip()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if not exists (
    select 1
      from public.bookings b
      join public.lodgings l on l.trip_id = b.trip_id
     where b.id = new.booking_id and l.id = new.lodging_id
  ) then
    raise exception 'lodging % does not belong to the trip of booking %',
      new.lodging_id, new.booking_id
      using errcode = '23514';
  end if;
  return new;
end;
$$;

create trigger check_lodging_assignment_trip
  before insert or update of booking_id, lodging_id on public.lodging_assignments
  for each row execute function public.check_lodging_assignment_trip();

-- Shared by itinerary_items and documents: an optional booking of the same trip.
create or replace function public.check_booking_in_trip()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.booking_id is not null and not exists (
    select 1 from public.bookings b
     where b.id = new.booking_id and b.trip_id = new.trip_id
  ) then
    raise exception 'booking % does not belong to trip %',
      new.booking_id, new.trip_id
      using errcode = '23514';
  end if;
  return new;
end;
$$;

create trigger check_booking_in_trip
  before insert or update of trip_id, booking_id on public.itinerary_items
  for each row execute function public.check_booking_in_trip();

create trigger check_booking_in_trip
  before insert or update of trip_id, booking_id on public.documents
  for each row execute function public.check_booking_in_trip();

-- Moving a booking, flight or lodging to another trip would orphan its
-- assignments, so trip_id is immutable on those tables.
create or replace function public.prevent_trip_change()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.trip_id is distinct from old.trip_id then
    raise exception 'trip_id cannot be changed on %', tg_table_name
      using errcode = '23514';
  end if;
  return new;
end;
$$;

create trigger prevent_trip_change
  before update of trip_id on public.bookings
  for each row execute function public.prevent_trip_change();

create trigger prevent_trip_change
  before update of trip_id on public.flights
  for each row execute function public.prevent_trip_change();

create trigger prevent_trip_change
  before update of trip_id on public.lodgings
  for each row execute function public.prevent_trip_change();

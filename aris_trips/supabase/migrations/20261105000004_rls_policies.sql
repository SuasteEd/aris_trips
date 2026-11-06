-- Row Level Security: admins manage everything; anon only reads live promotions.

do $$
declare
  t text;
begin
  foreach t in array array[
    'admins', 'trips', 'passengers', 'bookings', 'flights', 'lodgings',
    'flight_assignments', 'lodging_assignments', 'itinerary_items',
    'documents', 'promotions', 'access_events'
  ]
  loop
    execute format('alter table public.%I enable row level security', t);
  end loop;
end;
$$;

-- Defense in depth: anon never touches private tables, even if a policy slips.
revoke all on table
  public.admins, public.trips, public.passengers, public.bookings,
  public.flights, public.lodgings, public.flight_assignments,
  public.lodging_assignments, public.itinerary_items, public.documents,
  public.access_events
from anon;

revoke insert, update, delete, truncate on table public.promotions from anon;

-- The access log is written only by SECURITY DEFINER functions.
revoke insert, update, delete, truncate on table public.access_events from authenticated;

-- Admins are created by seed or from the dashboard, never from the app.
create policy admins_select_admin on public.admins
  for select to authenticated
  using ((select public.is_admin()));

-- Full access for admins on private business tables.
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
      'create policy %I on public.%I for all to authenticated
         using ((select public.is_admin()))
         with check ((select public.is_admin()))',
      t || '_all_admin', t);
  end loop;
end;
$$;

-- The access log is append-only through the access functions.
create policy access_events_select_admin on public.access_events
  for select to authenticated
  using ((select public.is_admin()));

-- Published promotions inside their publication window are public.
create policy promotions_select_live on public.promotions
  for select to anon, authenticated
  using (
    status = 'published'
    and published_at <= now()
    and (expires_at is null or expires_at > now())
  );

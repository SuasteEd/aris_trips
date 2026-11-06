-- Extensions, shared helpers and the admins table.

create extension if not exists pgcrypto with schema extensions;

-- Keeps updated_at in sync on every update.
create or replace function public.set_updated_at()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

-- True when the value is a time zone name known to Postgres (IANA database).
create or replace function public.is_valid_timezone(p_tz text)
returns boolean
language sql
stable
set search_path = ''
as $$
  select exists (select 1 from pg_catalog.pg_timezone_names where name = p_tz);
$$;

create table public.admins (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users (id) on delete cascade,
  full_name text not null check (length(trim(full_name)) > 0),
  created_at timestamptz not null default now()
);

comment on table public.admins is 'Agency staff allowed to use the admin app.';

-- Runs as owner so policies can check membership without exposing admins.
create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.admins a where a.user_id = (select auth.uid())
  );
$$;

revoke execute on function public.is_admin() from public;
grant execute on function public.is_admin() to anon, authenticated;

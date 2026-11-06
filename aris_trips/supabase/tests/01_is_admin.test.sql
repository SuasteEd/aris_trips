begin;
create extension if not exists pgtap with schema extensions;

select plan(4);

insert into auth.users (id, email, aud, role)
values
  ('10000000-0000-4000-8000-000000000001', 'admin@test.local', 'authenticated', 'authenticated'),
  ('10000000-0000-4000-8000-000000000002', 'user@test.local', 'authenticated', 'authenticated');

insert into public.admins (user_id, full_name)
values ('10000000-0000-4000-8000-000000000001', 'Admin de prueba');

-- anon
set local role anon;
select set_config('request.jwt.claims', '{"role":"anon"}', true);
select is(public.is_admin(), false, 'anon is not admin');
reset role;

-- authenticated, not admin
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"10000000-0000-4000-8000-000000000002","role":"authenticated"}', true);
select is(public.is_admin(), false, 'authenticated user without admins row is not admin');
reset role;

-- admin
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"10000000-0000-4000-8000-000000000001","role":"authenticated"}', true);
select is(public.is_admin(), true, 'user with admins row is admin');
select throws_ok(
  $$ insert into public.admins (user_id, full_name)
     values ('10000000-0000-4000-8000-000000000002', 'Intruso') $$,
  '42501',
  null,
  'admins cannot be created from the API'
);
reset role;

select * from finish();
rollback;

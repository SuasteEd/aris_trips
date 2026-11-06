begin;
create extension if not exists pgtap with schema extensions;

select plan(6);

insert into auth.users (id, email, aud, role)
values
  ('50000000-0000-4000-8000-000000000001', 'admin@test.local', 'authenticated', 'authenticated'),
  ('50000000-0000-4000-8000-000000000002', 'user@test.local', 'authenticated', 'authenticated');

insert into public.admins (user_id, full_name)
values ('50000000-0000-4000-8000-000000000001', 'Admin de prueba');

select is(
  (select public from storage.buckets where id = 'public-media'),
  true,
  'public-media bucket exists and is public'
);
select is(
  (select public from storage.buckets where id = 'documents'),
  false,
  'documents bucket exists and is private'
);

select is(
  (select count(*)::int
     from pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname in (
        'public_media_insert_admin', 'public_media_update_admin', 'public_media_delete_admin',
        'documents_select_admin', 'documents_insert_admin', 'documents_update_admin',
        'documents_delete_admin'
      )),
  7,
  'storage policies are installed'
);

-- Non-admin cannot upload to either bucket.
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"50000000-0000-4000-8000-000000000002","role":"authenticated"}', true);

select throws_ok(
  $$ insert into storage.objects (bucket_id, name) values ('documents', 'test/x.pdf') $$,
  '42501', null, 'non-admin cannot upload documents'
);
select throws_ok(
  $$ insert into storage.objects (bucket_id, name) values ('public-media', 'test/x.png') $$,
  '42501', null, 'non-admin cannot upload public media'
);
reset role;

-- Admin can upload a private document.
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"50000000-0000-4000-8000-000000000001","role":"authenticated"}', true);

select lives_ok(
  $$ insert into storage.objects (bucket_id, name) values ('documents', 'test/admin.pdf') $$,
  'admin uploads documents'
);
reset role;

select * from finish();
rollback;

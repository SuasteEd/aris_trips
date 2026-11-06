-- Storage buckets: public media (covers, promotions) and private documents.

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values
  ('public-media', 'public-media', true, 5242880,
   array['image/jpeg', 'image/png', 'image/webp']),
  ('documents', 'documents', false, 20971520,
   array['application/pdf', 'image/jpeg', 'image/png', 'image/webp'])
on conflict (id) do update
  set public = excluded.public,
      file_size_limit = excluded.file_size_limit,
      allowed_mime_types = excluded.allowed_mime_types;

-- public-media: anyone can read via the public URL; only admins write.
create policy public_media_insert_admin on storage.objects
  for insert to authenticated
  with check (bucket_id = 'public-media' and (select public.is_admin()));

create policy public_media_update_admin on storage.objects
  for update to authenticated
  using (bucket_id = 'public-media' and (select public.is_admin()))
  with check (bucket_id = 'public-media' and (select public.is_admin()));

create policy public_media_delete_admin on storage.objects
  for delete to authenticated
  using (bucket_id = 'public-media' and (select public.is_admin()));

-- documents: private, admins only.
create policy documents_select_admin on storage.objects
  for select to authenticated
  using (bucket_id = 'documents' and (select public.is_admin()));

create policy documents_insert_admin on storage.objects
  for insert to authenticated
  with check (bucket_id = 'documents' and (select public.is_admin()));

create policy documents_update_admin on storage.objects
  for update to authenticated
  using (bucket_id = 'documents' and (select public.is_admin()))
  with check (bucket_id = 'documents' and (select public.is_admin()));

create policy documents_delete_admin on storage.objects
  for delete to authenticated
  using (bucket_id = 'documents' and (select public.is_admin()));

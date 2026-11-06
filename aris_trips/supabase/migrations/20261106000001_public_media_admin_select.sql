-- Storage needs SELECT on an object to remove or replace it through the API.
-- public-media is served by public URL without RLS, so this only lets admins
-- list and delete objects (e.g. the previous trip cover).

create policy public_media_select_admin on storage.objects
  for select to authenticated
  using (bucket_id = 'public-media' and (select public.is_admin()));

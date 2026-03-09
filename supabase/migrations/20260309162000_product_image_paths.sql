alter table public.product_images
add column if not exists local_path text,
add column if not exists storage_object_path text;

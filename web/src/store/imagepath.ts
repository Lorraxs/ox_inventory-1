export let imagepath = 'https://supabase.lorraxs.dev/storage/v1/object/public/items';

export function setImagePath(path: string) {
  if (path && path !== '') imagepath = path;
}

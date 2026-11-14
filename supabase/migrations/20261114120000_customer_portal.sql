-- Reproducible schema for the Supabase customer portal.
create table if not exists public.customer_profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  phone text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists public.service_requests (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid not null references auth.users(id) on delete cascade,
  service_type text not null check (char_length(service_type) between 1 and 120),
  details text not null check (char_length(details) between 1 and 5000),
  status text not null default 'received' check (status in ('received','in_review','awaiting_customer','completed','closed')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists service_requests_customer_id_created_at_idx on public.service_requests (customer_id, created_at desc);
alter table public.customer_profiles enable row level security;
alter table public.service_requests enable row level security;
revoke all on public.customer_profiles from anon, authenticated;
revoke all on public.service_requests from anon, authenticated;
grant select, insert, update on public.customer_profiles to authenticated;
grant select, insert on public.service_requests to authenticated;
create policy "Customers read own profile" on public.customer_profiles for select to authenticated using ((select auth.uid()) = id);
create policy "Customers create own profile" on public.customer_profiles for insert to authenticated with check ((select auth.uid()) = id);
create policy "Customers update own profile" on public.customer_profiles for update to authenticated using ((select auth.uid()) = id) with check ((select auth.uid()) = id);
create policy "Customers read own service requests" on public.service_requests for select to authenticated using ((select auth.uid()) = customer_id);
create policy "Customers submit own service requests" on public.service_requests for insert to authenticated with check ((select auth.uid()) = customer_id);
create or replace function public.handle_new_customer() returns trigger language plpgsql security definer set search_path = '' as $$
begin
  insert into public.customer_profiles (id, display_name)
  values (new.id, coalesce(new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name'))
  on conflict (id) do nothing;
  return new;
end;
$$;
revoke all on function public.handle_new_customer() from public, anon, authenticated;
drop trigger if exists on_auth_user_created_customer on auth.users;
create trigger on_auth_user_created_customer after insert on auth.users for each row execute procedure public.handle_new_customer();
create or replace function public.set_updated_at() returns trigger language plpgsql set search_path = '' as $$
begin new.updated_at = now(); return new; end;
$$;
revoke all on function public.set_updated_at() from public, anon, authenticated;
create trigger customer_profiles_set_updated_at before update on public.customer_profiles for each row execute procedure public.set_updated_at();
create trigger service_requests_set_updated_at before update on public.service_requests for each row execute procedure public.set_updated_at();

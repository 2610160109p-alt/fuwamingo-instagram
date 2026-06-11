create table if not exists public.cafe_sns_state (
  key text primary key,
  data jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.cafe_sns_state enable row level security;

drop policy if exists "public read cafe sns state" on public.cafe_sns_state;
create policy "public read cafe sns state"
on public.cafe_sns_state
for select
to anon
using (true);

drop policy if exists "public insert cafe sns state" on public.cafe_sns_state;
create policy "public insert cafe sns state"
on public.cafe_sns_state
for insert
to anon
with check (true);

drop policy if exists "public update cafe sns state" on public.cafe_sns_state;
create policy "public update cafe sns state"
on public.cafe_sns_state
for update
to anon
using (true)
with check (true);

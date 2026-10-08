create table if not exists happy_answers (
  entry_id     bigint generated always as identity primary key,
  answer       text not null check (char_length(answer) between 1 and 140),
  created_date timestamptz not null default now()
);
alter table happy_answers enable row level security;
create policy "anyone can add"  on happy_answers for insert to anon with check (true);
create policy "anyone can read" on happy_answers for select to anon using (true);

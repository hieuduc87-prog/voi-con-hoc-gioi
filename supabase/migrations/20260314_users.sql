CREATE TABLE IF NOT EXISTS users (
  id bigint generated always as identity primary key,
  username text unique not null,
  password text not null,
  email text,
  display_name text not null,
  gender text not null check (gender in ('boy','girl')),
  pet text not null check (pet in ('cat','corgi')),
  grade int not null default 1 check (grade in (1,3)),
  created_at timestamptz default now()
);

ALTER TABLE users ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow all for anon" ON users FOR ALL USING (true) WITH CHECK (true);
GRANT ALL ON users TO anon;
GRANT ALL ON users TO authenticated;

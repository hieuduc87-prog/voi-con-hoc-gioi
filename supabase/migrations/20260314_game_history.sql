CREATE TABLE IF NOT EXISTS game_history(
  id bigint generated always as identity primary key,
  player_id text not null,
  subject text,
  level int,
  correct int,
  total int,
  stars int,
  xp_earned int,
  played_at timestamptz default now()
);

ALTER TABLE game_history ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow all for anon" ON game_history FOR ALL USING (true) WITH CHECK (true);
GRANT ALL ON game_history TO anon;
GRANT ALL ON game_history TO authenticated;

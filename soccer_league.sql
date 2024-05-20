DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

/c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL UNIQUE,
    region TEXT NOT NULL
    wins INTEGER DEFAULT 0
);

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    stadium TEXT NOT NULL UNIQUE,
    team_1 INTEGER NOT NULL REFERENCES team ON DELETE SET NULL,
    team_2 INTEGER NOT NULL REFERENCES team ON DELETE SET NULL,
    referee_id INTEGER NOT NULL REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    game_id INTEGER REFERENCES games ON DELETE SET NULL,
    goals_scored INTEGER DEFAULT 0
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    season TEXT NOT Null,
    season_start DATE NOT NULL,
    season_end DATE NOT NULL
);

CREATE TABLE rankings(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES team ON DELETE SET NULL,
    game_id INTEGER REFERENCES games ON DELETE SET NULL,
    results TEXT DEFAULT 'pending'
)
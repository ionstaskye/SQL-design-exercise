DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

/c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    prefered_region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL,
    title TEXT,
    info TEXT,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    location_id INTEGER REFERENCES region ON DELETE SET NULL,
    region_id INTEGER REFERENCES region ON DELETE SET NULL
);
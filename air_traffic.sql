-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE Airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL

)

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INTEGER NOT NULL REFERENCES passenger ON DELETE CASCADE
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER NOT NULL REFERENCES airlines ON DELETE CASCADE,
  from_city INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
  from_country INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE,
  to_city INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
  to_country INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE,
);

INSERT INTO TABLE passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO cities
  (name)
VALUES  
  ("Washington DC"),
  ("Seattle"),
  ("Tokyo"),
  ("London"),
  ("Los Angelas"),
  ("Las Vegas"),
  ("Mexico City"),
  ("Paris"),
  ("Casablanca"),
  ("Dubai"),
  ("Beijing"),
  ("New York"),
  ("Charlotte"),
  ("Cedar Rapids"),
  ("Chicago"),
  ("New Orleans"),
  ("Sao Paolo"),
  ("Santiago");

INSERT INTO countries
  (name)
VALUES
  ("United States"),
  ("Japan"),
  ("United Kingdom"),
  ("Mexico"),
  ("France"),
  ("Morocco"),
  ("UAE"),
  ("China"),
  ("Brazil"),
  ("Chile");

INSERT INTO airlines
  (name)
VALUES
  ("United"),
  ("British Airways"),
  ("Delta"),
  ("TUI Fly Belgium"),
  ("Air China"),
  ("American Airlines"),
  ("Avianca Brasil"):

INSERT INTO tickets
  (passenger, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),
  (5, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),
  (6, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),
  (7, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
  (6, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),
  (8, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);

  CREATE INDEX airline_name ON airlines (name);
  CREATE INDEX city_name ON cities (name);
  CREATE INDEX country_name ON countries(name);
  CREATE INDEX passenger_name ON passengers(last_name)
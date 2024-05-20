-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album INTEGER NOT NULL REFERENCES albums ON DELETE SET NULL,
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers_songs
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
  producers_id INTEGER NOT NULL REFERENCES producers ON DELETE SET NULL,
);

CREATE TABLE artists_songs
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
  artist_id INTEGER NOT NULL REFERENCES artists ON DELETE SET NULL,
)

INSERT INTO albums
  (name)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

INSERT INTO producers
  (name)
VALUES
  ("Dust Brothers"),
  ("Stephen Lironi"),
  ("Roy Thomas Baker"),
  ("Walter Afanasieff"),
  ("Benjamin Rice"),
  ("Rick Parashar"),
  ("Al Shux"),
  ("Shellback"),
  ("Cirkut"),
  ("Max Martin"),
  ("Benny Blanco"),
  ("The Matrix"),
  ("Darkchild");

INSERT INTO artists
  (name)
VALUES
  ("Hanson"),
  ("Queen"),
  ("Mariah Cary"),
  ("Boyz II Men"),
  ("Lady Gaga"),
  ("Bradley Cooper"),
  ("Nickelback"),
  ("Jay Z"),
  ("Alicia Keys"),
  ("Katy Perry"),
  ("Juicy J"),
  ("Marron 5"),
  ("Christina Aguilera"),
  ("Avril Lavigne"),
  ("Destiny's Child");

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997',1),
  ('Bohemian Rhapsody', 355, '10-31-1975',2),
  ('One Sweet Day', 282, '11-14-1995',3),
  ('Shallow', 216, '09-27-2018', 4),
  ('How You Remind Me', 223, '08-21-2001', 5),
  ('New York State of Mind', 276, '10-20-2009', 6),
  ('Dark Horse', 215, '12-17-2013',7),
  ('Moves Like Jagger', 201, '06-21-2011',8),
  ('Complicated', 244, '05-14-2002',9),
  ('Say My Name', 240, '11-07-1999',10);

INSERT INTO artists_songs
  (song_id, artist_id)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (3,4),
  (4,5),
  (4,6),
  (5,7),
  (6,8),
  (6,9),
  (7, 10),
  (7,11),
  (8,12),
  (8,13),
  (9,14),
  (9,15);

INSERT INTO artists_songs
  (song_id, artist_id)
VALUES
  (1,1),
  (1,2),
  (2,3),
  (3,4),
  (4, 5),
  (5,6),
  (6,7),
  (7,9),
  (7,10),
  (8,8),
  (8,11),
  (9,12),
  (10,13);

CREATE INDEX song_name ON songs (title);
CREATE INDEX artist_name ON artists (name);
CREATE INDEX producer_name ON producers (name);
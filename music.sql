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
  producers TEXT[] NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '11-14-1995', '{"Walter Afanasieff"}'),
  ('Shallow', 216, '09-27-2018', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '08-21-2001', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '10-20-2009', '{"Al Shux"}'),
  ('Dark Horse', 215, '12-17-2013', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '06-21-2011', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '05-14-2002', '{"The Matrix"}'),
  ('Say My Name', 240, '11-07-1999', '{"Darkchild"}');

ALTER TABLE IF EXISTS songs
  DROP COLUMN IF EXISTS album_id;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

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

ALTER TABLE songs
  ADD COLUMN album_id INTEGER REFERENCES albums;

UPDATE songs
  SET album_id=1
WHERE id in (1);

UPDATE songs
  SET album_id=2
WHERE id in (2);

UPDATE songs
  SET album_id=3
WHERE id in (3);

UPDATE songs
  SET album_id=4
WHERE id in (4);

UPDATE songs
  SET album_id=5
WHERE id in (5);

UPDATE songs
  SET album_id=6
WHERE id in (6);

UPDATE songs
  SET album_id=7
WHERE id in (7);

UPDATE songs
  SET album_id=8
WHERE id in (8);

UPDATE songs
  SET album_id=9
WHERE id in (9);

UPDATE songs
  SET album_id=10
WHERE id in (10);

ALTER TABLE songs
  ADD CONSTRAINT fk_album
  FOREIGN KEY (album_id)
  REFERENCES albums(id);

DROP TABLE IF EXISTS artists;

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO artists
  (name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'), 
  ('Christina Aguilera'), 
  ('Avril Lavigne'),
  ('Destiny''s Child');

DROP TABLE IF EXISTS artist_songs;
CREATE TABLE artist_songs
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs (id) ON DELETE CASCADE,
  artist_id INTEGER REFERENCES artists (id) ON DELETE CASCADE
);

INSERT INTO artist_songs
  (song_id, artist_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (5, 7),
  (6, 8),
  (6, 9),
  (7, 10),
  (7, 11),
  (8, 12),
  (8, 13),
  (9, 14),
  (10, 15);

DROP TABLE IF EXISTS producers;

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO producers
  (name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'), 
  ('Darkchild');

DROP TABLE IF EXISTS producer_songs;
CREATE TABLE producer_songs
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs (id) ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producers (id) ON DELETE CASCADE
);

INSERT INTO producer_songs
  (song_id, producer_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7),
  (7, 8),
  (7, 9),
  (8, 10),
  (8, 11),
  (9, 12),
  (10, 13);
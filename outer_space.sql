-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around)
VALUES
  ('Earth', 1.00, 'The Sun'),
  ('Mars', 1.88, 'The Sun'),
  ('Venus', 0.62, 'The Sun'),
  ('Neptune', 164.8, 'The Sun'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
  ('Gliese 876 b', 0.23, 'Gliese 876');

ALTER TABLE IF EXISTS planets
  DROP COLUMN IF EXISTS galaxy_id;

DROP TABLE IF EXISTS galaxies;

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

ALTER TABLE planets
  ADD COLUMN galaxy_id INTEGER REFERENCES galaxies;

UPDATE planets
  SET galaxy_id=1
WHERE id in (1, 2, 3, 4, 5, 6);

ALTER TABLE planets
  ADD CONSTRAINT fk_galaxy
  FOREIGN KEY (galaxy_id)
  REFERENCES galaxies(id);


DROP TABLE IF EXISTS moons;

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO moons
  (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'), 
  ('Halimede'), 
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

DROP TABLE IF EXISTS orbits;
CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets (id) ON DELETE CASCADE,
  moon_id INTEGER REFERENCES moons (id) ON DELETE CASCADE
);

INSERT INTO orbits
  (planet_id, moon_id)
VALUES
  (1, 1),
  (2, 2),
  (2, 3),
  (4, 4),
  (4, 5),
  (4, 6),
  (4, 7),
  (4, 8),
  (4, 9),
  (4, 10),
  (4, 11),
  (4, 12),
  (4, 13),
  (4, 14),
  (4, 15),
  (4, 16),
  (4, 17);
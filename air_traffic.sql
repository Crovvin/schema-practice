-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');


ALTER TABLE IF EXISTS tickets
  DROP COLUMN IF EXISTS airline_id;

DROP TABLE IF EXISTS airline;
CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
INSERT INTO airline
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brazil');

ALTER TABLE tickets
  ADD COLUMN airline_id INTEGER REFERENCES airline;

UPDATE tickets
  SET airline_id=1
WHERE id IN(1, 7);

UPDATE tickets
  SET airline_id=2
WHERE id IN(2);

UPDATE tickets
  SET airline_id=3
WHERE id IN(3, 4);

UPDATE tickets
  SET airline_id=4
WHERE id IN(5);

UPDATE tickets
  SET airline_id=5
WHERE id IN(6);

UPDATE tickets
  SET airline_id=6
WHERE id IN(8, 9);

UPDATE tickets
  SET airline_id=7
WHERE id IN(10);

ALTER TABLE tickets
  ADD CONSTRAINT fk_airline
  FOREIGN KEY (airline_id)
  REFERENCES airline(id);


ALTER TABLE IF EXISTS tickets
  DROP COLUMN IF EXISTS location_id;

DROP TABLE IF EXISTS location;
CREATE TABLE location
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

INSERT INTO location
  (city, country)
VALUES
   ('Washington DC', 'United States'),
   ('Tokyo', 'Japan'),
   ('Los Angeles', 'United States'),
   ('Seattle', 'United States'),
   ('Paris', 'France'),
   ('Dubai', 'UAE'),
   ('New York', 'United States'),
   ('Cedar Rapids', 'United States'),
   ('Charlotte', 'United States'),
   ('Sao Paolo', 'Brazil');

ALTER TABLE tickets
  ADD COLUMN location_id INTEGER REFERENCES location;

UPDATE tickets
  SET location_id=1
WHERE id IN(1);

UPDATE tickets
  SET location_id=2
WHERE id IN(2);

UPDATE tickets
  SET location_id=3
WHERE id IN(3);

UPDATE tickets
  SET location_id=4
WHERE id IN(4);

UPDATE tickets
  SET location_id=5
WHERE id IN(5);

UPDATE tickets
  SET location_id=6
WHERE id IN(6);

UPDATE tickets
  SET location_id=7
WHERE id IN(7);

UPDATE tickets
  SET location_id=8
WHERE id IN(8);

UPDATE tickets
  SET location_id=9
WHERE id IN(9);

UPDATE tickets
  SET location_id=10
WHERE id IN(10);

ALTER TABLE tickets
  ADD CONSTRAINT fk_location
  FOREIGN KEY (location_id)
  REFERENCES location(id);


ALTER TABLE IF EXISTS tickets
  DROP COLUMN IF EXISTS destination_id;

DROP TABLE IF EXISTS destination;
CREATE TABLE destination
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

INSERT INTO destination
  (city, country)
VALUES
   ('Seattle', 'United States'),
   ('London', 'United Kingdom'),
   ('Las Vegas', 'United States'),
   ('Mexico City', 'Mexico'),
   ('Casablanca', 'Morocco'),
   ('Beijing', 'China'),
   ('Charlotte', 'United States'),
   ('Chicago', 'United States'),
   ('New Orleans', 'United States'),
   ('Santiago', 'Chile');

ALTER TABLE tickets
  ADD COLUMN destination_id INTEGER REFERENCES destination;

UPDATE tickets
  SET destination_id=1
WHERE id IN(1);

UPDATE tickets
  SET destination_id=2
WHERE id IN(2);

UPDATE tickets
  SET destination_id=3
WHERE id IN(3);

UPDATE tickets
  SET destination_id=4
WHERE id IN(4);

UPDATE tickets
  SET destination_id=5
WHERE id IN(5);

UPDATE tickets
  SET destination_id=6
WHERE id IN(6);

UPDATE tickets
  SET destination_id=7
WHERE id IN(7);

UPDATE tickets
  SET destination_id=8
WHERE id IN(8);

UPDATE tickets
  SET destination_id=9
WHERE id IN(9);

UPDATE tickets
  SET destination_id=10
WHERE id IN(10);

ALTER TABLE tickets
  ADD CONSTRAINT fk_destination
  FOREIGN KEY (destination_id)
  REFERENCES destination(id);




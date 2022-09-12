-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE "Airline" (
    "id" SERIAL   NOT NULL,
    "airline" text   NOT NULL,
    CONSTRAINT "pk_Airline" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Locations" (
    "id" SERIAL   NOT NULL,
    "city" text   NOT NULL,
    "state" text   NOT NULL,
    CONSTRAINT "pk_Locations" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Passengers" (
    "id" SERIAL   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    CONSTRAINT "pk_Passengers" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Tickets" (
    "id" SERIAL   NOT NULL,
    "passenger_id" int   NOT NULL,
    "seat" text   NOT NULL,
    "departure" time   NOT NULL,
    "arrival" time   NOT NULL,
    "airline_id" int   NOT NULL,
    "origin_id" int   NOT NULL,
    "destination_id" int   NOT NULL,
    CONSTRAINT "pk_Tickets" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Tickets" ADD CONSTRAINT "fk_Tickets_passenger_id" FOREIGN KEY("passenger_id")
REFERENCES "Passengers" ("id");

ALTER TABLE "Tickets" ADD CONSTRAINT "fk_Tickets_airline_id" FOREIGN KEY("airline_id")
REFERENCES "Airline" ("id");

ALTER TABLE "Tickets" ADD CONSTRAINT "fk_Tickets_origin_id" FOREIGN KEY("origin_id")
REFERENCES "Locations" ("id");

ALTER TABLE "Tickets" ADD CONSTRAINT "fk_Tickets_destination_id" FOREIGN KEY("destination_id")
REFERENCES "Locations" ("id");


INSERT INTO passengers
  (first_name, last_name)
VALUES 
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'), 
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

  INSERT INTO locations
  (city, state)
VALUES
  ('Washington DC', 'United States'),
  ('Tokyo', 'Japan'),
  ('Los Angeles', 'United States'),
  ('Seatle', 'United States'),
  ('Paris', 'France'),
  ('Dubai', 'UAE'),
  ('New York', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Charlotte', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('London', 'United Kingdom'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Casablanca', 'Morocco'),
  ('Beijing', 'China'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Santiago', 'Chile');

INSERT INTO airline
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO tickets
  (passenger, seat, departure, arrival, airline, origin, destination)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 4),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 11),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 12),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 13),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 14),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 15),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 9),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 16),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 17),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 18);
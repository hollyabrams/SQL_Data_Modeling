-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "Songs" (
    "id" SERIAL   NOT NULL,
    "title" TEXT   NOT NULL,
    "duration_in_seconds" int   NOT NULL,
    "release_date" DATE   NOT NULL,
    "artist" TEXT   NOT NULL,
    "album" TEXT   NOT NULL,
    "producers" TEXT   NOT NULL,
    CONSTRAINT "pk_Songs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Album" (
    "id" SERIAL   NOT NULL,
    "title" TEXT   NOT NULL,
    CONSTRAINT "pk_Album" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Artist" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Artist" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Album" ADD CONSTRAINT "fk_Album_title" FOREIGN KEY("title")
REFERENCES "Songs" ("album");

ALTER TABLE "Artist" ADD CONSTRAINT "fk_Artist_name" FOREIGN KEY("name")
REFERENCES "Songs" ("artist");

INSERT INTO artist
  (full_name)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Cary", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'),
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),
  ('{"Maroon 5", "Christina Aguilera"}'),
  ('{"Avril Lavigne"}'),
  ('{"Destiny''s Child"}');

INSERT INTO album
  (title)
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

INSERT INTO songs
  (title, duration_in_seconds, release_date, album, artist, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 2),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, 3),
  ('Shallow', 216, '09-27-2018', 4, 4, 4),
  ('How You Remind Me', 223, '08-21-2001', 5, 5, 5),
  ('New York State of Mind', 276, '10-20-2009', 6, 6, 6),
  ('Dark Horse', 215, '12-17-2013', 7, 7, 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8, 8, 9),
  ('Complicated', 244, '05-14-2002', 9, 9, 10),
  ('Say My Name', 240, '11-07-1999', 10, 10, 11);

-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE "League" (
    "id" SERIAL   NOT NULL,
    "team_name" text   NOT NULL,
    "ranking" int   NOT NULL,
    "season_start" DATE   NOT NULL,
    "season_end" DATE   NOT NULL,
    CONSTRAINT "pk_League" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" SERIAL   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" SERIAL   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    "DOB" DATE   NOT NULL,
    "height" int   NOT NULL,
    "team" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" SERIAL   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Matches" (
    "id" SERIAL   NOT NULL,
    "home_team" int   NOT NULL,
    "away_team" int   NOT NULL,
    "location" TEXT   NOT NULL,
    "date" DATE   NOT NULL,
    "time" TIME   NOT NULL,
    "referee" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Results" (
    "id" SERIAL   NOT NULL,
    "team_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "result" TEXT   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Stats" (
    "id" SERIAL   NOT NULL,
    "match_id" int   NOT NULL,
    "score" int   NOT NULL,
    "player_id" int   NOT NULL,
    CONSTRAINT "pk_Stats" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team" FOREIGN KEY("team")
REFERENCES "League" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_referee" FOREIGN KEY("referee")
REFERENCES "Referees" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_team_id" FOREIGN KEY("team_id")
REFERENCES "League" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Stats" ADD CONSTRAINT "fk_Stats_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Stats" ADD CONSTRAINT "fk_Stats_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");


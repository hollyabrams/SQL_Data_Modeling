-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

-- Contains all regions and is referenced on the Posts table. 
CREATE TABLE "Region" (
    "id" SERIAL   NOT NULL,
    "region_name" text   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "id"
     )
);


-- Contains all user posts
CREATE TABLE "Posts" (
    "id" SERIAL   NOT NULL,
    "title" TEXT   NOT NULL,
    "description" TEXT   NOT NULL,
    "location" TEXT   NOT NULL,
    "user_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

-- Contains information on all users and is referenced on the Posts table. 
CREATE TABLE "Users" (
    "id" SERIAL   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    "username" TEXT   NOT NULL,
    "encrypted_password" TEXT   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

-- Contains a list of all categories available and is referenced on the Posts table. 
CREATE TABLE "Category" (
    "id" SERIAL   NOT NULL,
    "category_name" text   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "id"
     )
);

-- Contains all contraints.
ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("id");


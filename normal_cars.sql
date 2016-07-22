DROP USER IF EXISTS normal_user;
CREATE USER normal_user;

DROP DATABASE IF EXISTS normal_cars;
CREATE DATABASE normal_cars WITH OWNER normal_user;

\c normal_cars;

\i scripts/denormal_data.sql;

CREATE TABLE makes (
  id SERIAL PRIMARY KEY,
  make_code VARCHAR(255) NOT NULL,
  make_title VARCHAR(255) NOT NULL
);

CREATE TABLE models (
  id SERIAL PRIMARY KEY,
  model_code VARCHAR(255) NOT NULL,
  model_title VARCHAR(255) NOT NULL,
  make_id INT REFERENCES makes(id)
);

CREATE TABLE year (
  id SERIAL PRIMARY KEY,
  year_value INT
);
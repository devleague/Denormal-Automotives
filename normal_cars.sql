DROP DATABASE IF EXISTS normal_cars;
DROP USER IF EXISTS normal_user;

-- Create a new postgres user named denormal_user
CREATE USER normal_user;
-- Create a new database named denormal_cars owned by denormal_user
CREATE DATABASE normal_cars WITH OWNER normal_user;

\c normal_cars;

-- Run the provided scripts/denormal_data.sql script on the normal_cars database
\i scripts/denormal_data.sql;

CREATE TABLE IF NOT EXISTS make
(
  id SERIAL PRIMARY KEY,
  make_code character varying(125) NOT NULL,
  make_title character varying(125) NOT NULL
);

CREATE TABLE IF NOT EXISTS model
(
  id SERIAL PRIMARY KEY,
  make_id INTEGER REFERENCES make(id),
  model_code character varying(125) NOT NULL,
  model_title character varying(125) NOT NULL
);


CREATE TABLE IF NOT EXISTS year
(
  id SERIAL PRIMARY KEY,
  year integer NOT NULL
);

INSERT INTO make (make_code, make_title)
  SELECT DISTINCT make_code, make_title FROM car_models ORDER BY make_code ASC;
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
  model_code character varying(125) NOT NULL,
  model_title character varying(125) NOT NULL
);


CREATE TABLE IF NOT EXISTS year
(
  id SERIAL PRIMARY KEY,
  year integer NOT NULL
);

CREATE TABLE IF NOT EXISTS car_list
(
  id SERIAL PRIMARY KEY,
  make_id INTEGER REFERENCES make(id),
  model_id INTEGER REFERENCES model(id),
  year_id INTEGER REFERENCES year(id)
);

INSERT INTO make (make_code, make_title)
  SELECT DISTINCT make_code, make_title FROM car_models ORDER BY make_code ASC;

INSERT INTO model (model_code, model_title)
  SELECT DISTINCT model_code, model_title FROM car_models ORDER BY model_code ASC;

INSERT INTO year (year)
  SELECT DISTINCT year FROM car_models ORDER BY year ASC;

INSERT INTO car_list (make_id, model_id, year_id)
  SELECT make.id AS make_id, model.id AS model_id, year.id AS year_id FROM car_models
    INNER JOIN make on make.make_code = car_models.make_code
    INNER JOIN model on model.model_code = car_models.model_code
    INNER JOIN year on year.year = car_models.year;

SELECT * FROM car_list;


-- SELECT * FROM make;
-- SELECT * FROM model;
-- SELECT * FROM year;
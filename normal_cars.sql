DROP USER IF EXISTS normal_user;
CREATE USER normal_user;

DROP DATABASE IF EXISTS normal_cars;
CREATE DATABASE normal_cars WITH OWNER normal_user;

\c normal_cars;

\i scripts/denormal_data.sql;

CREATE TABLE makes (
  id SERIAL PRIMARY KEY,
  make_code VARCHAR(125) NOT NULL,
  make_title VARCHAR(125) NOT NULL
);

CREATE TABLE models (
  id SERIAL PRIMARY KEY,
  model_code VARCHAR(125) NOT NULL,
  model_title VARCHAR(125) NOT NULL
);

CREATE TABLE years (
  id SERIAL PRIMARY KEY,
  year_value INT
);

CREATE TABLE cars (
  id SERIAL PRIMARY KEY,
  make_id INT REFERENCES makes(id),
  model_id INT REFERENCES models(id),
  year_id INT REFERENCES years(id)
);

INSERT INTO makes
  (make_code,
    make_title)
  SELECT DISTINCT make_code, make_title
    FROM car_models
    ORDER BY make_code ASC;

INSERT INTO models
  (model_code,
    model_title)
  SELECT DISTINCT model_code, model_title
    FROM car_models
    ORDER BY model_code ASC;

INSERT INTO years
  (year_value)
  SELECT DISTINCT year
    FROM car_models;

INSERT INTO cars
  (make_id,
    model_id,
    year_id)
  SELECT makes.id AS make_id,
    models.id AS model_id,
    years.id AS year_id 
  FROM car_models
    INNER JOIN models
    ON (models.model_code = car_models.model_code)
    AND (models.model_title = car_models.model_title)
    INNER JOIN makes
    ON (makes.make_code = car_models.make_code)
    AND (makes.make_title = car_models.make_title)
    INNER JOIN years
    ON (years.year_value = car_models.year);

SELECT DISTINCT model_title
  FROM cars
  INNER JOIN makes
  ON (makes.id = cars.make_id)
  INNER JOIN models
  ON (models.id = cars.model_id)
  WHERE makes.make_code = 'VOLKS';

SELECT DISTINCT *
  FROM cars
  INNER JOIN makes
  ON (makes.id = cars.make_id)
  INNER JOIN models
  ON (models.id = cars.model_id)
  WHERE makes.make_code = 'LAM';

SELECT *
  FROM cars
  INNER JOIN makes
  ON (makes.id = cars.make_id)
  INNER JOIN models
  ON (models.id = cars.model_id)
  INNER JOIN years
  ON (years.id = cars.year_id)
  WHERE years.year_value
  BETWEEN 2010
  AND 2015;
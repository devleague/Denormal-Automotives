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

CREATE TABLE year (
  id SERIAL PRIMARY KEY,
  year_value INT
);

CREATE TABLE cars (
  id SERIAL PRIMARY KEY,
  make_id INT REFERENCES makes(id),
  model_id INT REFERENCES models(id),
  year_value INT
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

-- SELECT COUNT(DISTINCT model_title)
--   FROM car_models
--   WHERE make_code = 'VOLKS';

-- SELECT COUNT(*)
--   FROM car_models
--   WHERE make_code = 'LAM';
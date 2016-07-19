DROP DATABASE IF EXISTS denormal_cars;

DROP ROLE IF EXISTS denormal_user;

CREATE ROLE denormal_user;

CREATE DATABASE denormal_cars WITH OWNER denormal_user;

\c denormal_cars;

\i scripts/denormal_data.sql;
-- 5
SELECT DISTINCT ON (make_title) make_title
  FROM car_models;

-- 6
SELECT DISTINCT ON (model_title) model_title
  FROM car_models
  WHERE make_code LIKE 'VOLKS';

-- 7
SELECT make_code, model_code, model_title, year
  FROM car_models
  WHERE make_code LIKE 'LAM';

-- 8
SELECT *
  FROM car_models
  WHERE year < '2015'
  AND year > '2010';

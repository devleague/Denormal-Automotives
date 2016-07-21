DROP DATABASE IF EXISTS denormal_cars;
DROP USER IF EXISTS denormal_user;

-- Create a new postgres user named denormal_user
CREATE USER denormal_user;
-- Create a new database named denormal_cars owned by denormal_user
CREATE DATABASE denormal_cars WITH OWNER denormal_user;

\c denormal_cars;

-- Run the provided scripts/denormal_data.sql script on the denormal_cars database
\i scripts/denormal_data.sql;

\dS car_models;

-- Create a query to get a list of all make_title values in the car_models table, without any duplicate rows. (should have 71 results)
SELECT DISTINCT make_title from car_models;
SELECT COUNT(DISTINCT make_title) FROM car_models;

-- Create a query to list all model_title values where the make_code is 'VOLKS', without any duplicate rows (should have 27 results)
SELECT DISTINCT model_title from car_models WHERE make_code = 'VOLKS';
SELECT COUNT(DISTINCT model_title) from car_models WHERE make_code = 'VOLKS';

-- Create a query to list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM' (should have 136 rows)
SELECT make_code, model_code, model_title, year from car_models WHERE make_code = 'LAM';
SELECT COUNT(make_code) from car_models WHERE make_code = 'LAM';

 -- Create a query to list all fields from all car_models in years between 2010 and 2015 (should have 7884 rows)
SELECT * from car_models WHERE year BETWEEN 2010 AND 2015;
SELECT COUNT(*) from car_models WHERE year BETWEEN 2010 AND 2015;
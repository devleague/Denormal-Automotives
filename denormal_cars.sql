DROP DATABASE IF EXISTS denormal_cars;
DROP USER IF EXISTS denormal_user;

-- Create a new postgres user named denormal_user
CREATE USER denormal_user;
-- Create a new database named denormal_cars owned by denormal_user
CREATE DATABASE denormal_cars WITH OWNER denormal_user;

\c denormal_cars;

-- Run the provided scripts/denormal_data.sql script on the denormal_cars database
\i scripts/denormal_data.sql;
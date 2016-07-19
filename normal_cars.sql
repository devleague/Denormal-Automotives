DROP DATABASE IF EXISTS normal_cars;

DROP ROLE IF EXISTS normal_user;

CREATE ROLE normal_user;

CREATE DATABASE normal_cars WITH OWNER normal_user;

\c normal_cars;

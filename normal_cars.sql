-- CREATE TABLE makes (
-- id serial primary key NOT NULL,
-- make_code varchar(125) NOT NULL,
-- make_title varchar(125) NOT NULL
-- );

-- CREATE TABLE models (
-- id serial primary key NOT NULL,
-- model_code varchar(125) NOT NULL,
-- model_title varchar(125) NOT NULL,
-- year int NOT NULL,
-- make_id int references makes(id)
-- );

-- INSERT INTO makes (make_code, make_title)
-- SELECT DISTINCT make_code, make_title
-- FROM car_models
-- ORDER BY make_code ASC;

-- INSERT INTO models (model_code, model_title, year, make_id)
-- SELECT car_models.model_code, car_models.model_title, car_models.year, makes.id
-- FROM car_models
--   INNER JOIN makes ON (makes.make_code = car_models.make_code)
-- ORDER BY car_models.year ASC;

-- -- 7
-- SELECT make_title
-- FROM makes;

-- 8
SELECT DISTINCT model_title
FROM models
  INNER JOIN makes ON (models.make_id = makes.id)
WHERE makes.make_code LIKE '%VOLKS%';


-- INSERT INTO uniqueCars (make_id, model_id, year_id)
-- SELECT makes.id AS makes_id, models.id AS model_id, years.id AS year_id
-- FROM car_models
--   RIGHT OUTER JOIN makes ON (car_models.make_code = makes.make)
--   RIGHT OUTER JOIN models ON (car_models.model_code = models.code)
--   RIGHT OUTER JOIN years ON (car_models.year = years.year)


-- 4
-- SELECT *
-- FROM car_models;

-- 5
-- SELECT DISTINCT make_title
-- FROM car_models;

-- 6
-- SELECT DISTINCT model_title
-- FROM car_models
-- WHERE make_code LIKE 'VOLKS';

-- 7
-- SELECT make_code, model_code, model_title, year
-- FROM car_models
-- WHERE make_code LIKE 'LAM';

-- 8
SELECT *
FROM car_models
WHERE year BETWEEN 2010 AND 2015;
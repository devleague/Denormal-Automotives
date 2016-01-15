-- 4
-- SELECT *
-- FROM car_models;

-- 5
-- SELECT DISTINCT make_title
-- FROM car_models;

-- 6
SELECT DISTINCT model_title
FROM car_models
WHERE make_code LIKE 'VOLKS';
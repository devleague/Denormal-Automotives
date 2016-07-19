# Denormal Automotives

### DB Modeling Exercise in PostgreSQL

When connecting to your pg database, connect from this project directory.

To run sql statements from an external file, use the `\i [filepath]` command.

## Denormal Cars

Write your queries in `denormal_cars.sql` when instructed to.

1. Create a new postgres user named `denormal_user`
1. Create a new database named `denormal_cars` owned by `denormal_user`
1. Run the provided `scripts/denormal_data.sql` script on the `denormal_cars` database
1. Inspect the table named `car_models` by running `\dS` and look at the data using some `SELECT` statements
1. In `denormal_cars.sql` Create a query to get a list of all `make_title` values in the `car_models` table, without any duplicate rows. (should have 71 results)
1. In `denormal_cars.sql` Create a query to list all `model_title` values where the `make_code` is `'VOLKS'`, without any duplicate rows (should have 27 results)
1. In `denormal_cars.sql` Create a query to list all `make_code`, `model_code`, `model_title`, and year from `car_models` where the `make_code` is `'LAM'` (should have 136 rows)
1. In `denormal.sql` Create a query to list all fields from all `car_models` in years between `2010` and `2015` (should have 7884 rows)


## Modeling a Normalized Schema

Write your queries in `normal_cars.sql` when instructed to.

1. Create a new postgres user named `normal_user`
1. Create a new database named `normal_cars` owned by `normal_user`
1. Whiteboard your solution to normalizing the `denormal_cars` schema.
1. [bonus] Generate a diagram (somehow) in .png (or other) format, that of your normalized cars schema. (save and commit to this repo)
1. In `normal_cars.sql` Create a query to generate the tables needed to accomplish your normalized schema, including any primary and foreign key constraints. Logical renaming of columns is allowed.
1. Using the resources that you now possess, In `normal_cars.sql` Create queries to insert **all** of the data that was in the `denormal_cars.car_models` table, into the new normalized tables of the `normal_cars` database.
1. In `normal_cars.sql` Create a query to get a list of all `make_title` values in the `car_models` table. (should have 71 results)
1. In `normal_cars.sql` Create a query to list all `model_title` values where the `make_code` is `'VOLKS'` (should have 27 results)
1. In `normal_cars.sql` Create a query to list all `make_code`, `model_code`, `model_title`, and year from `car_models` where the `make_code` is `'LAM'` (should have 136 rows)
1. In `normal_cars.sql` Create a query to list all fields from all `car_models` in years between `2010` and `2015` (should have 7884 rows)

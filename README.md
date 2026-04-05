# Hackerrank_SQL

Collection of SQL solutions for HackerRank problems and related SQL exercises. Each file is a standalone SQL script that solves a specific problem or demonstrates a SQL technique.

Primary language: SQL

---

## Repository overview

This repo contains solutions and example queries for HackerRank-style SQL problems. Files are intended to be run in a SQL environment that provides the expected tables (for example, the HackerRank SQL environment or a local RDBMS with the required schema and data).

---

## Files and explanations

- Africa_cities_name.sql  
  - Purpose: List city names that are in countries on the African continent.  
  - Query summary: Joins the CITY table (alias `ci`) to COUNTRY (alias `co`) using `CITY.COUNTRYCODE = COUNTRY.CODE` and filters where `co.CONTINENT = 'Africa'`. Returns `ci.name` as `city_names`.

- The_report.sql  
  - Purpose: Map students' marks to grades and show student names where grade is >= 8.  
  - Query summary: Uses a `LEFT JOIN` between `students` and `grades`, matching `s.marks BETWEEN g.min_mark AND g.max_mark`. The `CASE` expression returns the student `name` only when `g.grade >= 8` (otherwise `NULL`). Results are ordered by `grade DESC, name, marks`. This demonstrates JOINs, BETWEEN, and conditional output via CASE.

- Top_competitors.sql  
  - Purpose: Find hackers who achieved full scores in more than one challenge.  
  - Query summary: Joins `hackers`, `submissions`, `challenges`, and `difficulty` tables. Filters rows where `submission.score = difficulty.score` (meaning a full score for that difficulty). Groups by hacker and keeps only hackers with `COUNT(DISTINCT challenge_id) > 1` using a `HAVING` clause. Results are ordered by the number of full-score challenges (descending) and `hacker_id` (ascending). The file includes an extended comment explaining the logic and table roles.

- average_population_of_each_continent.sql  
  - Purpose: Compute the average city population for each continent (rounded down).  
  - Query summary: Joins `CITY` and `COUNTRY` on country codes, groups by `COUNTRY.CONTINENT`, computes `AVG(ci.POPULATION)` and applies `FLOOR()` to round down to the nearest integer. Returns `(continent, avg_city_population)`.

- population_census.sql  
  - Purpose: Sum populations of all cities in countries on the continent 'Asia'.  
  - Query summary: Joins `CITY` with `COUNTRY` and filters `co.CONTINENT = 'Asia'`. Aggregates with `SUM(ci.POPULATION)` and returns a single value `total_asian_city_population`.

- weather_observation_station_18.sql  
  - Purpose: Compute the Manhattan distance between two extreme coordinate points from the `STATION` table.  
  - Query summary: Uses `MIN`/`MAX` of `LAT_N` and `LONG_W` to build P1 and P2 coordinates and computes `ABS(MAX(LAT_N)-MIN(LAT_N)) + ABS(MAX(LONG_W)-MIN(LONG_W))`, then rounds to 4 decimal places with `ROUND(..., 4)`.

- weather_observation_station_19.sql  
  - Purpose: Compute the Euclidean distance between two extreme coordinate points from the `STATION` table.  
  - Query summary: Uses `MIN`/`MAX` of `LAT_N` and `LONG_W` to get P1 and P2, computes `SQRT( POWER(MAX(LAT_N)-MIN(LAT_N),2) + POWER(MAX(LONG_W)-MIN(LONG_W),2) )`, and rounds to 4 decimal places.

- weather_observation_station_20.sql  
  - Purpose: Compute the median of `LAT_N` values from the `STATION` table, rounded to 4 decimal places.  
  - Query summary: Uses a CTE (`ordered`) to compute `ROW_NUMBER() OVER (ORDER BY LAT_N)` and total `COUNT(*) OVER ()`. Selects the middle one or two rows via `WHERE rn IN ((cnt + 1) / 2, (cnt + 2) / 2)` and returns `ROUND(AVG(LAT_N), 4)` as the median. Works for both odd and even counts.

---

## How to run these scripts

- These scripts expect the tables used in the queries (CITY, COUNTRY, students, grades, hackers, submissions, challenges, difficulty, STATION) to exist in the database and to be populated with the appropriate data, as is typical in HackerRank problems.
- To run locally against a database (example commands):

  - MySQL:
    - mysql -u <user> -p <database> < file.sql

  - PostgreSQL:
    - psql -U <user> -d <database> -f file.sql

  - Or paste the SQL into your DB client's query editor or the HackerRank SQL editor.

- If you want runnable examples, I can add small CREATE TABLE and INSERT statements (sample data) per problem so each script can be executed locally.

---

## Contributing

- Add new solutions as separate `.sql` files; name files descriptively (e.g., `weather_observation_station_21.sql`).
- Include a comment header at the top of each `.sql` file with:
  - Problem name / source link
  - Short approach description
  - Any schema or data assumptions
- Open a PR or push a branch `add/<problem-name>`.

---

## License

This repository is licensed under the MIT License. See the included LICENSE file for details.

---

## Contact

Owner: @Sumant40 (GitHub)

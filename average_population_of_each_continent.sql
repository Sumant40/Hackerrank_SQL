-- HackerRank SQL: Average Population of Each Continent
-- Problem: Query each continent name and the average city population,
-- rounded down to the nearest integer.

SELECT co.CONTINENT,
       FLOOR(AVG(ci.POPULATION)) AS avg_city_population
FROM CITY AS ci
JOIN COUNTRY AS co
  ON ci.COUNTRYCODE = co.CODE
GROUP BY co.CONTINENT;

-- Explanation:
-- 1) JOIN CITY and COUNTRY on matching country codes.
-- 2) GROUP BY continent to aggregate cities per continent.
-- 3) AVG(ci.POPULATION) computes average city population per continent.
-- 4) FLOOR(...) rounds the average down to the nearest integer.

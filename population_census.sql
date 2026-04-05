-- HackerRank SQL: Population Census
-- Problem: Query the sum of populations of all cities
-- where the continent is 'Asia'.

SELECT SUM(ci.POPULATION) AS total_asian_city_population
FROM CITY AS ci
JOIN COUNTRY AS co
  ON ci.COUNTRYCODE = co.CODE
WHERE co.CONTINENT = 'Asia';

-- Explanation:
-- 1) JOIN CITY and COUNTRY using CITY.CountryCode = COUNTRY.Code.
-- 2) Filter rows to countries in Asia.
-- 3) SUM(ci.POPULATION) adds populations of all matching cities.

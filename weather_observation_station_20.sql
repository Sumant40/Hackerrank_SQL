-- HackerRank SQL: Weather Observation Station 20
-- Problem: Query the median of LAT_N from STATION
-- and round the answer to 4 decimal places.

WITH ordered AS (
  SELECT LAT_N,
         ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
         COUNT(*) OVER () AS cnt
  FROM STATION
)
SELECT ROUND(AVG(LAT_N), 4) AS median_lat_n
FROM ordered
WHERE rn IN ((cnt + 1) / 2, (cnt + 2) / 2);

-- Explanation:
-- 1) ROW_NUMBER() orders latitudes from smallest to largest.
-- 2) COUNT(*) OVER () gives total row count for each row.
-- 3) The two target middle positions are:
--      (cnt + 1) / 2 and (cnt + 2) / 2
--    This picks one middle row when cnt is odd,
--    and two middle rows when cnt is even.
-- 4) AVG(LAT_N) returns the median value in both cases.
-- 5) ROUND(..., 4) formats the result to 4 decimal places.

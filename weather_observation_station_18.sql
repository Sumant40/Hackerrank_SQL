-- HackerRank SQL: Weather Observation Station 18
-- Problem: Find Manhattan distance between
-- P1(min(LAT_N), min(LONG_W)) and P2(max(LAT_N), max(LONG_W))
-- and display result rounded to 4 decimal places.

SELECT ROUND(
         ABS(MAX(LAT_N) - MIN(LAT_N)) +
         ABS(MAX(LONG_W) - MIN(LONG_W)),
         4
       ) AS manhattan_distance
FROM STATION;

-- Explanation:
-- 1) MIN(LAT_N), MAX(LAT_N), MIN(LONG_W), MAX(LONG_W)
--    get coordinates of points P1 and P2.
-- 2) Manhattan distance formula:
--    |x2 - x1| + |y2 - y1|
-- 3) ROUND(..., 4) formats the result to 4 decimal digits.

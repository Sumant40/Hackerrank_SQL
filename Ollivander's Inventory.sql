/*
PROBLEM UNDERSTANDING:

We have two tables:
1. Wands(id, code, coins_needed, power)
2. Wands_Property(code, age, is_evil)

GOAL:
- Select only NON-EVIL wands (is_evil = 0)
- For each (power, age) combination, choose the wand with MINIMUM coins_needed
- Output: id, age, coins_needed, power
- Sort:
    1. power DESC
    2. age DESC

WORKING PRINCIPLE:

Step 1: Join Wands and Wands_Property using code
Step 2: Filter only non-evil wands
Step 3: For each (power, age), find MIN(coins_needed)
Step 4: Keep only those rows where coins_needed equals that minimum
Step 5: Sort results as required

IMPORTANT LOGIC:
- We use a correlated subquery to ensure we pick only the minimum coins_needed
  for each combination of power and age
- This ensures we eliminate duplicates with higher cost

FINAL QUERY:
*/

SELECT 
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM Wands w
JOIN Wands_Property wp
    ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    /*
    SUBQUERY EXPLANATION:
    - For the current wand (same power and same age),
      find the minimum coins_needed
    - This ensures we only keep the cheapest wand
      for each (power, age) group
    */
    SELECT MIN(w2.coins_needed)
    FROM Wands w2
    JOIN Wands_Property wp2
        ON w2.code = wp2.code
    WHERE 
        wp2.is_evil = 0
        AND w2.power = w.power
        AND wp2.age = wp.age
)
ORDER BY 
    w.power DESC,   -- higher power first
    wp.age DESC;    -- if same power, higher age first
    
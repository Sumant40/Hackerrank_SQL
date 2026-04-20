/*
PROBLEM UNDERSTANDING:

Tables:
1. Hackers(hacker_id, name)
2. Challenges(challenge_id, hacker_id)

GOAL:
- Count number of challenges created by each hacker
- Output: hacker_id, name, total_challenges
- Sorting:
    1. total_challenges DESC
    2. hacker_id ASC
- CONDITION:
    - If multiple hackers have same challenge count:
        -> Include them ONLY if that count is the MAX count
        -> Otherwise EXCLUDE them

WORKING PRINCIPLE:

Step 1: Count challenges per hacker using GROUP BY
Step 2: Join with Hackers table to get names
Step 3: Identify:
        (A) Maximum challenge count
        (B) Frequency of each count
Step 4: Filtering logic:
        - Keep rows where:
            (i) count is MAX
            OR
            (ii) count occurs only once
Step 5: Sort final output

IMPORTANT IDEA:
- We eliminate duplicate counts unless they are the maximum
- This uses HAVING + subqueries

FINAL QUERY:
*/

SELECT 
    h.hacker_id,
    h.name,
    COUNT(c.challenge_id) AS total_challenges
FROM Hackers h
JOIN Challenges c
    ON h.hacker_id = c.hacker_id
GROUP BY 
    h.hacker_id, h.name
HAVING 
    /* 
    CONDITION 1:
    Keep if this hacker has the MAX number of challenges
    */
    COUNT(c.challenge_id) = (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        ) t
    )
    
    OR
    
    /*
    CONDITION 2:
    Keep if this count appears only once
    (i.e., unique count)
    */
    COUNT(c.challenge_id) IN (
        SELECT cnt
        FROM (
            SELECT 
                COUNT(*) AS cnt,
                COUNT(*) OVER (PARTITION BY COUNT(*)) AS freq
            FROM Challenges
            GROUP BY hacker_id
        ) t
        WHERE freq = 1
    )

ORDER BY 
    total_challenges DESC,
    h.hacker_id;
SELECT 
    h.hacker_id,
    h.name
FROM hackers h
JOIN submissions s 
    ON h.hacker_id = s.hacker_id
JOIN challenges c 
    ON s.challenge_id = c.challenge_id
JOIN difficulty d 
    ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(DISTINCT s.challenge_id) > 1
ORDER BY 
    COUNT(DISTINCT s.challenge_id) DESC,
    h.hacker_id ASC;

/*
Problem: Top Competitors

Objective:
-----------
Retrieve the hacker_id and name of hackers who have achieved full scores 
in more than one challenge.

Definition:
-----------
A "full score" occurs when a hacker's submission score is equal to the 
maximum possible score for that challenge's difficulty level.

Tables Used:
------------
1. hackers (hacker_id, name)
2. submissions (submission_id, hacker_id, challenge_id, score)
3. challenges (challenge_id, hacker_id, difficulty_level)
4. difficulty (difficulty_level, score)

Working Principle:
------------------
1. Join 'hackers' with 'submissions' to get all submissions made by each hacker.

2. Join 'submissions' with 'challenges' to determine the difficulty level 
   of each challenge.

3. Join 'challenges' with 'difficulty' to obtain the maximum possible score 
   for each difficulty level.

4. Filter records where submission score equals difficulty score.
   This ensures we only consider full-score submissions.

5. Group the results by hacker_id and name to aggregate data per hacker.

6. Count the number of DISTINCT challenge_ids for which each hacker achieved 
   a full score. DISTINCT is used to avoid counting multiple submissions 
   for the same challenge.

7. Use HAVING clause to retain only those hackers who achieved full scores 
   in more than one challenge.

8. Sort the final result:
   - First by the number of full-score challenges in descending order.
   - Then by hacker_id in ascending order in case of a tie.

Output:
-------
Displays hacker_id and name of qualifying hackers.

*/

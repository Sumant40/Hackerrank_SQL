SELECT
    b.hacker_id,
    h.name,
    SUM(b.max_score) AS total_score
FROM (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) AS b
INNER JOIN Hackers AS h
ON b.hacker_id = h.hacker_id
GROUP BY b.hacker_id, h.name
HAVING SUM(b.max_score) > 0
ORDER BY total_score DESC, b.hacker_id;
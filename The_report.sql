--🔹 JOIN
--Combines two tables
--LEFT JOIN ensures all students are included
--Matching happens using a condition
--🔹 BETWEEN
--Checks if value lies within a range
--Inclusive (≥ and ≤)
--Used here to map marks → grade
SELECT 
   CASE 
        WHEN g.grade >= 8 THEN s.name
        ELSE NULL
    END AS name
    , g.grade
    , marks
FROM students s
LEFT JOIN grades g
    ON s.marks BETWEEN g.min_mark and g.max_mark
ORDER BY grade DESC, name, marks;

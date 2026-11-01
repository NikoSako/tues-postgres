-- Query 1: All grades of a given student in a given subject, by date.
SELECT s.first_name, s.last_name, sub.name AS subject, g.grade, g.grade_date
FROM grades g
JOIN students s   ON s.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
WHERE s.first_name = 'Ivan' AND sub.name = 'Mathematics'
ORDER BY g.grade_date;

--RESULT:  
--first_name | last_name |   subject   | grade | grade_date
------------+-----------+-------------+-------+------------
-- Ivan       | Petrov    | Mathematics |     5 | 2026-09-15
-- Ivan       | Petrov    | Mathematics |     6 | 2026-10-02
-- Ivan       | Petrov    | Mathematics |     5 | 2026-10-20
--(3 rows)

-- Query 2: The class average grade in each subject (with two decimal places) and the number of grades
SELECT sub.name AS subject,
       ROUND(AVG(g.grade), 2) AS average,
       COUNT(g.grade) AS grades_count
FROM grades g
JOIN subjects sub ON sub.id = g.subject_id
GROUP BY sub.name;
ORDER BY sub.name;

--RESULT:
--   subject   | average | grades_count
-------------+---------+--------------
-- Mathematics |    4.63 |            8
-- Informatics |    4.60 |            5
-- Physics     |    4.29 |            7
-- Literature  |    4.80 |            5
--(4 rows)
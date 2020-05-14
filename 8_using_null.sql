-- 1- 
SELECT name
FROM teacher
WHERE dept IS NULL;

-- 2- 
SELECT teacher.name, dept.name
FROM teacher JOIN dept
  ON (teacher.dept=dept.id);

-- 3- 
SELECT teacher.name AS teacher, dept.name AS department
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);

-- 4- 
SELECT teacher.name AS teacher, dept.name AS department
FROM teacher RIGHT JOIN dept ON (teacher.dept = dept.id);

-- 5-
SELECT teacher.name AS teacher, COALESCE(mobile,  '07986 444 2266')
FROM teacher;

-- 6-
SELECT teacher.name AS teacher, COALESCE(dept.name, 'None') AS department
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);

-- 7-
SELECT COUNT(name) AS N_of_teachers, COUNT(mobile) AS N_of_mobiles
FROM teacher;

-- 8-
SELECT dept.name AS department, COUNT(teacher.name) AS N_of_staff
FROM teacher RIGHT JOIN dept ON (dept.id=teacher.dept)
GROUP BY dept.name;

-- 9-
SELECT teacher.name AS teacher, CASE WHEN (teacher.dept=1 OR teacher.dept=2) THEN 'Sci' ELSE 'Art'END department
FROM teacher LEFT JOIN dept ON (teacher.dept= dept.id);

-- 10-
SELECT teacher.name AS teacher, CASE WHEN (teacher.dept=1 OR teacher.dept=2) THEN 'Sci' WHEN (teacher.dept=3) THEN 'Art'ELSE 'None'END department
FROM teacher LEFT JOIN dept ON (teacher.dept= dept.id);
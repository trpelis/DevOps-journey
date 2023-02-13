USE mentorship;

SELECT * FROM student;

SELECT name, city FROM student;

SELECT name, last_name, age
FROM student 
WHERE age = (SELECT MIN(age) FROM student) OR age = (SELECT MAX(age) FROM student);


SELECT name, last_name, city
FROM mentor
WHERE city regexp '^A';

SELECT name, last_name
FROM student
WHERE age < 30;


SELECT 'student' AS type, AVG(age) as avg_age
FROM student
UNION
SELECT 'mentor' AS type, AVG(age) as avg_age
FROM mentor;

UPDATE student
SET favourite_movie = 'Harry Potter'
WHERE age = ( SELECT MIN(age) FROM (SELECT age FROM student ORDER BY age DESC LIMIT 2) AS X);

DELETE FROM student
WHERE age = (SELECT age FROM (SELECT age FROM student ORDER BY age LIMIT 3) AS X ORDER BY age DESC LIMIT 1);

ALTER TABLE student ADD COLUMN birthdate DATE;
ALTER TABLE mentor ADD COLUMN birthdate DATE;

UPDATE mentor SET birthdate = DATE_SUB(NOW(), INTERVAL age YEAR);
UPDATE student SET birthdate = DATE_SUB(NOW(), INTERVAL age YEAR);
																
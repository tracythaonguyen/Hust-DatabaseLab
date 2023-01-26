-- -- 2. Find the students (Snum, Name) of all CS Majors (Major = "CS") who are enrolled in the course "IT3292E Database 20221".

SELECT s.snum, s.name FROM student s
INNER JOIN enrolled e ON s.snum = e.snum
INNER JOIN class c ON c.name = e.class_name
WHERE s.major = 'CS' AND c.name = 'IT3292E Database' AND c.semester = '2022.1';

-- Don't need DISTINCT (se lm ton thoi gian evaluate lai)

-- -- 3. Find the students (Snum, Name) of all classes that either meet in room D9-205 or are taught by "Prof. Nguyen" working in “Computer Science” Department.

SELECT s.snum, s.name FROM student as s
JOIN enrolled e ON s.snum = e.snum
JOIN class c ON c.name = e.class_name
JOIN faculty_member f ON c.fid = f.fid
WHERE c.room = 'D9-205' OR (f.name = 'Prof. Nguyen' AND f.dept = 'Computer Science')
ORDER BY s.snum;

-- should avoi sub-query in WHERE part

-- another way
-- SELECT s.snum, s.name FROM student s
-- JOIN enrolled e ON s.snum = e.snum
-- JOIN class c ON c.name = e.class_name
-- WHERE c.name IN (
--   SELECT c.name FROM class c
--   INNER JOIN faculty_member f ON c.fid = f.fid
--   WHERE f.name = 'Prof. Nguyen' AND f.dept = 'Computer Science'
-- ) OR c.room = 'D9-205';

-- -- 4. Find the (Snum, Name) of all pairs of students who are enrolled in some class together.

SELECT DISTINCT s1.snum, s1.name, s2.snum, s2.name FROM enrolled e1
JOIN enrolled e2 ON (e1.class_name = e2.class_name AND e1.snum < e2.snum)
JOIN student s2 ON s2.snum = e2.snum
JOIN student s1 ON s1.snum = e1.snum;

-- Cach 2
SELECT DISTINCT s1.snum, s1.name, s2.snum, s2.name FROM enrolled e1
JOIN enrolled e2 ON e1.class_name = e2.class_name 
JOIN student s2 ON s2.snum = e2.snum
JOIN student s1 ON s1.snum = e1.snum
WHERE e1.snum < e2.snum;

-- 5. Find the students(Snum,Name),who are enrolled in two classes that meet at the same time, and names of these two classes

-- sua lai dieu kien thoi gian gap nhau (overlap time)
-- dcm cai dau tien nay la dung nhat

SELECT DISTINCT s.snum, s.name, c1.name, c2.name 
FROM class c1
JOIN class c2
ON (c1.week_day = c2.week_day 
  AND (((c1.start_time <= c2.start_time) AND (c2.start_time <= c1.end_time)) 
      OR ((c2.start_time <= c1.start_time) AND (c1.start_time <= c2.end_time))) 
  AND c1.name <> c2.name
  AND c1.semester = c2.semester)
JOIN enrolled e1 ON (e1.class_name = c1.name)
JOIN enrolled e2 ON (e2.class_name = c1.name)
JOIN student s ON e1.snum = s.snum
WHERE e1.snum = e2.snum;

SELECT DISTINCT s.snum, s.name, c1.name, c2.name 
FROM class c1
JOIN class c2
ON (c1.week_day = c2.week_day 
  AND ((c1.start_time <= c2.start_time) AND (c2.start_time <= c1.end_time)) 
  AND c1.name <> c2.name
  AND c1.semester = c2.semester)
JOIN enrolled e1 ON (e1.class_name = c1.name)
JOIN enrolled e2 ON (e2.class_name = c1.name)
JOIN student s ON e1.snum = s.snum
WHERE e1.snum = e2.snum;

SELECT DISTINCT s.snum, s.name, c1.name, c2.name 
FROM class c1
JOIN class c2
ON (c1.week_day = c2.week_day 
  AND ((c1.start_time <= c2.start_time) AND (c2.start_time <= c1.end_time)) 
  AND c1.name < c2.name
  AND c1.semester = c2.semester)
JOIN enrolled e1 ON (e1.class_name = c1.name)
JOIN enrolled e2 ON (e2.class_name = c1.name)
JOIN student s ON e1.snum = s.snum
WHERE e1.snum = e2.snum;

-- -- 6 Find the faculty members(fid,name) who teach every weekday in the semester 20221.

-- dcm cai nay thieu WHERE  c.semester = '2020.1'
SELECT f.fid, f.name FROM faculty_member f
JOIN class c
ON f.fid = c.fid
GROUP BY f.name, f.fid
HAVING COUNT(DISTINCT c.week_day) = 6;

-- cai nay dung hon
SELECT f.fid, f.name
FROM faculty_member f
INNER JOIN class c ON c.fid = f.fid
WHERE  c.semester = '2020.1'
GROUP BY f.fid
HAVING COUNT(DISTINCT c.WeekDay) = 6;

-- another way
-- SELECT f.name FROM faculty_member f
-- WHERE NOT EXISTS (
--   SELECT c.week_day FROM class c
--   EXCEPT (
--     SELECT c1.week_day FROM class c1
--     WHERE c1.fid = f.fid
--   )
-- );

-- -- 7. Print the Level and the average age of students for that Level.

SELECT AVG(age)::numeric(10,2) avg_age, level FROM student
GROUP BY level
ORDER BY level;

-- -- 8. Find the faculty members (fid, name), who teach more than 4 classes per semester, and the number of classes they teach in each of these semesters

-- deo biet dung k
SELECT f.fid, f.name, c.semester, COUNT(c.semester) AS "Num of classes" FROM faculty_member as f
JOIN class as c ON c.fid = f.fid
GROUP BY c.semester, f.fid, f.name
HAVING COUNT(c.semester) > 4;

-- TA chua
SELECT f.fid, f.name, COUNT(DISTINCT c.Name) AS "Number of classes"
FROM FacultyMember f JOIN Class c ON f.fid = c.fid
WHERE f.fid IN(
	SELECT f1.fid
	FROM FacultyMember f1 JOIN Class c1 ON f1.fid = c1.fid
	GROUP BY c1.Semester
	HAVING COUNT(DISTINCT c1.Name) > 4
)
GROUP BY c.semester;

-- co chua
SELECT c.semester, f.fid, f.name, COUNT(DISTINCT c.name)
FROM faculty_member f
JOIN class c ON f.fid = c.fid
GROUP BY c.semester, f.fid, f.name
HAVING COUNT(DISTINCT c.name) > 4;

-- -- 9. Find the student with the least number of class enrolled

-- query thang nao hoc it nhat (tuc la co hoc nhung hoc it nhat)
-- con thang nao khong hoc thi ke me no
SELECT DISTINCT s.snum, s.name FROM student s
WHERE s.snum IN(
		SELECT e.snum
    FROM enrolled e
    GROUP BY e.snum
    HAVING COUNT(*) <= ALL (
      SELECT COUNT(*)
      FROM enrolled e2
      GROUP BY e2.snum
    )
	);

-- query thang nao hoc it nhat la khong hoc mon nao
SELECT s.name, s.snum
FROM student s
LEFT JOIN enrolled e ON e.snum = s.snum
LEFT JOIN class c ON c.name = e.class_name
GROUP BY s.snum
HAVING COUNT(c.name) <= ALL(SELECT COUNT(c.Name)
                            FROM student s
                            LEFT JOIN enrolled e ON s.snum = e.snum
                            LEFT JOIN class c ON c.name = e.class_name
                            GROUP BY s.snum);



-- -- 10.Find the names of all students who are not enrolled in any class taught by professors from department “Computer Science”

SELECT DISTINCT s.snum, s.name
FROM student s
JOIN enrolled e ON e.snum = s.snum 
JOIN class c ON e.class_name = c.name 
JOIN faculty_member f ON c.fid = f.fid WHERE f.dept NOT IN ('Computer Science')
ORDER BY s.snum;

-- another way
SELECT DISTINCT s.snum, s.name FROM student s
INNER JOIN enrolled e ON s.snum = e.snum
INNER JOIN class c ON c.name = e.class_name
WHERE c.fid NOT IN (
  SELECT f.fid FROM faculty_member f
  WHERE f.dept = 'Computer Science'
)
ORDER BY s.snum;
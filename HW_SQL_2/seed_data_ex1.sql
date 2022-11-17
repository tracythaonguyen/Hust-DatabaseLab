-- Nguyen Thi Phuong Thao - 20205194

-- 1. Create all relations in this database

-- student
DROP TABLE IF EXISTS student;

CREATE TABLE student(
  snum BIGINT PRIMARY KEY,
  name VARCHAR(50),
  major VARCHAR(50),
  level VARCHAR(50),
  age BIGINT
);

INSERT INTO student (snum, name, major, level, age) VALUES (1, 'Prissie Belle', 'Registered Nurse', 'undergraduate', 19);
INSERT INTO student (snum, name, major, level, age) VALUES (2, 'Adler Eilhersen', 'Applied Mathematics', 'undergraduate', 20);
INSERT INTO student (snum, name, major, level, age) VALUES (3, 'Cathy Malamore', 'Human Resources', 'graduate', 24);
INSERT INTO student (snum, name, major, level, age) VALUES (4, 'Blanch Gritton', 'Senior Sales Associate', 'graduate', 24);
INSERT INTO student (snum, name, major, level, age) VALUES (5, 'Rock Tassell', 'Physical Therapy', 'undergraduate', 25);
INSERT INTO student (snum, name, major, level, age) VALUES (6, 'Dasi Ledgerton', 'Nuclear Power', 'undergraduate', 22);
INSERT INTO student (snum, name, major, level, age) VALUES (7, 'Gerek Walczak', 'Applied Mathematics', 'graduate', 27);
INSERT INTO student (snum, name, major, level, age) VALUES (8, 'Richard Mashal', 'Software Consultant', 'undergraduate', 18);
INSERT INTO student (snum, name, major, level, age) VALUES (9, 'Bonita De Nisco', 'Art Education', 'graduate', 25);
INSERT INTO student (snum, name, major, level, age) VALUES (10, 'Agneta Flexman', 'Analyst Programmer', 'undergraduate', 19);
INSERT INTO student (snum, name, major, level, age) VALUES (11, 'Klemens Froome', 'Internal Auditor', 'professional', 31);
INSERT INTO student (snum, name, major, level, age) VALUES (12, 'Margareta Burberow', 'Art Education', 'professional', 31);
INSERT INTO student (snum, name, major, level, age) VALUES (13, 'Dareen Barbosa', 'CS', 'graduate', 23);
INSERT INTO student (snum, name, major, level, age) VALUES (14, 'Gypsy Pearse', 'CS', 'undergraduate', 24);
INSERT INTO student (snum, name, major, level, age) VALUES (15, 'Jaymie Osment', 'CS', 'graduate', 25);
INSERT INTO student (snum, name, major, level, age) VALUES (16, 'Kirsten Tamas', 'Art Education', 'undergraduate', 19);
INSERT INTO student (snum, name, major, level, age) VALUES (17, 'Marshall Petken', 'Occupational Therapist', 'professional', 27);
INSERT INTO student (snum, name, major, level, age) VALUES (18, 'Wilone Hatherley', 'Environmental Tech', 'undergraduate', 18);
INSERT INTO student (snum, name, major, level, age) VALUES (19, 'Vernice Valentino', 'Executive Secretary', 'professional', 29);
INSERT INTO student (snum, name, major, level, age) VALUES (20, 'Laurette Brecknell', 'Information Science', 'undergraduate', 20);
INSERT INTO student (snum, name, major, level, age) VALUES (21, 'Lacee Hundell', 'Automation Specialist', 'professional', 29);
INSERT INTO student (snum, name, major, level, age) VALUES (22, 'Charita Amiable', 'Accounting', 'graduate', 26);
INSERT INTO student (snum, name, major, level, age) VALUES (23, 'Murdoch Parkyn', 'Media Manager', 'graduate', 23);
INSERT INTO student (snum, name, major, level, age) VALUES (24, 'Barbara-anne Avrahamy', 'Food Chemist', 'undergraduate', 24);
INSERT INTO student (snum, name, major, level, age) VALUES (25, 'Kearney Cremer', 'Database Administrator', 'undergraduate', 25);
INSERT INTO student (snum, name, major, level, age) VALUES (26, 'Fredrika Cribbott', 'Structural Analysis Engineer', 'undergraduate', 23);
INSERT INTO student (snum, name, major, level, age) VALUES (27, 'Guilbert Barrat', 'Applied Mathematics', 'undergraduate', 21);
INSERT INTO student (snum, name, major, level, age) VALUES (28, 'Edd Sells', 'Statistics', 'graduate', 28);
INSERT INTO student (snum, name, major, level, age) VALUES (29, 'Goran Stoney', 'Information Science', 'graduate', 29);
INSERT INTO student (snum, name, major, level, age) VALUES (30, 'Minda Fassam', 'Statistics', 'professional', 30);
INSERT INTO student (snum, name, major, level, age) VALUES (31, 'Steve Isgar', 'Financial Analyst', 'graduate', 31);
INSERT INTO student (snum, name, major, level, age) VALUES (32, 'Linnie Truwert', 'Actuary', 'undergraduate', 22);
INSERT INTO student (snum, name, major, level, age) VALUES (33, 'Alys Cotherill', 'Statistics', 'undergraduate', 23);
INSERT INTO student (snum, name, major, level, age) VALUES (34, 'Sly Novis', 'Applied Mathematics', 'graduate', 24);
INSERT INTO student (snum, name, major, level, age) VALUES (35, 'Paule Wales', 'Law Enforcement', 'graduate', 25);
INSERT INTO student (snum, name, major, level, age) VALUES (36, 'Belita Brickstock', 'Desktop Support Technician', 'professional', 32);
INSERT INTO student (snum, name, major, level, age) VALUES (37, 'Moyna Pelchat', 'Law Enforcement', 'undergraduate', 19);
INSERT INTO student (snum, name, major, level, age) VALUES (38, 'Willie Balmer', 'Criminal Justice', 'professional', 38);
INSERT INTO student (snum, name, major, level, age) VALUES (39, 'Elisha Bullin', 'Quality Engineer', 'professional', 29);
INSERT INTO student (snum, name, major, level, age) VALUES (40, 'Tris Handforth', 'Sales', 'graduate', 24);
INSERT INTO student (snum, name, major, level, age) VALUES (41, 'Hy Muckian', 'Internal Auditor', 'undergraduate', 23);
INSERT INTO student (snum, name, major, level, age) VALUES (42, 'Skylar Pickton', 'Criminal Justice', 'graduate', 24);
INSERT INTO student (snum, name, major, level, age) VALUES (43, 'Cortie Twinberrow', 'Design Engineer', 'undergraduate', 23);
INSERT INTO student (snum, name, major, level, age) VALUES (44, 'Syman Laight', 'Account Coordinator', 'undergraduate', 24);
INSERT INTO student (snum, name, major, level, age) VALUES (45, 'Sisely Dashkovich', 'Educational Administration', 'professional', 35);
INSERT INTO student (snum, name, major, level, age) VALUES (46, 'Dimitri Bruhnsen', 'Criminal Justice', 'graduate', 26);
INSERT INTO student (snum, name, major, level, age) VALUES (47, 'Raymond Rosenau', 'Educational Administration', 'undergraduate', 19);
INSERT INTO student (snum, name, major, level, age) VALUES (48, 'Gill Vasse', 'Educational Administration', 'undergraduate', 18);
INSERT INTO student (snum, name, major, level, age) VALUES (49, 'Tudor McCall', 'Accounting', 'professional', 29);
INSERT INTO student (snum, name, major, level, age) VALUES (50, 'Jada Dedrick', 'Software Engineer', 'graduate', 25);

-- faculty_member
DROP TABLE IF EXISTS faculty_member;

CREATE TABLE faculty_member(
  fid VARCHAR(50) PRIMARY KEY,
  name VARCHAR(50),
  dept VARCHAR(100)
);

INSERT INTO faculty_member (fid, name, dept) VALUES (1, 'Prof. Nguyen', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (2, 'Emmy Double', 'Community & Personal Services');
INSERT INTO faculty_member (fid, name, dept) VALUES (3, 'Lin Dibdin', 'Education');
INSERT INTO faculty_member (fid, name, dept) VALUES (4, 'Gaynor Liddiatt', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (5, 'Alejandrina Dyer', 'Community & Personal Services');
INSERT INTO faculty_member (fid, name, dept) VALUES (6, 'Frasier Plan', 'Education');
INSERT INTO faculty_member (fid, name, dept) VALUES (7, 'Syman Ouver', 'Education');
INSERT INTO faculty_member (fid, name, dept) VALUES (8, 'Joy Okell', 'Community Outreach Specialist');
INSERT INTO faculty_member (fid, name, dept) VALUES (9, 'Sigmund Cudworth', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (10, 'Kai Giffaut', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (11, 'Adelice Shoesmith', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (12, 'Barbe Weddell', 'Community & Personal Services');
INSERT INTO faculty_member (fid, name, dept) VALUES (13, 'Randell Boxer', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (14, 'Nicholle Cockett', 'Computer Science ');
INSERT INTO faculty_member (fid, name, dept) VALUES (15, 'Laryssa Glantz', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (16, 'Kippar Bratchell', 'Education');
INSERT INTO faculty_member (fid, name, dept) VALUES (17, 'Colet Grzeszczak', 'Community & Personal Services');
INSERT INTO faculty_member (fid, name, dept) VALUES (18, 'Dyanne Bessey', 'Community & Personal Services');
INSERT INTO faculty_member (fid, name, dept) VALUES (19, 'Jason Huckfield', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (20, 'Goldarina Sheepy', 'Computer Science & Mathematics');
INSERT INTO faculty_member (fid, name, dept) VALUES (21, 'Ginnifer Chaff', 'Education');
INSERT INTO faculty_member (fid, name, dept) VALUES (22, 'Ricky Strafford', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (23, 'Arvie Orford', 'Community & Personal Services');
INSERT INTO faculty_member (fid, name, dept) VALUES (24, 'Dyann Ruffle', 'Education');
INSERT INTO faculty_member (fid, name, dept) VALUES (25, 'Rodina Frohock', 'Education');
INSERT INTO faculty_member (fid, name, dept) VALUES (26, 'Rosalynd Orgel', 'Computer Science');
INSERT INTO faculty_member (fid, name, dept) VALUES (27, 'Dorothee Butterley', 'Computer Science & Mathematics');
INSERT INTO faculty_member (fid, name, dept) VALUES (28, 'Felice Carrack', 'Community & Personal Services');
INSERT INTO faculty_member (fid, name, dept) VALUES (29, 'Judy Shackell', 'Community & Personal Services');
INSERT INTO faculty_member (fid, name, dept) VALUES (30, 'Lexine Chimenti', 'Education');

-- class
DROP TABLE IF EXISTS class;

CREATE TABLE class(
  name VARCHAR(50) PRIMARY KEY,
  semester VARCHAR(50),
  week_day BIGINT,
  start_time TIME,
  end_time TIME,
  room VARCHAR(50),
  fid VARCHAR(50),
  FOREIGN KEY (fid) REFERENCES faculty_member (fid)
);

INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Discrete Math', 2022.1, 5, '8:12', '10:29', 'D9-503', 1);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Sale', 2021.2, 2, '12:52', '16:13', 'D9-503', 2);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Discrete Math 2', 2022.1, 6, '13:53', '16:00', 'D15-304', 1);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Intro to AI', 2022.1, 6, '13:53', '16:00', 'D9-101', 1);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Data Science', 2022.1, 4, '13:39', '16:56', 'C9-502', 1);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Design Engineer', 2021.3, 6, '7:31', '11:23', 'D9-403', 4);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Financial Analyst', 2021.3, 7, '13:41', '16:55', 'D4-301', 5);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Web Developer', 2022.1, 7, '7:25', '10:53', 'D9-502', 1);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Programming', 2022.1, 3, '12:38', '15:55', 'D9-301', 1);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Financial Analyst 2', 2022.1, 2, '16:50', '17:54', 'D9-301', 1);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Discrete Math 3', 2019.1, 3, '10:10', '12:09', 'D4-301', 9);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Programming 2', 2019.1, 2, '7:14', '9:33', 'D9-401', 10);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Intro to AI 2', 2021.2, 3, '7:06', '10:38', 'D9-301', 11);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Product Engineer', 2021.2, 4, '10:36', '12:49', 'D9-401', 13);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Design Engineer 2', 2021.3, 4, '6:33', '8:40', 'D4-301', 14);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Financial', 2021.2, 3, '12:43', '16:43', 'D9-403', 17);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Design Engineer 3',2021.2, 5, '8:26', '10:39', 'D9-505', 13);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Tax', 2021.2, 4, '11:18', '14:15', 'D9-505', 18);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Civil Engineer', 2021.2, 3, '6:49', '9:14', 'D9-407', 3);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Marketing', 2021.3, 2, '10:47', '12:36', 'D8-407', 23);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Intro to DL', 2019.1, 4, '14:49', '15:58', 'D9-505', 11);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Teaching Technique', 2021.2, 7, '9:51', '10:55', 'D9-407', 6);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Technical Architect', 2021.2, 7, '9:51', '10:55', 'D9-103', 19);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Technical Writing', 2021.2, 2, '17:57', '21:49', 'D9-205', 15);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Nuclear Engineer', 2021.3, 5, '7:45', '17:13', 'D8-201', 19);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Nuclear Engineer 2', 2019.1, 6, '6:00', '7:30', 'D9-202', 19);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Teaching Technique 2', 2021.3, 3, '17:40', '20:06', 'D9-202', 20);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Technical Writing 2',2021.2, 2, '6:33', '9:08', 'D9-205', 22);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('IT3292E Database', 2022.1, 5, '7:45', '17:25', 'D9-202', 26);
INSERT INTO class (name, semester, week_day, start_time, end_time, room, fid) VALUES ('Health Care', 2021.2, 6, '14:45', '16:17', 'D9-205', 21);

-- enrolled
DROP TABLE IF EXISTS enrolled;

CREATE TABLE enrolled(
  snum BIGINT,
  class_name VARCHAR(50),
  PRIMARY KEY (snum, class_name),
  CONSTRAINT fk_class FOREIGN KEY(class_name) REFERENCES class(name),
  CONSTRAINT fk_num FOREIGN KEY(snum) REFERENCES student(snum)
);

INSERT INTO enrolled (snum, class_name) VALUES (1, 'Discrete Math');
INSERT INTO enrolled (snum, class_name) VALUES (2, 'Sale');
INSERT INTO enrolled (snum, class_name) VALUES (3, 'Discrete Math');
INSERT INTO enrolled (snum, class_name) VALUES (4, 'Data Science');
INSERT INTO enrolled (snum, class_name) VALUES (5, 'Design Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (6, 'Financial Analyst');
INSERT INTO enrolled (snum, class_name) VALUES (7, 'Web Developer');
INSERT INTO enrolled (snum, class_name) VALUES (8, 'Intro to AI');
INSERT INTO enrolled (snum, class_name) VALUES (9, 'Programming');
INSERT INTO enrolled (snum, class_name) VALUES (10, 'Financial Analyst');
INSERT INTO enrolled (snum, class_name) VALUES (11, 'Discrete Math 2');
INSERT INTO enrolled (snum, class_name) VALUES (12, 'IT3292E Database');
INSERT INTO enrolled (snum, class_name) VALUES (13, 'IT3292E Database');
INSERT INTO enrolled (snum, class_name) VALUES (14, 'IT3292E Database');
INSERT INTO enrolled (snum, class_name) VALUES (15, 'IT3292E Database');
INSERT INTO enrolled (snum, class_name) VALUES (16, 'Financial');
INSERT INTO enrolled (snum, class_name) VALUES (17, 'Design Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (18, 'Tax');
INSERT INTO enrolled (snum, class_name) VALUES (19, 'Civil Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (20, 'Marketing');
INSERT INTO enrolled (snum, class_name) VALUES (21, 'Teaching Technique');
INSERT INTO enrolled (snum, class_name) VALUES (22, 'Technical Architect');
INSERT INTO enrolled (snum, class_name) VALUES (23, 'Intro to DL');
INSERT INTO enrolled (snum, class_name) VALUES (24, 'Nuclear Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (25, 'Nuclear Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (26, 'Teaching Technique');
INSERT INTO enrolled (snum, class_name) VALUES (27, 'Technical Writing');
INSERT INTO enrolled (snum, class_name) VALUES (28, 'Product Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (29, 'Health Care');
INSERT INTO enrolled (snum, class_name) VALUES (38, 'Tax');
INSERT INTO enrolled (snum, class_name) VALUES (1, 'Civil Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (26, 'Marketing');
INSERT INTO enrolled (snum, class_name) VALUES (2, 'Teaching Technique');
INSERT INTO enrolled (snum, class_name) VALUES (27, 'Technical Architect');
INSERT INTO enrolled (snum, class_name) VALUES (24, 'Intro to DL');
INSERT INTO enrolled (snum, class_name) VALUES (29, 'Nuclear Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (36, 'Nuclear Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (47, 'Teaching Technique');
INSERT INTO enrolled (snum, class_name) VALUES (24, 'Technical Writing');
INSERT INTO enrolled (snum, class_name) VALUES (43, 'Product Engineer');
INSERT INTO enrolled (snum, class_name) VALUES (23, 'Health Care');


SELECT s.snum, s.name FROM student s
JOIN enrolled e ON s.snum = e.snum
JOIN class c ON c.name = e.class_name
WHERE c.name IN (
  SELECT c.name FROM class c
  INNER JOIN faculty_member f ON c.fid = f.fid
  WHERE f.name = 'Prof. Nguyen' AND f.dept = 'Computer Science'
) OR c.room = 'D9-205';







--DB Software used livesql.oracle.com

--Question 2
-- Given the following portion of the enrollment table, 
--write a query to create a listing that includes class name and the number of students enrolled in the class,
-- sorted in reverse order of enrollment (eg. to tell which were the most popular classes, at the end of the term).

CREATE TABLE Enrollment 
(SID INTEGER NOT NULL, 
ClassName VARCHAR2(110),
Grade CHAR, 
PRIMARY KEY (SID,ClassName));

INSERT INTO ENROLLMENT VALUES (123, 'Synthesis algorithms', 'A');
INSERT INTO ENROLLMENT VALUES (123, 'EDM synthesis', 'B');
INSERT INTO ENROLLMENT VALUES (123, 'MIDI controllers', 'B');
INSERT INTO ENROLLMENT VALUES (662, 'Sound mixing', 'B');
INSERT INTO ENROLLMENT VALUES (662, 'EDM synthesis', 'A');
INSERT INTO ENROLLMENT VALUES (662, 'Electronic Music Fundamentals', 'A');
INSERT INTO ENROLLMENT VALUES (662, 'MIDI controllers', 'B');
INSERT INTO ENROLLMENT VALUES (345, 'MIDI controllers', 'A');
INSERT INTO ENROLLMENT VALUES (345, 'Electronic Music Fundamentals', 'B');
INSERT INTO ENROLLMENT VALUES (345, 'EDM synthesis', 'A');
INSERT INTO ENROLLMENT VALUES (555, 'EDM synthesis', 'B');
INSERT INTO ENROLLMENT VALUES (555, 'Electronic Music Fundamentals', 'B');
INSERT INTO ENROLLMENT VALUES (213, 'Electronic Music Fundamentals', 'A');


SELECT ClassName, COUNT(1) AS Total FROM Enrollment GROUP BY ClassName ORDER BY Total DESC;

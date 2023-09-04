
--DB Software used livesql.oracle.com

--Question 5
--Write a query that will pick out just the instructors who can teach every subject in the table below 
--(this is so we can hire a small number of instructors who would be easy to manage, compared to a larger group) -
-- we're deciding to offer just the classes listed below:

CREATE TABLE Courses 
(CourseName Char(50) NOT NULL,
PRIMARY KEY (CourseName));

CREATE TABLE Course_Instructor
(Instructor Char(30) NOT NULL,
CourseName Char(50) NOT NULL,
PRIMARY KEY (Instructor,CourseName));

INSERT INTO Courses VALUES ('Electronic Music Fundamentals');
INSERT INTO Courses VALUES ('MIDI controllers');
INSERT INTO Courses VALUES ('EDM synthesis');

INSERT INTO Course_Instructor VALUES ('Aleph','MIDI controllers');
INSERT INTO Course_Instructor VALUES ('Aleph','Sound mixing');
INSERT INTO Course_Instructor VALUES ('Aleph','Synthesis algorithms');
INSERT INTO Course_Instructor VALUES ('Bit','EDM synthesis');
INSERT INTO Course_Instructor VALUES ('Bit','Electronic Music Fundamentals');
INSERT INTO Course_Instructor VALUES ('Bit','Sound mixing');
INSERT INTO Course_Instructor VALUES ('CRC','EDM synthesis');
INSERT INTO Course_Instructor VALUES ('CRC','Electronic Music Fundamentals');
INSERT INTO Course_Instructor VALUES ('Dat','MIDI controllers');
INSERT INTO Course_Instructor VALUES ('Dat','EDM synthesis');
INSERT INTO Course_Instructor VALUES ('Dat','Electronic Music Fundamentals');
INSERT INTO Course_Instructor VALUES ('Emscr','MIDI controllers');
INSERT INTO Course_Instructor VALUES ('Emscr','Synthesis algorithms');
INSERT INTO Course_Instructor VALUES ('Emscr','Electronic Music Fundamentals');
INSERT INTO Course_Instructor VALUES ('Emscr','EDM synthesis');


-- To Find the Instructor that teaches all the given subject in Courses , I will print the Instructor to fetch the names from Course_Instructor table.
-- To check if the Instructor teaches all 3 given subject in Courses table, I am using JOIN  to link the  CourseName from Courses to the CourseName from Course_Instructor
-- and counting these courses for each Instructor using Group BY.


SELECT I.Instructor FROM Course_Instructor I INNER JOIN Courses C 
ON I.CourseName=C.CourseName
GROUP BY I.Instructor 
HAVING COUNT(1) IN (SELECT COUNT(1) FROM Courses)

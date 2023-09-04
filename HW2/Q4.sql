
--DB Software used livesql.oracle.com

--Question 4
--The owners decide to reward instructors with a bonus, at the end of the term. The bonus (a one-time payout) is calculated, like so:
--bonus = hourly_rate * sum_of_class_counts * 0.1
--'sum_of_class_counts' is simply a total, of student count from each class an instructor taught - eg. if instructor Dat taught Electronic Music Fundamentals, 
--EDM synthesis and MIDI controllers, with enrollments of 20, 20 and 15 students respectively, the sum_of_class_counts for Dat will be 55 
--(if a student takes multiple courses - we count that student as many times, not count them as 1).
-- Also, this bonus is just for teaching, not for supervising projects.
--Write a query that will output the highest bonus amount paid. Do feel free to create whatever table(s) you need, and populate it/them with your own data.


CREATE TABLE Student (SID INTEGER NOT NULL, FullName Char(20) NOT NULL,PRIMARY KEY (SID));

CREATE TABLE Instructor (Instructor_ID INTEGER NOT NULL, FullName Char(30) NOT NULL,HourlyRate INTEGER NOT NULL,PRIMARY KEY (Instructor_ID));

CREATE TABLE Classes (ClassID INTEGER NOT NULL, ClassName VARCHAR2(20) NOT NULL,PRIMARY KEY (ClassID));

CREATE TABLE StudentClassSchedule (ClassID INTEGER NOT NULL, SID INTEGER NOT NULL, PRIMARY KEY (ClassID,SID)); 

CREATE TABLE InstructorClassSchedule (ClassID INTEGER NOT NULL, Instructor_ID INTEGER NOT NULL, PRIMARY KEY (ClassID,Instructor_ID));

INSERT INTO Student values(1, 'ABC');
INSERT INTO Student values(2, 'DEF');
INSERT INTO Student values(3, 'GHI');
INSERT INTO Student values(4, 'JKL');
INSERT INTO Student values(5, 'MNO');
INSERT INTO Student values(6, 'F');
INSERT INTO Student values(7, 'G');
INSERT INTO Student values(8, 'H');
INSERT INTO Student values(9, 'I');
INSERT INTO Student values(10,'J');
INSERT INTO Student values(11,'K');

INSERT INTO Instructor values(1, 'X',15);
INSERT INTO Instructor values(2, 'Y',15;
INSERT INTO Instructor values(3, 'Z',15);
INSERT INTO Instructor values(4, 'W',15);
INSERT INTO Instructor values(5, 'U',15);

INSERT INTO Classes values(1, 'WebTech');
INSERT INTO Classes values(2, 'Python');
INSERT INTO Classes values(3, 'DB');
INSERT INTO Classes values(4, 'Java');

INSERT INTO StudentClassSchedule values(1, 1);
INSERT INTO StudentClassSchedule values(1, 2);
INSERT INTO StudentClassSchedule values(1, 3);
INSERT INTO StudentClassSchedule values(1, 4);
INSERT INTO StudentClassSchedule values(2, 5);
INSERT INTO StudentClassSchedule values(2, 6);
INSERT INTO StudentClassSchedule values(2, 7);
INSERT INTO StudentClassSchedule values(2, 8);
INSERT INTO StudentClassSchedule values(3, 6);
INSERT INTO StudentClassSchedule values(3, 7);
INSERT INTO StudentClassSchedule values(3, 8);
INSERT INTO StudentClassSchedule values(4, 9);
INSERT INTO StudentClassSchedule values(4, 11);
INSERT INTO StudentClassSchedule values(4, 1);
INSERT INTO StudentClassSchedule values(4, 2);

INSERT INTO InstructorClassSchedule values(1, 1);
INSERT INTO InstructorClassSchedule values(2, 2);
INSERT INTO InstructorClassSchedule values(3, 3);
INSERT INTO InstructorClassSchedule values(4, 4);
INSERT INTO InstructorClassSchedule values(4, 5);
INSERT INTO InstructorClassSchedule values(2, 5);
INSERT INTO InstructorClassSchedule values(3, 2);

--Query to calculate the Maximum highest Bonus amongst all the instructors by joining the tables and calculating the Bonus for each Instructors.

SELECT MAX(Ins.HourlyRate* T.StudentCount * 0.1) AS HighestBonus FROM (
SELECT Ins.Instructor_ID,COUNT(S.SID) AS StudentCount FROM Instructor Ins
INNER JOIN InstructorClassSchedule I ON Ins.Instructor_ID = I.Instructor_ID
INNER JOIN StudentClassSchedule S ON I.ClassID=S.ClassID 
GROUP BY Ins.Instructor_ID) T -- T is a Temporary table created to store the Details of Instructor and the total students they teach
INNER JOIN Instructor Ins ON Ins.Instructor_ID = T.Instructor_ID;



--DB Software used livesql.oracle.com

--Question 3
-- Write a query to output the project(s) where only step 0 has been completed, ie. the project gotten started but the rest of the steps are in waiting mode.


CREATE TABLE ProjectTrack 
(PID VARCHAR2(10) NOT NULL, 
Step INTEGER NOT NULL,
Status CHAR NOT NULL, 
PRIMARY KEY (PID,Step));

INSERT INTO ProjectTrack  VALUES ('P100', 0, 'C');
INSERT INTO ProjectTrack  VALUES ('P100', 1, 'W');
INSERT INTO ProjectTrack  VALUES ('P100', 2, 'W');
INSERT INTO ProjectTrack  VALUES ('P201', 0, 'C');
INSERT INTO ProjectTrack  VALUES ('P201', 1, 'C');
INSERT INTO ProjectTrack  VALUES ('P333', 0, 'W'); 
INSERT INTO ProjectTrack  VALUES ('P333', 1, 'W');
INSERT INTO ProjectTrack  VALUES ('P333', 2, 'W');
INSERT INTO ProjectTrack  VALUES ('P333', 3, 'W');


SELECT DISTINCT PID FROM ProjectTrack P1 WHERE P1.Step=0 AND P1.Status='C' AND P1.PID IN (SELECT PID FROM ProjectTrack WHERE Step=1 AND Status='W');


--DB Software used livesql.oracle.com

--Question 1
-- To work on their projects, each student group (who sit in numbered tables, as described in HW1)
--  can also (in addition to working at those numbered tables) reserve one of ten available rooms to work on their project.
--  The rooms can be reserved for a block of a few hours (eg. 3 hours), with a start time and end time, eg. 3pm-6pm, 9am-2pm etc.
--  At the end of the day, everyone goes home, so there's no possibility of rooms being booked for multiple days.
--  The table structure you are asked to use, is this [you might need to change the syntax slightly
--  , to make it work on your specific platform - same for other questions that follow]:

--There are two issues with the given Code. First, the start time could be incorrectly entered to be later than the end time. 
--Second, a new entry (for a new group) could be accidentally put in to occupy a room, even before the existing group in that room is done using that room. 
--For simplicity, you can express times in the 24h 'military-style' format, eg. 9 for 9AM, 17 for 5PM, etc. 
--For further simplicity, all bookings start and end 'on the hour', so, ints between 7 (7AM) and 18 (6PM) should be sufficient.

-- To solve the mentioned two issues:
-- Created the bookDate variable to check the Date of the Booking
-- Created the Constraint CHECK to Insert those values which have startTime less than EndTime
-- Created a validation CHECK to verify user enters the time between 7-18 and not more than that
-- Created a TRIGGER 'RoomBook_Check' to verify new booking is not overlapping with the previous one

CREATE TABLE ProjectRoomBookings 
(roomNum INTEGER NOT NULL, 
bookDate DATE,
startTime INTEGER NOT NULL  CHECK  (startTime > 6 AND startTime < 19 ), 
endTime INTEGER NOT NULL CHECK  (endTime > 6 AND endTime < 19 ),
groupName CHAR(10) NOT NULL, 
PRIMARY KEY (roomNum,startTime,groupName,bookDate),
CONSTRAINT Check_RoomBook CHECK (startTime < endTime ));


CREATE OR REPLACE TRIGGER RoomBook_Check
BEFORE INSERT OR UPDATE ON ProjectRoomBookings
FOR EACH ROW
DECLARE
RoomBooked NUMBER;
BEGIN
SELECT COUNT(*) INTO RoomBooked FROM ProjectRoomBookings
WHERE :new.roomNum=roomNum AND :new.bookDate=bookDate AND NOT (:new.startTime>=endTime OR :new.endTime<= startTime);
IF RoomBooked > 0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'ROOM IS ALREADY BOOKED');
END IF;
END;
/


INSERT INTO ProjectRoomBookings VALUES (1,DATE '2022-10-10', 12, 15, 'A');
INSERT INTO ProjectRoomBookings VALUES (1,DATE '2022-10-10', 13, 15, 'B');
INSERT INTO ProjectRoomBookings VALUES (1,DATE '2022-10-10', 13, 17, 'C');
INSERT INTO ProjectRoomBookings VALUES (1,DATE '2022-10-10', 7, 5, 'D');
INSERT INTO ProjectRoomBookings VALUES (2,DATE '2022-10-10', 4, 9, 'E');
INSERT INTO ProjectRoomBookings VALUES (2,DATE '2022-10-10', 9, 12, 'F');
INSERT INTO ProjectRoomBookings VALUES (3,DATE '2022-10-10', 1, 19, 'G');
INSERT INTO ProjectRoomBookings VALUES (3,DATE '2022-10-10', 5, 8, 'H');

select * from ProjectRoomBookings;

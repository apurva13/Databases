
Design explained for the ER diagram created:

1.	REGISTRATION: This entity is created to connect COURSE, STUDENT and PROJECT. We assume that each student will register for zero or many courses and projects.

2.	FACULTY: Each instructor will be paid according to the total hours taught in courses and total hours supervised in projects with their respective payment stored in SALARY entity which can calculates the amount.
Each faculty can supervise one or more projects OR each project can be under supervision of one or many faculties.
Each faculty can teach one or more courses OR each courses can be taught by one or many faculties.
Each faculty can suggest one or more textbooks OR each textbook can be referred by one or many faculties.

3.	STUDENT: Each student will pay the total amount of the curriculum at once and the details of the payment will be stored in the FEES entity. As we assume that the fees of each student will cover all the project and courses amount. We are also creating an attribute “FINE” which will help to track library and item fines.

4.	LIBRARY: Assume that one or more textbooks can be found in library that are suggested by faculty. We are also creating a special entity called ISSUE_RECORDS which manages the issue and return dates of the books issued by the students from the library and the students can issue not more than 4 books at a time

5.	RATINGS: Each student will rate one or many faculty, courses, and projects.

6.	ORDER: We assume that owners of the institution will place one or many orders from zero or many vendors. Those orders will consist of one or many items.

7.	BOX: Each box will consist of one or many items. We also assume that we will keep the track of the condition of the box while returning in the attribute “Return _Condition”. Each box will be placed on each table.

8.	TABLE: Each group will sit on each table.

9.	SCHEDULE: Each schedule will consist of the date, timings and the room allocated for the respective Course or Project

10.	PROJECT GROUP: Each group has a unique project. We also assume that projects are created by each group and are not provided by the institution.




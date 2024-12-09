SET IDENTITY_INSERT Faculty ON;
INSERT INTO Faculty (Faculty_ID, Name, Dean_Name)
VALUES 
(1, 'Engineering', 'Test'),
(2, 'Business', 'Test'),
(3, 'Arts', 'Test');
SET IDENTITY_INSERT Faculty OFF;

SET IDENTITY_INSERT Student ON;
INSERT INTO Student (Student_ID, Name, Surname, Date_of_Birth, Faculty_ID)
VALUES 
(101, 'Alice', 'Tester1', '2003-04-24', 1),
(102, 'Bob', 'Tester2', '2002-11-27', 2),
(103, 'Charlie', 'Tester3', '2003-05-25', 1),
(104, 'Diana', 'Tester4', '2005-11-11', 3);
SET IDENTITY_INSERT Student OFF;


SET IDENTITY_INSERT Course ON;
INSERT INTO Course (Course_ID, Name, Credits, Faculty_ID)
VALUES 
(201, 'Data Structures', 5, 1),
(202, 'Marketing 101', 3, 2),
(203, 'Creative Writing', 2, 3);
SET IDENTITY_INSERT Course OFF;

SET IDENTITY_INSERT Enrollment ON;
INSERT INTO Enrollment (Enroll_ID, Student_ID, Course_ID, Term)
VALUES 
(1, 101, 201, 20242),
(2, 102, 202, 20242),
(3, 103, 201, 20242),
(4, 104, 203, 20242);
SET IDENTITY_INSERT Enrollment OFF;


SELECT * FROM Faculty;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;

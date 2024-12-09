--FacultyCourses: Fakültelerin verdiği derslerin listesini görüntülemek için.
CREATE VIEW FacultyCourses AS
SELECT 
    Faculty.Faculty_ID,
    Faculty.Name AS Faculty_Name,
    Course.Course_ID,
    Course.Name AS Course_Name,
    Course.Credits
FROM 
    Faculty
INNER JOIN 
    Course ON Faculty.Faculty_ID = Course.Faculty_ID;

--StudentEnrollments: Öğrencilerin ders kayıtları ve notlarını göstermek için.
CREATE VIEW StudentEnrollments AS
SELECT 
    Student.Student_ID,
    Student.Name AS Student_Name,
    Student.Surname AS Student_Surname,
    Course.Course_ID,
    Course.Name AS Course_Name,
    Enrollment.Term,
    Enrollment.Grade
FROM 
    Enrollment
INNER JOIN 
    Student ON Enrollment.Student_ID = Student.Student_ID
INNER JOIN 
    Course ON Enrollment.Course_ID = Course.Course_ID;

--CourseEnrollmentSummary: Ders bazında kayıtlı öğrenci sayısını görmek için.
CREATE VIEW CourseEnrollmentSummary AS
SELECT 
    Course.Course_ID,
    Course.Name AS Course_Name,
    Faculty.Name AS Faculty_Name,
    COUNT(Enrollment.Enroll_ID) AS Total_Enrollments
FROM 
    Course
LEFT JOIN 
    Faculty ON Course.Faculty_ID = Faculty.Faculty_ID
LEFT JOIN 
    Enrollment ON Course.Course_ID = Enrollment.Course_ID
GROUP BY 
    Course.Course_ID, Course.Name, Faculty.Name;

--GradeChangeHistory: Not değişimlerini takip etmek için.
CREATE VIEW GradeChangeHistory AS
SELECT 
    Grade_Log.Log_ID,
    Grade_Log.Enroll_ID,
    Student.Student_ID,
    Student.Name AS Student_Name,
    Course.Name AS Course_Name,
    Grade_Log.Old_Grade,
    Grade_Log.New_Grade,
    Grade_Log.Update_Time
FROM 
    Grade_Log
INNER JOIN 
    Enrollment ON Grade_Log.Enroll_ID = Enrollment.Enroll_ID
INNER JOIN 
    Student ON Enrollment.Student_ID = Student.Student_ID
INNER JOIN 
    Course ON Enrollment.Course_ID = Course.Course_ID;

--OperationHistory: Sistem aktivitelerini izlemek için.
CREATE VIEW OperationHistory AS
SELECT 
    Operation_Log.Log_ID,
    Operation_Log.Table_Name,
    Operation_Log.Operation_Type,
    Operation_Log.Record_ID,
    Operation_Log.Operation_Time
FROM 
    Operation_Log
ORDER BY 
    Operation_Log.Operation_Time DESC;

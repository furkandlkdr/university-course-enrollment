-- GradeUpdate: Not güncellemelerini loglamak için.
CREATE TRIGGER trg_GradeUpdate
ON Enrollment
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF UPDATE(Grade)
    BEGIN
        INSERT INTO Grade_Log (Enroll_ID, Old_Grade, New_Grade, Update_Time)
        SELECT 
            i.Enroll_ID, 
            d.Grade AS Old_Grade, 
            i.Grade AS New_Grade, 
            GETDATE()
        FROM inserted i
        INNER JOIN deleted d ON i.Enroll_ID = d.Enroll_ID
        WHERE ISNULL(d.Grade, '') <> ISNULL(i.Grade, '');
    END
END;

-- [x]OperationLog: Tablo ekleme, güncelleme ve silme işlemlerini loglamak için.
CREATE TRIGGER trg_StudentOperationLog
ON Student
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Student', 'INSERT', Student_ID, GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Student', 'UPDATE', Student_ID, GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Student', 'DELETE', Student_ID, GETDATE()
        FROM deleted;
    END
END;

CREATE TRIGGER trg_CourseOperationLog
ON Course
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Course', 'INSERT', Course_ID, GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Course', 'UPDATE', Course_ID, GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Course', 'DELETE', Course_ID, GETDATE()
        FROM deleted;
    END
END;

CREATE TRIGGER trg_FacultyOperationLog
ON Faculty
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Faculty', 'INSERT', Faculty_ID, GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Faculty', 'UPDATE', Faculty_ID, GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Faculty', 'DELETE', Faculty_ID, GETDATE()
        FROM deleted;
    END
END;

CREATE TRIGGER trg_EnrollmentOperationLog 
ON Enrollment
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Enrollment', 'INSERT', Enroll_ID, GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Enrollment', 'UPDATE', Enroll_ID, GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO Operation_Log (Table_Name, Operation_Type, Record_ID, Operation_Time)
        SELECT 'Enrollment', 'DELETE', Enroll_ID, GETDATE()
        FROM deleted;
    END
END;

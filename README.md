# University Course Registration System

A SQL-based course registration and management system for universities that handles student enrollments, courses, faculties and automatically logs changes.

## Database Structure

### Tables
- **Student**: Stores student information
- **Course**: Contains course details
- **Faculty**: Manages faculty information  
- **Enrollment**: Tracks student course registrations
- **Grade_Log**: Records grade changes history
- **Operation_Log**: Tracks all database operations

### Entity Relationships
- Students belong to Faculties (Faculty_ID)
- Courses are offered by Faculties (Faculty_ID) 
- Enrollments link Students to Courses

## Triggers

### Grade Change Tracking
- `trg_GradeUpdate`: Logs grade changes in Enrollment table to Grade_Log

### Operation Logging
- `trg_StudentOperationLog`: Tracks Student table changes
- `trg_CourseOperationLog`: Tracks Course table changes  
- `trg_FacultyOperationLog`: Tracks Faculty table changes
- `trg_EnrollmentOperationLog`: Tracks Enrollment table changes


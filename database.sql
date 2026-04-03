-- =========================================
-- CREATE DATABASE
-- =========================================
CREATE DATABASE CollegeDB;


-- =========================================
-- CREATE TABLES
-- =========================================

-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    Major VARCHAR(50) NOT NULL
);

-- Instructor Table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(50) NOT NULL,
    InstructorEmail VARCHAR(100) NOT NULL
);

-- Course Table
CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    InstructorID INT NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Enrollment Table (Junction Table)
CREATE TABLE Enrollment (
    StudentID INT NOT NULL,
    CourseID VARCHAR(10) NOT NULL,
    Semester VARCHAR(20) NOT NULL,
    Grade CHAR(1) NOT NULL,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


-- =========================================
-- INSERT DATA
-- =========================================

-- Student Data
INSERT INTO Student (StudentID, StudentName, Major)
VALUES
(101, 'Eli Porter', 'Cybersecurity'),
(102, 'Tamia Bolden', 'CS'),
(103, 'Lebron James', 'AI'),
(104, 'Tom Brady', 'SE'),
(105, 'Oprah Winfrey', 'Cybersecurity'),
(106, 'Drake', 'AIE');

-- Instructor Data
INSERT INTO Instructor (InstructorID, InstructorName, InstructorEmail)
VALUES
(1, 'Corey Burk', 'cburk@neumont.edu'),
(2, 'Paul Fox', 'pfox@neumont.edu'),
(3, 'Beardall', 'bbeardall@neumont.edu'),
(4, 'Maple', 'rmaple@neumont.edu');

-- Course Data
INSERT INTO Course (CourseID, CourseName, InstructorID)
VALUES
('C101', 'Databases', 1),
('C102', 'Scripting', 2),
('CS101', 'OOP', 3),
('AI101', 'Intro to AI', 4),
('SE101', 'Python', 2),
('SE102', 'Intro to CS', 3),
('AIE101', 'AI Tools', 4);

-- Enrollment Data
INSERT INTO Enrollment (StudentID, CourseID, Semester, Grade)
VALUES
(101, 'C101', 'Spring 2026', 'A'),
(101, 'C102', 'Spring 2026', 'A'),
(102, 'CS101', 'Spring 2026', 'B'),
(103, 'AI101', 'Spring 2026', 'A'),
(104, 'SE101', 'Spring 2026', 'C'),
(104, 'SE102', 'Spring 2026', 'B'),
(105, 'C102', 'Spring 2026', 'A'),
(106, 'AIE101', 'Spring 2026', 'A');


-- =========================================
-- SELECT (VIEW DATA)
-- =========================================

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Enrollment;


-- =========================================
-- JOIN QUERY (MAIN QUERY)
-- =========================================

SELECT Student.StudentName, Course.CourseName, Enrollment.Grade
FROM Student
JOIN Enrollment ON Student.StudentID = Enrollment.StudentID
JOIN Course ON Enrollment.CourseID = Course.CourseID;


-- =========================================
-- FILTERED QUERIES
-- =========================================

-- Show only Eli's classes
SELECT Student.StudentName, Course.CourseName, Enrollment.Grade
FROM Student
JOIN Enrollment ON Student.StudentID = Enrollment.StudentID
JOIN Course ON Enrollment.CourseID = Course.CourseID
WHERE Student.StudentName = 'Eli Porter';

-- Show only A grades
SELECT Student.StudentName, Course.CourseName, Enrollment.Grade
FROM Student
JOIN Enrollment ON Student.StudentID = Enrollment.StudentID
JOIN Course ON Enrollment.CourseID = Course.CourseID
WHERE Enrollment.Grade = 'A';


-- =========================================
-- ADVANCED JOIN (4 TABLES)
-- =========================================

SELECT Student.StudentName, Course.CourseName, Instructor.InstructorName, Enrollment.Grade
FROM Student
JOIN Enrollment ON Student.StudentID = Enrollment.StudentID
JOIN Course ON Enrollment.CourseID = Course.CourseID
JOIN Instructor ON Course.InstructorID = Instructor.InstructorID;
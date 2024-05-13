-- Create Department Table
CREATE TABLE Department (
    Dno INT PRIMARY KEY,
    Dname VARCHAR(100)
);

-- Create Branch Table
CREATE TABLE Branch (
    Bcode INT PRIMARY KEY,
    Bname VARCHAR(100),
    Dno INT,
    CONSTRAINT FK_Branch_Dno FOREIGN KEY (Dno) REFERENCES Department(Dno)
);

-- Create Student Table
CREATE TABLE Student (
    Rollno INT PRIMARY KEY,
    Name VARCHAR(100),
    Dob DATE,
    Gender CHAR(1),
    Doa DATE,
    Bcode INT,
    CONSTRAINT FK_Student_Bcode FOREIGN KEY (Bcode) REFERENCES Branch(Bcode)
);

-- Create Course Table
CREATE TABLE Course (
    Ccode INT PRIMARY KEY,
    Cname VARCHAR(100),
    Credits INT,
    Dno INT,
    CONSTRAINT FK_Course_Dno FOREIGN KEY (Dno) REFERENCES Department(Dno)
);

CREATE TABLE Branch_Course (
    Bcode INT,
    Ccode INT,
    Semester VARCHAR(20),
    PRIMARY KEY (Bcode, Ccode),
    CONSTRAINT FK_Branch_Course_Bcode FOREIGN KEY (Bcode) REFERENCES Branch(Bcode),
    CONSTRAINT FK_Branch_Course_Ccode FOREIGN KEY (Ccode) REFERENCES Course(Ccode)
);

-- Create Enrolls Table
CREATE TABLE Enrolls (
    Rollno INT,
    Ccode INT,
    Sess VARCHAR(20),
    Grade CHAR(1),
    PRIMARY KEY (Rollno, Ccode),
    CONSTRAINT FK_Enrolls_Rollno FOREIGN KEY (Rollno) REFERENCES Student(Rollno),
    CONSTRAINT FK_Enrolls_Ccode FOREIGN KEY (Ccode) REFERENCES Course(Ccode)
);

-- Add check constraints

-- Check constraint for Gender in Student Table
ALTER TABLE Student 
ADD CONSTRAINT CHK_Gender CHECK (Gender IN ('M', 'F'));

-- Check constraint for Date of Admission (Doa) in Student Table
ALTER TABLE Student
ADD CONSTRAINT CHK_Doa CHECK (Doa IS NOT NULL);




-- Check constraint for Session (Sess) in Enrolls Table
ALTER TABLE Enrolls 
ADD CONSTRAINT CHK_Sess CHECK (Sess IN ('APRIL 2013', 'NOV 2013'));

-- Check constraint for Grade in Enrolls Table
ALTER TABLE Enrolls 
ADD CONSTRAINT CHK_Grade CHECK (Grade IN ('S', 'A', 'B', 'C', 'D', 'E', 'U'));

-- Drop foreign key constraints

-- Drop foreign key constraint FK_Student_Bcode referencing the Branch table
ALTER TABLE Student DROP CONSTRAINT FK_Student_Bcode;

-- Drop foreign key constraint FK_Branch_Course_Bcode referencing the Branch table
ALTER TABLE Branch_Course DROP CONSTRAINT FK_Branch_Course_Bcode;

-- Drop foreign key constraint FK_Branch_Course_Ccode referencing the Course table
ALTER TABLE Branch_Course DROP CONSTRAINT FK_Branch_Course_Ccode;

-- Drop foreign key constraint FK_Enrolls_Rollno referencing the Student table
ALTER TABLE Enrolls DROP CONSTRAINT FK_Enrolls_Rollno;

-- Drop foreign key constraint FK_Enrolls_Ccode referencing the Course table
ALTER TABLE Enrolls DROP CONSTRAINT FK_Enrolls_Ccode;

-- Drop the tables

-- Drop the Enrolls table
DROP TABLE Enrolls;

-- Drop the Branch_Course table
DROP TABLE Branch_Course;

-- Drop the Student table
DROP TABLE Student;

-- Drop the Course table
DROP TABLE Course;

-- Drop the Branch table
DROP TABLE Branch;

-- Drop the Department table
DROP TABLE Department;

-- Insert sample data into the Department table
INSERT INTO Department (Dno, Dname) VALUES (1, 'Computer Science');
INSERT INTO Department (Dno, Dname) VALUES (2, 'Electrical Engineering');
INSERT INTO Department (Dno, Dname) VALUES (3, 'Mechanical Engineering');

-- Insert sample data into the Branch table 
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (101, 'CS Branch A', 1);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (102, 'CS Branch B', 1);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (103, 'CS Branch C', 1);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (104, 'CS Branch D', 1);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (201, 'EE Branch A', 2);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (202, 'EE Branch B', 2);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (203, 'EE Branch C', 2);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (301, 'ME Branch A', 3);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (302, 'ME Branch B', 3);
INSERT INTO Branch (Bcode, Bname, Dno) VALUES (303, 'ME Branch C', 3);

 -- Added another new branch for Mechanical Engineering

-- Now, each department has more than 3 branches


-- Insert sample data into the Student table
INSERT INTO Student (Rollno, Name, Dob, Gender, Doa, Bcode) VALUES (1001, 'John Doe', DATE '1998-05-15', 'M', DATE '2021-09-01', 101);
INSERT INTO Student (Rollno, Name, Dob, Gender, Doa, Bcode) VALUES (1002, 'Jane Smith', DATE '1999-02-28', 'F', DATE '2021-09-01', 101);
INSERT INTO Student (Rollno, Name, Dob, Gender, Doa, Bcode) VALUES (1003, 'Alice Johnson', DATE '2000-08-10', 'F', DATE '2021-09-01', 102);


-- Insert sample data into the Course table
INSERT INTO Course (Ccode, Cname, Credits, Dno) VALUES (501, 'Advanced Programming', 4, 1);
INSERT INTO Course (Ccode, Cname, Credits, Dno) VALUES (502, 'Web Development', 3, 1);
INSERT INTO Course (Ccode, Cname, Credits, Dno) VALUES (503, 'Data Structures', 3, 1);
INSERT INTO Course (Ccode, Cname, Credits, Dno) VALUES (504, 'Database Design', 4, 1);
INSERT INTO Course (Ccode, Cname, Credits, Dno) VALUES (505, 'Algorithms', 4, 1);
INSERT INTO Course (Ccode, Cname, Credits, Dno) VALUES (506, 'Machine Learning', 4, 1);
INSERT INTO Course (Ccode, Cname, Credits, Dno) VALUES (507, 'Software Engineering', 3, 1);



-- Insert sample data into the Branch_Course table
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (101, 501, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (102, 501, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (103, 501, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (104, 501, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (101, 502, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (102, 502, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (103, 502, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (104, 502, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (101, 503, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (102, 503, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (103, 503, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (104, 503, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (101, 504, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (102, 504, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (103, 504, 'Fall 2021');
INSERT INTO Branch_Course (Bcode, Ccode, Semester) VALUES (104, 504, 'Fall 2021');




-- Insert sample data into the Enrolls table
INSERT INTO Enrolls (Rollno, Ccode, Sess, Grade) VALUES (1001, 501, 'APRIL 2013', 'S');
INSERT INTO Enrolls (Rollno, Ccode, Sess, Grade) VALUES (1001, 502, 'APRIL 2013', 'S');
INSERT INTO Enrolls (Rollno, Ccode, Sess, Grade) VALUES (1001, 503, 'APRIL 2013', 'S');
INSERT INTO Enrolls (Rollno, Ccode, Sess, Grade) VALUES (1002, 501, 'APRIL 2013', 'S');
INSERT INTO Enrolls (Rollno, Ccode, Sess, Grade) VALUES (1002, 502, 'APRIL 2013', 'S');
INSERT INTO Enrolls (Rollno, Ccode, Sess, Grade) VALUES (1002, 503, 'APRIL 2013', 'S');
INSERT INTO Enrolls (Rollno, Ccode, Sess, Grade) VALUES (1003, 501, 'APRIL 2013', 'S');
INSERT INTO Enrolls (Rollno, Ccode, Sess, Grade) VALUES (1003, 502, 'APRIL 2013', 'S');

--1no. query
SELECT Dno, Dname
FROM Department
WHERE Dno IN (
    SELECT Dno
    FROM Branch
    GROUP BY Dno
    HAVING COUNT(*) > 3
);

--b
SELECT Dno, Dname
FROM Department
WHERE Dno IN (
    SELECT Dno
    FROM Course
    GROUP BY Dno
    HAVING COUNT(*) > 6
);

--c
SELECT Ccode, Cname
FROM Course
WHERE Ccode IN (
    SELECT Ccode
    FROM Branch_Course
    GROUP BY Ccode
    HAVING COUNT(*) > 3
);
--d
SELECT Rollno, COUNT(*) AS CoursesWithS
FROM Enrolls
WHERE Grade = 'S'
GROUP BY Rollno
HAVING COUNT(*) > 2;

--e

CREATE VIEW SuccessfulCourses AS
SELECT e.Rollno, s.Name, COUNT(*) AS SuccessfulCourses
FROM Enrolls e
JOIN Student s ON e.Rollno = s.Rollno
WHERE e.Grade IN ('S', 'A', 'B', 'C')
GROUP BY e.Rollno, s.Name;

SELECT *
FROM SuccessfulCourses;


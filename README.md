# college-database-project
SQL database project demonstrating normalization and joins
# College Database Project

## Overview

This project demonstrates the design and implementation of a relational database for a college system using SQL Server.

## Concepts Used

* Database Normalization (1NF, 2NF, 3NF)
* Primary Keys and Foreign Keys
* One-to-Many and Many-to-Many relationships
* Junction Tables (Enrollment)
* SQL Queries (SELECT, JOIN, WHERE, UPDATE)

## Database Structure

* Student
* Instructor
* Course
* Enrollment

## Example Query

SELECT Student.StudentName, Course.CourseName, Enrollment.Grade
FROM Student
JOIN Enrollment ON Student.StudentID = Enrollment.StudentID
JOIN Course ON Enrollment.CourseID = Course.CourseID;

## Tools Used

* SQL Server Management Studio (SSMS)
* Microsoft Excel

## What I Learned

* How to design normalized databases
* How to enforce relationships using keys
* How to retrieve data using SQL joins

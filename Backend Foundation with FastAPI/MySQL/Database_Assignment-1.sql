CREATE DATABASE UniversityDB;
USE UniversityDB;

#1.

create TABLE Student(
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(20),
    Email VARCHAR(30),
    LastName VARCHAR(20),
    Age INT,
    Department VARCHAR(20)
);

CREATE TABLE Library(
    LibraryID INT PRIMARY KEY AUTO_INCREMENT,
    BookName VARCHAR(20),
    AUthor varchar(20),
    StudentID INT,
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)

);

CREATE TABLE Fees(
    FeeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    TotalFees DECIMAL(10,2),
    PaidAmount DECIMAL(10,2),
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID) 
);

#2.
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 16),
    Department VARCHAR(50) NOT NULL
);

CREATE TABLE Library (
    LibraryID INT PRIMARY KEY AUTO_INCREMENT,
    BookName VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    StudentID INT NOT NULL,
    FOREIGN KEY (StudentID)
    REFERENCES Student(StudentID)
);


CREATE TABLE Fees (
    FeeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    TotalFees DECIMAL(10,2) NOT NULL,
    PaidAmount DECIMAL(10,2) DEFAULT 0,
    CHECK (TotalFees >= 0),
    CHECK (PaidAmount >= 0),
    CHECK (PaidAmount <= TotalFees),
    FOREIGN KEY (StudentID)
    REFERENCES Student(StudentID)
);

#4.

SET SQL_SAFE_UPDATES = 0;

UPDATE Student
SET Age = 25
WHERE StudentID = 1;
DELETE FROM Student
WHERE StudentID = 1;

SET SQL_SAFE_UPDATES = 1;





CREATE TABLE Employee(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Age INT CHECK(Age>20),
    Department VARCHAR(20)
);

INSERT INTO Employee(EmployeeID,FirstName,LastName,Age,Department)
VALUES(1,"John","Doe",28,"Sales"),
(2,"Jane","Smith",32,"MArketing"),
(3,"Michael","Johnson",35,"Finance"),
(4,"Sarah","Brown",30,"HR"),
(5,"William","Davis",25,"Engineering"),
(6,"Emily","Wilson",28,"Sales"),
(7,"Robert","Lee",33,"Marketing"),
(8,"Laura","Hall",29,"Finance"),
(9,"Thomas","White",31,"HR"),
(10,"Olivia","Clark",27,"Engineering");

#5.
SELECT DISTINCT Department from Employee;

#6.
SELECT LastName FROM Employee
ORDER BY Age DESC;

#7. 
SELECT LastName FROM Employee
WHERE Age>30 AND Department='Marketing';

#8.
Select * FROM Employee;

#9.
Select * FROM Employee
WHERE FirstName LIKE "%son%"
OR LastName LIKE "%son%";

#10.

SELECT *
FROM Employee
WHERE Department LIKE '%Engineer%';


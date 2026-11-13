USE Phitron;
#Different 4 ways of constraints use:
#1.
CREATE TABLE Student(
    Roll CHAR(4) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(60) UNIQUE,
    Address VARCHAR(250),
    Age INT CHECK(Age>18)
);
#2.
CREATE TABLE Student(
    Roll CHAR(4) ,
    Name VARCHAR(50),
    Email VARCHAR(60),
    Address VARCHAR(250),
    Age INT,
    PRIMARY KEY(Roll),
    UNIQUE(Email),
    CHECK(Age>18)
);
#3.
CREATE TABLE Student(
    Roll CHAR(4) ,
    Name VARCHAR(50),
    Email VARCHAR(60),
    Address VARCHAR(250),
    Age INT,
    Roll CHAR(4) ,
    Name VARCHAR(50),
    Email VARCHAR(60),
    Address VARCHAR(250),
    Age INT,
    CONSTRAINT PRIMARY KEY(Roll),
    CONSTRAINT UNIQUE(Email),
    CONSTRAINT CHECK(Age>18)
);
#4.
CREATE TABLE Student(
    Roll CHAR(4) ,
    Name VARCHAR(50),
    Email VARCHAR(60),
    Address VARCHAR(250),
    Age INT,
    Roll CHAR(4) ,
    Name VARCHAR(50),
    Email VARCHAR(60),
    Address VARCHAR(250),
    Age INT,
    CONSTRAINT pk_rule PRIMARY KEY(Roll),
    CONSTRAINT unique_rule UNIQUE(Email),
    CONSTRAINT check_rule CHECK(Age>18)
);

INSERT INTO Student(Roll,Name, Email, Address, Age) VALUES('0001',"Dibya",'dibya@gmail.com',"Dhanmondi",19);

CREATE TABLE Library(
    BookName VARCHAR(4) PRIMARY KEY,
    WhoHired_Roll char(4),
    FOREIGN KEY(WhoHired_Roll) REFERENCES Student(Roll)

);

# Composite Primary Key create: 
CREATE TABLE Course
(
    CourseName VARCHAR(30),
    University VARCHAR(30),
    Credit INT,

    PRIMARY KEY(CourseName, University)


);

SELECT * FROM Student;

Select email+address
from Student;

Select * FROM Student WHERE Age>15;



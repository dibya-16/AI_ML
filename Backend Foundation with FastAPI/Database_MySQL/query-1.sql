
USE Phitron;


CREATE TABLE Student;


CREATE TABLE Student(
    Roll CHAR(4) PRIMARY KEY,
    Name VARCHAR(50),
    Marks DOUBLE
);

DROP TABLE Student;

INSERT INTO student
(Roll,Name,Marks) VALUES(1,'Dibya',90);

INSERT INTO student
(Roll,Name) VALUES(2,'RK');


UPDATE Student
SET Name= 'Dibya Jyoti Hore'
WHERE Roll=1;

DELETE FROM Student
WHERE Roll= 2;

SET SQL_SAFE_UPDATES=0 # 0 means off and 1 dile on hobe.onk shomoy laage eta



#dummy database file theke full code run korle ekta data base create hobe.ekhane dummydb naame create hoise.

#basic query

SELECT * FROM countries;
select * FROM departments;
select * from employees;
select first_name, last_name from employees;
select * FROM employees
WHERE department_id=60;
select * FROM employees
WHERE department_id=60 AND salary>8000;
SELECT first_name, salary,salary+10000 from employees;
SELECT first_name, salary,salary+10000 from employees where department_id=100;
select * from employees where salary>6000;
select DISTINCT job_id from employees;
select * from employees ORDER BY salary ASC;
select * from employees ORDER BY salary DESC;
select * from employees 
ORDER BY salary DESC
LIMIT 5;
select * from employees 
ORDER BY salary DESC
LIMIT 4, 5;
select * from employees 
ORDER BY salary DESC
LIMIT 5
OFFSET 4;
SELECT * FROM employees
where last_name like "Green%";
SELECT * FROM employees
where last_name like "%ee%";
select first_name, salary AS 'current salary',salary+1000 AS increased_salary
from employees;


#function

SELECT first_name,UPPER(first_name) from employees;
select cos(radians(90));
select cos(0);
select acos(1);
select pi();
select round(12.567,2);
select rand();
select * from employees;
SELECT MAX(Salary) from employees;
SELECT Min(Salary) from employees;
SELECT AVG(Salary) from employees;
SELECT COUNT(Salary) from employees;
SELECT COUNT(employee_id) from employees;
SELECT COUNT(manager_id) from employees;
SELECT COUNT(*) from employees;
select * from employees;
select department_id, MAX(salary) from employees
GROUP BY department_id;
select department_id, COUNT(*) from employees
GROUP BY department_id;
select department_id, MAX(salary) from employees
GROUP BY department_id;
select department_id, MAX(salary) from employees
WHERE department_id!=20
GROUP BY department_id;
select department_id, MAX(salary) from employees
WHERE department_id!=20
GROUP BY department_id
HAVING MAX(SAlary)>5000; 
select department_id, AVG(salary) as sal from employees
WHERE department_id!=20
GROUP BY department_id
HAVING sal>5000; 




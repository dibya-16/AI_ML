USE dummydb;
SELECT * FROM employees;
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME="PETER";
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID=144;
SELECT * FROM EMPLOYEES
WHERE SALARY <2500;

#SUBQUERY

SELECT * FROM EMPLOYEES
WHERE SALARY <(SELECT SALARY FROM EMPLOYEES
WHERE EMPLOYEE_ID= 144);
SELECT * FROM employees
WHERE SALARY=(SELECT MAX(SALARY) FROM employees);
SELECT * FROM employees 
WHERE department_id= (SELECT department_id FROM departments WHERE department_name='MARKETING');
SELECT AVG(SALARY) FROM employees 
WHERE department_id= (SELECT department_id FROM departments WHERE department_name='MARKETING');
SELECT MIN(SALARY) FROM employees 
WHERE department_id= (SELECT department_id FROM departments WHERE department_name='MARKETING');
SELECT COUNT(*) AS 'Members of IT' FROM employees 
WHERE department_id= (SELECT department_id FROM departments WHERE department_name='IT');
select * from employees 
where job_id=(select job_id from jobs where job_title='programmer');
select SUM(salary) from employees 
where job_id=(select job_id from jobs where job_title='programmer');


#Advanced Subquery

select * from employees
where salary=(select distinct salary from employees
order by salary DESC
limit 1
OFFSET 1);

select max(salary) from employees 
where salary<(select max(salary) from employees);

select * from employees
where salary=(select max(salary) from employees 
where salary<(select max(salary) from employees));

select * from employees AS EMP
where salary >(select salary from employees AS MGR 
              WHERE EMP.MANAGER_ID=MGR.EMPLOYEE_ID 
             );

select * from employees AS EMP
where job_id =(select job_id from employees AS MGR 
              WHERE EMP.MANAGER_ID=MGR.EMPLOYEE_ID 
             );

# COMMON TABLE EXPRESSION(CTE)


WITH TEMP AS (
    SELECT * FROM EMPLOYEES LIMIT 5)
SELECT * FROM TEMP;



WITH AVGIT AS (
    SELECT AVG(SALARY) AS SAL1 FROM EMPLOYEES WHERE DEPARTMENT_ID=60 #IT
),
MAXMARKETING AS (
    SELECT MAX(SALARY) AS SAL2 FROM EMPLOYEES WHERE DEPARTMENT_ID=20  #MARKETING
)
SELECT * FROM employees
WHERE SALARY > (SELECT SAL1 FROM AVGIT) AND SALARY < (SELECT SAL2 FROM MAXMARKETING);


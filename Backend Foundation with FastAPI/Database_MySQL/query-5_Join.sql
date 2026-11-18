USE dummydb;
SELECT * from employees;
select * from departments;

#using without join

select employees.first_name, departments.department_name
from employees, departments
where employees.department_id=departments.department_id;

#using join (best)

select employees.first_name, departments.department_name #best
from employees JOIN departments ON employees.department_id=departments.department_id;

select employees.first_name, departments.department_name
from employees JOIN departments using(department_id); # good. but column name has to same

#self join
select * from employees;
select m.first_name,e.first_name
from employees as e
join employees as m
on e.employee_id=m.manager_id;

#left join 

SELECT departments.department_name
from departments LEFT JOIN employees
on departments.department_id= employees.department_id
WHERE employees.department_id IS NULL; # department ache but employee nai.jegula null. oigula print hobe.

#inner join/ join
select employees.first_name,employees.salary,
(select AVG(salary) from employees where department_id=employees.department_id)-employees.salary
from employees JOIN departments
ON employees.department_id=departments.department_id;

select department_name
from employees JOIN departments
on employees.department_id= departments.department_id
GROUP BY department_name
HAVING MIN(salary)>5000;

select department_name, MIN(salary), AVG(salary)
from employees JOIN departments
on employees.department_id= departments.department_id
GROUP BY department_name
HAVING MIN(salary)>5000;






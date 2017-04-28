with emp(empid,empname) 
as
(
select employee_id empid , last_name  empname from employees
UNION ALL
select emp.empid + 1, regexp_replace(emp.empname,'^','Mr/Ms') empname  from emp
) 

select max(empid) from emp;

select lpad('',2*level -2 ,' ') || last_name,employee_id, manager_id, level from employees e connect by  manager_id =  prior employee_id start with manager_id is NULL;
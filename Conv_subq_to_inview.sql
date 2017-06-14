--Converting subquery to inline view.

--Subquery
SELECT employee_id ,
  first_name ,
  department_name
FROM employees e,
  departments d
WHERE e.department_id = d.department_id
AND department_name  IN ( 'Administration', 'Marketing', 'Purchasing', 'Human Resources' );


--Inline view
SELECT employee_id ,
  first_name ,
  department_name
FROM employees e ,
  (SELECT department_id,
    department_name
  FROM departments
  WHERE department_name IN ( 'Administration', 'Marketing', 'Purchasing', 'Human Resources' )
  ) d
WHERE d.department_id = e.department_id;

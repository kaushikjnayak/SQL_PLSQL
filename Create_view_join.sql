--Creates a view v_employes with columns of employes , departments.

CREATE OR REPLACE VIEW v_employees
AS
  (SELECT e.employee_id,
    e.first_name,
    d.department_name,
    e.salary
  FROM employees e
  LEFT OUTER JOIN departments d
  ON d.department_id = e.department_id
  );

  --Use join with the original table to get another additional column.
  
SELECT e.employee_id ,
  e.first_name
FROM v_employees v,
  employees e
WHERE e.EMPLOYEE_ID = v.EMPLOYEE_ID
AND v.DEPARTMENT_NAME = 'HR'; 



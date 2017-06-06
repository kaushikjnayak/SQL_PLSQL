select * from employees;


CREATE OR REPLACE TYPE fnametype as TABLE OF VARCHAR2(50);
/

CREATE OR REPLACE TYPE fnameVtype as VARRAY(20) OF VARCHAR2(20);
/


create table few_employees
(
employee_id NUMBER(6,0),
fnames fnameVtype
);


INSERT INTO few_employees VALUES ( 1003, fnameVtype('Kaushik', 'Karthik' ,'Nidhi', 'Pallavi'));

SELECT COLUMN_VALUE first_name
  FROM  TABLE (
  SELECT CAST(fnames AS fnametype)
                 FROM few_employees
                );
                
SELECT department_id,
             CAST (COLLECT (last_name ORDER BY hire_date) AS fnametype)
                AS by_hire_date
        FROM employees
    GROUP BY department_id
    /
            
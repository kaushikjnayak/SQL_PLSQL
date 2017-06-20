CREATE OR REPLACE VIEW v_emp_dep AS
SELECT e.*  ,d.department_name
FROM employees_kjn e, departments d where e.department_id = d.department_id;


CREATE OR REPLACE TRIGGER trig_emp_dep INSTEAD OF
  INSERT ON v_emp_dep 
  DECLARE v_dep_id EMPLOYEES_KJN.DEPARTMENT_ID%TYPE;
  BEGIN
    MERGE INTO DEPARTMENTS d USING
    (SELECT :NEW.DEPARTMENT_ID department_id ,
        :NEW.DEPARTMENT_NAME department_name
      FROM DUAL
    )
    e ON ( d.department_id = e.department_id )
  WHEN MATCHED THEN
    UPDATE SET d.DEPARTMENT_NAME = e.department_name WHEN NOT MATCHED THEN
    INSERT
      (
        DEPARTMENT_ID,
        DEPARTMENT_NAME,
        MANAGER_ID,
        LOCATION_ID
      )
      VALUES
      (
        e.department_id,
        e.department_name,
        NULL,
        ( SELECT MAX(LOCATION_ID) FROM departments
        )
      ) ;
    INSERT
    INTO EMPLOYEES_KJN
      (
        EMPLOYEE_ID,
        FIRST_NAME,
        LAST_NAME,
        EMAIL,
        PHONE_NUMBER,
        HIRE_DATE,
        JOB_ID,
        SALARY,
        COMMISSION_PCT,
        MANAGER_ID
      )
      VALUES
      (
        ( SELECT MAX(employee_id) + 1 FROM employees_kjn
        )
        ,
        :NEW.FIRST_NAME,
        :NEW.LAST_NAME,
        :NEW.EMAIL,
        :NEW.PHONE_NUMBER,
        :NEW.HIRE_DATE,
        :NEW.JOB_ID,
        :NEW.SALARY,
        :NEW.COMMISSION_PCT,
        :NEW.MANAGER_ID
      );
    UPDATE EMPLOYEES_KJN e
    SET DEPARTMENT_ID =
      (SELECT department_id
      FROM departments
      WHERE department_name = :NEW.department_name
      )
    WHERE e.employee_id =
      ( SELECT MAX(employee_id) FROM employees_kjn
      ) ;
  END;
  /



INSERT
INTO v_emp_dep
  (
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID,
    DEPARTMENT_NAME
  )
  VALUES
  (
    1234,
    'Sherlock',
    'Holmes',
    'sherlock@mail.com',
    9090,
    SYSDATE,
    24,
    20000,
    0.15,
    NULL,
    1456,
    'Crime Investigation'
  );

select * from employees_kjn ;
select * from departments;
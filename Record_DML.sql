DECLARE
  emprec employees_2%ROWTYPE;
  new_sal employees_2.emp_sal%TYPE;
BEGIN
  emprec.emp_id        := 310;
  emprec.employee_name := 'LOSER210';
  emprec.emp_sal       := 3400;
  INSERT INTO EMPLOYEES_2 VALUES emprec;
  UPDATE EMPLOYEES_2 SET ROW = emprec WHERE emp_id = emprec.emp_id ;
  UPDATE EMPLOYEES_2
  SET EMP_SAL  = emprec.emp_sal * 1.12
  WHERE emp_id = emprec.emp_id RETURNING emp_sal
  INTO new_sal;
  DBMS_OUTPUT.PUT_LINE('NEW SALARY = '|| new_sal);
END;
/


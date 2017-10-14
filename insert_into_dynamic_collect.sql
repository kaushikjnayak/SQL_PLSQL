CREATE TABLE EMP_SIMPLE AS SELECT EMPLOYEE_ID,FIRST_NAME, SALARY ,HIRE_DATE FROM EMPLOYEES;



DECLARE
  emp1 DBMS_SQL.NUMBER_TABLE;
  fname1 DBMS_SQL.VARCHAR2_TABLE;
  sal1 DBMS_SQL.NUMBER_TABLE;
  hdate1 DBMS_SQL.DATE_TABLE;
  curno NUMBER;
  x     NUMBER;
BEGIN
WITH emp_s( employee_id,first_name,salary,hire_date ) AS
  (SELECT 400 + LEVEL,
    'NAME'
    ||LEVEL ,
    1200            + LEVEL*1.5 ,
    TO_DATE(SYSDATE + LEVEL )
  FROM DUAL
    CONNECT BY LEVEL <= 10
  )
SELECT * BULK COLLECT INTO emp1,fname1,sal1,hdate1 FROM emp_s;
curno := DBMS_SQL.OPEN_CURSOR(DBMS_SQL.NATIVE);
DBMS_SQL.PARSE( curno,'INSERT INTO EMP_SIMPLE( EMPLOYEE_ID,FIRST_NAME, SALARY ,HIRE_DATE )                   
VALUES ( :emp1 , :fname1, :sal1, :hdate1 )',DBMS_SQL.NATIVE);
DBMS_SQL.BIND_ARRAY(curno, ':emp1', emp1);
DBMS_SQL.BIND_ARRAY(curno, ':fname1', fname1);
DBMS_SQL.BIND_ARRAY(curno, ':sal1', sal1);
DBMS_SQL.BIND_ARRAY(curno, ':hdate1', hdate1);
x := DBMS_SQL.EXECUTE(curno);
END;
/

select * from EMP_SIMPLE;
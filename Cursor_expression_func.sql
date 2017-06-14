--Create a function that executes the query.

CREATE OR REPLACE FUNCTION fn_check_query_exec(
    cur         IN SYS_REFCURSOR ,
    column_name IN VARCHAR2 ) RETURN VARCHAR2
IS
  v_cur EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  FETCH cur INTO v_cur;
  RETURN v_cur;
EXCEPTION
WHEN OTHERS THEN
  RETURN SQLERRM;
END;
/

--pass a query to the function , if it executes successfully column value is returned or else exception message.

SELECT fn_check_query_exec( CURSOR ( select first_name FROM EMPLOYEES WHERE ROWNUM <= 1 ) , 'first_name' )  query_stat FROM DUAL;

SET SERVEROUTPUT ON;
DECLARE
  rc  NUMBER(2);
  tst NUMBER(2);
BEGIN
  SELECT 1
  INTO tst
  FROM DUAL;
rc := SQL%ROWCOUNT ;
  DBMS_OUTPUT.PUT_LINE ( rc );  
  FOR q IN
  ( SELECT 1 + level a FROM DUAL CONNECT BY level < 10
  )
  LOOP
    tst := q.a;
    rc := SQL%ROWCOUNT ;
  DBMS_OUTPUT.PUT_LINE ( rc );
    -- rc := q%ROWCOUNT; -- Does not work
   --DBMS_OUTPUT.PUT_LINE ( rc );      
  END LOOP;
  
END;
/

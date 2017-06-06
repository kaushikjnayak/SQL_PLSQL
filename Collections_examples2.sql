SET SERVEROUTPUT ON;
DECLARE
TYPE NAMES_ARRAY
IS
  TABLE OF INTEGER INDEX BY VARCHAR2(15);
  names NAMES_ARRAY;
BEGIN
  names('Kaushik') := 20;
  names('kaushik') := 40;
  names('KAUSHIK') := 60;
  DBMS_OUTPUT.PUT_LINE(names.count);
  DBMS_OUTPUT.PUT_LINE(names.FIRST);  --KAUSHIK      Uppercase > Lowercase
  DBMS_OUTPUT.PUT_LINE(names.LAST);   --kaushik 
END;
/

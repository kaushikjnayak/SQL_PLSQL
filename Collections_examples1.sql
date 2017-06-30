SET SERVEROUTPUT ON;
DECLARE
TYPE NESTED_TABLE_NUM
IS
  TABLE OF NUMBER(10);
  n1 NESTED_TABLE_NUM := NESTED_TABLE_NUM();
  pi NUMBER (10,9)    := asin(1)*2;
TYPE ASSOCIATIVE_ARRAY
IS
  TABLE OF NUMBER(10,4) INDEX BY VARCHAR2(10);
  a1 ASSOCIATIVE_ARRAY;
  afirst VARCHAR2(10);
TYPE VARRAY_TYPE IS VARRAY(10) OF VARCHAR2(10);
v1 VARRAY_TYPE := VARRAY_TYPE();
BEGIN
  FOR i IN 1..10
  LOOP
    n1.extend();
    n1(i) := POWER(i,2);
  END LOOP;
  FOR i IN 30..45
  LOOP
    a1('SIN'|| i ) := SIN(i *  pi  / 180 ) ;
  END LOOP;
  SELECT 'ELEMENT'||level BULK COLLECT INTO v1 FROM DUAL CONNECT BY LEVEL < 10;
  n1.delete(1);
  n1.extend(3); --add 3 null elements.
  --v1.EXTEND(1,1);  NOT PERMITTED. Cannot extend beyond limit.
  v1.EXTEND(1,2); 
  a1.delete(-1);
 -- v1.delete(2); NOT PERMITTED
  DBMS_OUTPUT.PUT_LINE('LIMIT OF VARRAY '|| v1.LIMIT);
  BEGIN
    FOR i IN n1.FIRST..n1.LAST
    LOOP
      DBMS_OUTPUT.PUT_LINE(NVL(n1(i),0));
      DBMS_OUTPUT.PUT_LINE(NVL(v1(i),0));
    END LOOP;
  EXCEPTION
  WHEN OTHERS THEN
    NULL;
  END;
  
  
  afirst := a1.FIRST;
  BEGIN
    WHILE ( a1.EXISTS(afirst)  )
    LOOP
      DBMS_OUTPUT.PUT_LINE(afirst || '=>' || a1(afirst));
      afirst := a1.next(afirst);
    END LOOP;
  EXCEPTION
  WHEN OTHERS THEN
    NULL;
  END;  
END;
/

--

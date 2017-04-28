CREATE OR REPLACE PROCEDURE PRINT (INP IN VARCHAR2) IS
BEGIN
DBMS_OUTPUT.PUT_LINE(INP);
END;
/

SET SERVEROUTPUT ON;
DECLARE

TYPE array IS TABLE OF NUMBER INDEX BY BINARY_INTEGER; 

a1 array;
BEGIN
FOR  i IN REVERSE 11..20  LOOP
a1(i) := i*2 + 6;
PRINT('i = '||i||', a1(i) = '||a1(i));
END LOOP;

PRINT('------------------');
PRINT('TOTAL COUNT = '||a1.count);
PRINT('FIRST INDEX = '||a1.first );
PRINT('NEXT TO FIRST INDEX  = '||a1.next(a1.first) );
PRINT('LAST INDEX  = '||a1.last );
PRINT('PRIOR TO LAST INDEX = '||a1.prior(a1.last) );


--a1.extend(1,2);
PRINT('LAST INDEX  = '||a1.last||'LAST ENTRY = '||a1(a1.last) );
-- NOT WORKING 


END;
/
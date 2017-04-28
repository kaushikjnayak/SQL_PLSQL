SET SERVEROUTPUT ON;
DECLARE
ct number := 1;
TYPE dat_arr is VARRAY(100) of VARCHAR2(10);
branch_arr is TABLE OF  TELM.BRCH_NO%TYPE;
teller_arr is TABLE OF  TELLER_NO%TYPE;

branch_nos branch_arr;
teller_nos teller_arr;


CURSOR tcur IS
SELECT BRCH_NO,TELLER_NO FROM TELM WHERE BRCH_NO != PRIM_BRANCH;
BEGIN

OPEN tcur;
FETCH tcur BULK COLLECT INTO branch_nos,teller_nos;



d1(ct) := branch ;
dbms_output.put_line(d1(ct));
END LOOP;
END;
/

SET SERVEROUTPUT ON;
DECLARE
TYPE dat_arr is VARRAY(100) of VARCHAR2(10);
TYPE branch_arr is TABLE OF  TELM.BRCH_NO%TYPE;
TYPE teller_arr is TABLE OF  TELM.TELLER_NO%TYPE;

branch_nos branch_arr;
teller_nos teller_arr;


CURSOR tcur IS
SELECT BRCH_NO,TELLER_NO FROM TELM WHERE BRCH_NO != PRIM_BRANCH;
BEGIN

OPEN tcur;
FETCH tcur BULK COLLECT INTO branch_nos,teller_nos;


FOR i in 1..branch_nos.count LOOP
DBMS_OUTPUT.PUT_LINE( i||') '||teller_nos(i)||' belongs to '||branch_nos(i)||' branch') ;
end LOOP;

CLOSE tcur;
END;
/


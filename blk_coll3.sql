SET SERVEROUTPUT ON;
DECLARE
TYPE dat_arr is VARRAY(100) of VARCHAR2(10);
TYPE branch_arr is TABLE OF  TELM.BRCH_NO%TYPE;
TYPE teller_arr is TABLE OF  TELM.TELLER_NO%TYPE;
ct number;
dt JR01.JR01_DATE%TYPE := 20130511;
branch_nos branch_arr;
teller_nos teller_arr;


CURSOR tcur IS
SELECT BRCH_NO,TELLER_NO FROM TELM WHERE BRCH_NO != PRIM_BRANCH;
BEGIN

OPEN tcur;
FETCH tcur BULK COLLECT INTO branch_nos,teller_nos;


FORALL i IN  branch_nos.first..branch_nos.last
INSERT INTO  JR_BRCH  VALUES  ( dt,branch_nos(i),substr(teller_nos(i),-7,7) ) ;


CLOSE tcur;
END;
/

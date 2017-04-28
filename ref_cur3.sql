SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE refcurproc( cursarg OUT SYS_REFCURSOR )
AS
x number := 5;

BEGIN
OPEN cursarg FOR
SELECT SUBSTR(KEY_1,5,5),BRCH,LCY_AMT FROM GLIF10;
END;
/

DECLARE
TYPE curtype is REF CURSOR;
cur1 curtype;
bdate GLIF10.KEY_1%TYPE;
br    GLIF10.BRCH%TYPE;
amt   GLIF10.LCY_AMT%TYPE;

BEGIN
refcurproc(cur1);

LOOP

FETCH cur1 into bdate,br,amt;
EXIT WHEN CUR1%NOTFOUND;

IF amt >= 0 THEN
DBMS_OUTPUT.PUT_LINE('DATE = '||bdate||'BRANCH = '||br||'AMOUNT = '||amt);
END IF;

END LOOP;

END;
/
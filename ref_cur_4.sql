SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE refcurproc(tab_no IN  NUMBER, cursarg OUT SYS_REFCURSOR )
AS
query1  CHAR(100);
BEGIN
query1 := 'SELECT SUBSTR(KEY_1,5,5),BRCH,LCY_AMT FROM GLIF'||tab_no;
DBMS_OUTPUT.PUT_LINE('QUERY = '||query1);
OPEN cursarg FOR query1 ;

END;
/

DECLARE
TYPE curtype is REF CURSOR;
cur1 curtype;
tab_name varchar2(6);
t_no number;
bdate GLIF10.KEY_1%TYPE;
br    GLIF10.BRCH%TYPE;
amt   GLIF10.LCY_AMT%TYPE;


BEGIN
tab_name := '&TABLE'; 
t_no := to_number(substr(tab_name,-1));

refcurproc(t_no,cur1);

LOOP

FETCH cur1 into bdate,br,amt;
EXIT WHEN CUR1%NOTFOUND;

IF amt >= 0 THEN
DBMS_OUTPUT.PUT_LINE('DATE = '||bdate||'BRANCH = '||br||'AMOUNT = '||amt);
END IF;

END LOOP;

END;
/

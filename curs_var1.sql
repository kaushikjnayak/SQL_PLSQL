SET SERVEROUTPUT ON;


DECLARE
CURSOR c1 ( pri_key GLIF3.KEY_1%TYPE, branch  GLIF3.BRCH%TYPE ) IS SELECT  SUBSTR(KEY_1,5,5) AS DT from GLIF3 WHERE KEY_1 = pri_key AND  BRCH =  branch;
br1 GLIF3.BRCH%TYPE := '01581';
dt VARCHAR2(5);
BEGIN


FOR line in  c1('000040993000040993011022317F00107909501','01581') LOOP
DBMS_OUTPUT.PUT_LINE(line.DT);
END LOOP;

OPEN c1('000040993000040993011022320F00107908802',br1);
LOOP
FETCH c1 INTO dt;
DBMS_OUTPUT.PUT_LINE(dt);
EXIT WHEN c1%NOTFOUND;
END LOOP;

CLOSE c1;
END;
/

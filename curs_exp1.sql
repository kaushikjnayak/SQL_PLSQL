SET SERVEROUTPUT ON;
DECLARE
TYPE curType is REF CURSOR;
c1 curType;
br GLIF3.BRCH%TYPE;
jrnl JR0110.JRNL_NO%TYPE;

CURSOR br_jrnl IS SELECT 
BRCH,
CURSOR (
SELECT JRNL_NO FROM JR0110 J WHERE 
J.BRCH = G.BRCH )
FROM GLIF3 G;

BEGIN

OPEN br_jrnl;

LOOP
FETCH br_jrnl INTO br,c1;
EXIT WHEN br_jrnl%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('BRCH = ' || br);

LOOP
FETCH c1 INTO jrnl;
EXIT WHEN c1%NOTFOUND;

DBMS_OUTPUT.PUT_LINE('JRNL NO = '|| jrnl);
END LOOP;

END LOOP;

CLOSE br_jrnl;
END;
/

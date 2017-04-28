SET SERVEROUTPUT ON;
DECLARE
TYPE gl_rec is TABLE OF GLIF3%ROWTYPE;
i integer;
g1 gl_rec;
CURSOR gcus IS 
SELECT * FROM GLIF3 WHERE BRCH = '01775';

BEGIN
i := 0;
g1 := gl_rec();
<<Ist>>
FOR rec IN gcus LOOP
i := i + 1;
g1.extend;
g1(i).LCY_AMT := rec.LCY_AMT;
IF g1.EXISTS(i) THEN
g1(i).LCY_AMT := g1(i).LCY_AMT*10;
DBMS_OUTPUT.PUT_LINE(g1(i).LCY_AMT);
END IF;
END LOOP Ist;



DBMS_OUTPUT.PUT_LINE('---------------------------------------');
i := 0;

g1.extend(5,3);
g1.trim(2);
<<IInd>>
LOOP
i := i + 1;
IF g1.EXISTS(i)  THEN
DBMS_OUTPUT.PUT_LINE(g1(i).LCY_AMT);
ELSE
EXIT ;
END IF;
END LOOP  IInd;
END;
/

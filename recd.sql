DECLARE
TYPE glrectype IS RECORD
(
bdate glif10.KEY_1%TYPE,
branch glif10.BRCH%TYPE,
amount glif10.LCY_AMT%TYPE
);
glrec1 glrectype;
BEGIN

SELECT /*+ BITMAP_glif */  SUBSTR(KEY_1,5,5),BRCH,LCY_AMT INTO glrec1 FROM glif10 ;
DBMS_OUTPUT.PUT_LINE(SUBSTR(glrec1.bdate,5,5)||' '||glrec1.branch ||' '||glrec1.amount );
END;
/
SET SERVEROUTPUT ON;
DECLARE
inv_key VARCHAR2(20);
CURSOR invcur IS SELECT KEY_1 FROM INVM10 WHERE KEY_1='&KEY';
no_rows EXCEPTION;
PRAGMA EXCEPTION_INIT(no_rows,-6502); 
BEGIN
   OPEN invcur;
 
   LOOP
   FETCH invcur INTO inv_key;
   inv_key := '|'||inv_key||'|';
   EXIT WHEN invcur%NOTFOUND;
   END LOOP;

   CLOSE invcur;
   
 EXCEPTION
 WHEN no_rows THEN
 DBMS_OUTPUT.PUT_LINE('LENGTH LIMIT EXCEEDED');

END;
/

--NOT DONE YET.
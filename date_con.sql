set serveroutput on;
DECLARE

formatin varchar2(50);
formatout varchar2(50);
datein varchar2(50);
dateout varchar2(50) ;

BEGIN
datein := '&datein';

formatin := '&formatin';

formatout := '&formatout';

dateout := TO_CHAR( TO_DATE(datein,formatin),formatout); 

DBMS_OUTPUT.PUT_LINE(dateout);

END;
/

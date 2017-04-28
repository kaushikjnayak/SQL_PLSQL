set serveroutput on;
set echo on;
DECLARE
function get_cusm_no( brch IN JR0110.BRCH%TYPE)
return JR0110.cusm_no%TYPE IS
cusm_no JR0110.cusm_no%TYPE;

BEGIN

select NVL(CUSM_NO,'NO CUSTOMER') INTO get_cusm_no.cusm_no FROM JR0110 WHERE BRCH=get_cusm_no.brch and rownum <2;
return cusm_no;

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('No record for branch '|| brch);

END;

BEGIN

dbms_output.put_line(get_cusm_no('01775'));

END;
/
set serveroutput on;
DECLARE
key INVM10.KEY_1%TYPE;
brch INVM10.BRANCH_NO%TYPE;
cust INVM10.CUSTOMER_NO%TYPE;
bal  INVM10.CURR_BAL%TYPE;
avai INVM10.INT_AVAILABLE%TYPE;

CURSOR INV_CUR IS
select key_1,branch_no,customer_no,curr_bal,int_available from INVM10 ;

BEGIN
OPEN INV_CUR;

LOOP
FETCH INV_CUR INTO key,brch,cust,bal,avai;
EXIT WHEN INV_CUR%NOTFOUND;

IF bal >  0  OR avai > 0 THEN
DBMS_OUTPUT.PUT_LINE('KEY_1 = '||key||' BALANCE = '||bal||' INT_AVAILABLE = '||avai);
END IF;


END LOOP;
CLOSE INV_CUR;
END;
/
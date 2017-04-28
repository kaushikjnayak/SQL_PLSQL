SET SERVEROUTPUT ON;

DECLARE

TYPE curtype IS  REF CURSOR RETURN INVM10%ROWTYPE;
cur1 curtype;
--query1 VARCHAR2(100);


PROCEDURE query_out_count ( inv_cur  IN curtype ) IS
row_count NUMBER(10);
cout cur1%ROWTYPE;
--cout INVM10.ACCT_TYPE%TYPE;

BEGIN 

LOOP
FETCH inv_cur INTO cout;
EXIT WHEN inv_cur%NOTFOUND;
row_count := inv_cur%ROWCOUNT;
END LOOP;

DBMS_OUTPUT.PUT_LINE(row_count);
END;



BEGIN
--query1 := 'SELECT * FROM INVM10 WHERE ACCT_TYPE LIKE ''%1'' ';
OPEN cur1  FOR SELECT * FROM INVM10 WHERE ACCT_TYPE LIKE '%1';
query_out_count(cur1);

END;
/
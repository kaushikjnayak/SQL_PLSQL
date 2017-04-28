SET SERVEROUTPUT ON;
spool glcc_invm_inct.csv;
DECLARE

 TYPE      CusvaaRefCur IS REF CURSOR;
 cuscur    CusvaaRefCur;
 quer1     CHAR(260);
 typ       NUMBER(02);
 tran      CHAR(06);
 jrnl      NUMBER(09);
 amt       NUMBER(17,3);
 bal       NUMBER(17,3);

CURSOR getinvm IS
       SELECT substr(key_1,4) acct,curr_bal from invm where branch_no='00002' and curr_status <> '07' and gl_class_code='00002INR1321010101';
BEGIN
       FOR rec in getinvm
       LOOP
             quer1 := 'SELECT tran_type,BASECONV.CONVDATA(VAR_AREA,17,4),jrnl_no,BASECONV.CONVDATA(VAR_AREA,33,8)/1000,BASECONV.CONVDATA(VAR_AREA,41,8)/1000 from inct w
here acct_no = :j and tran_date = 40877 and tran_type in (01,80) and rownum < 2 order by rec_no';
             OPEN cuscur FOR quer1 USING rec.acct;
             LOOP
                FETCH cuscur INTO typ,tran,jrnl,amt,bal;
                EXIT WHEN cuscur%NOTFOUND OR cuscur%NOTFOUND IS NULL;
                  DBMS_OUTPUT.PUT_LINE(rec.acct||','||rec.curr_bal||','||typ||','||tran||','||jrnl||','||amt||','||bal);
                IF ( bal <> rec.curr_bal )
                THEN
                  DBMS_OUTPUT.PUT_LINE(rec.acct||','||rec.curr_bal||','||typ||','||tran||','||jrnl||','||amt||','||bal);
                END IF;
             END LOOP;
       END LOOP;
END;
/
spool off;

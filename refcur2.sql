SET SERVEROUTPUT ON;
DECLARE

TYPE adhpcur  IS REF CURSOR  return  adhp%ROWTYPE; 
adhp1 adhpcur;
app_date varchar2(10);
br adhp.RQST_BR%TYPE;
rec1 ADHP%ROWTYPE;
CURSOR  adhp2 IS 
select RQST_BR from adhp where  REPORT_ID='SY0383';
BEGIN
OPEN adhp1 FOR  
select *  from adhp where REPORT_ID='SY0471';


LOOP
FETCH adhp1 INTO rec1;
EXIT WHEN adhp1%NOTFOUND;
SELECT  to_char(to_date(sum(2415020+rec1.RQST_DT),'J'),'YYYYMMDD') INTO app_date from dual ;
  
    open adhp2;
     LOOP
       FETCH  adhp2 into br;
       EXIT WHEN adhp2%NOTFOUND;
        IF   br = rec1.RQST_BR THEN
           IF rec1.PROCESS_FLAG='Y' THEN
            DBMS_OUTPUT.PUT_LINE(app_date||'--'||rec1.RQST_NO'--'||rec1.RQST_BR||'--'||rec1.REPORT_ID);
           END IF;
        END IF;
     END LOOP;
   close adhp2;
  END LOOP;

CLOSE adhp1;
END;

/
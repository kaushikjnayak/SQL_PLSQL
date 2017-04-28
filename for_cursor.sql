SET SERVEROUTPUT ON;
DECLARE
app_date varchar2(10);
CURSOR adhp1 IS 
select RQST_DT,RQST_BR,RQST_NO,REPORT_ID,PROCESS_FLAG from adhp where RQST_DT=41399 and REPORT_ID='SY0383';

BEGIN

for  rec1 in adhp1
LOOP
select  to_char(to_date(sum(2415020+rec1.RQST_DT),'J'),'YYYYMMDD') INTO app_date from DUAL;

IF rec1.PROCESS_FLAG='Y' THEN
DBMS_OUTPUT.PUT_LINE(app_date||'--'||rec1.RQST_NO||'--'||rec1.REPORT_ID);
END IF;

END LOOP;



END;
/
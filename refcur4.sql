SET SERVEROUTPUT ON;
DECLARE

TYPE adhpcur  IS REF CURSOR RETURN ADHP10%ROWTYPE;
adhp1 adhpcur;
adhp2 adhpcur;
app_date varchar2(10);

BEGIN
OPEN adhp1 FOR  
select RQST_DT,RQST_BR,RQST_NO,REPORT_ID,PROCESS_FLAG from adhp10 where RQST_DT=41399 and REPORT_ID='SY0383';
--OPEN adhp2 FOR
--select RQST_NO,PROCESS_FLAG from adhp10 where RQST_DT=41399 and REPORT_ID='SY0445';



LOOP
FETCH adhp1 INTO rec1;
EXIT WHEN adhp1%NOTFOUND;
app_date := to_char(to_date(sum(2415020+rec1.RQST_DT),'J'),'YYYYMMDD');

IF rec1.PROCESS_FLAG='Y' THEN
DBMS_OUTPUT.PUT_LINE(app_date||'--'||rec1.RQST_NO||'--'||rec1.REPORT_ID);
END IF;

END LOOP;

CLOSE adhp1;

END;
/
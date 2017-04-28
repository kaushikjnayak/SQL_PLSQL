SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE disp_time (
st_hr VARCHAR2 DEFAULT '00' , 
st_min VARCHAR2 DEFAULT '00' 
) AS

tim VARCHAR2(5);

BEGIN
tim := st_hr|| ':' || st_min; 
DBMS_OUTPUT.PUT_LINE(tim);
END disp_time ;

/

BEGIN
disp_time('16','34');
disp_time;
disp_time('14');
disp_time(st_min => '03');
END;
/
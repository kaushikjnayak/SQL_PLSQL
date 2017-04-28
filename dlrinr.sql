set serveroutput on;
declare

dol_to_r number := 53.84;
dol_val varchar2(20);
inr_val varchar2(20);

BEGIN
dol_val := '&dol_val';
inr_val := TO_NUMBER(dol_val,'$999,99,99') * dol_to_r||'INR';
dbms_output.put_line(inr_val);

END;
/

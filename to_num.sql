set serveroutput on;
declare
v_char varchar2(20) := '1234.23';
v_num number;
BEGIN
v_num := to_number(v_char,'9999.999') + 12.45;
dbms_output.put_line(v_num);

END;
/

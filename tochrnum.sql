set serveroutput on ;
declare

bus_num number := 834;
b_str varchar2(10);
BEGIN
b_str := to_char(bus_num,'00000');
dbms_output.put_line(b_str);
END;
/

set serveroutput on;
declare
x char(10);
y number(5);
z date;

BEGIN
dbms_output.put_line('ENTER A VALUE');
x := '&x';
dbms_output.put_line('ENTER another value');
y := &y;

IF x in ('2','4','hi')  then
dbms_output.put_line('FOUND');
END IF;
END;
/

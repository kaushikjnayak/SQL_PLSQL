set serveroutput on;

DECLARE
X NUMBER(5);
Y NUMBER(5);

BEGIN
X := '&X';
Y := NVL(X - 5,25);
dbms_output.put_line('Y = '|| Y);
END;
/

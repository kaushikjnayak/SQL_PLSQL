set serveroutput on;
DECLARE
x number;

BEGIN
x := &x;
FOR ind in reverse 7..x
LOOP
dbms_output.put_line(ind + 9);
END LOOP;
END;
/
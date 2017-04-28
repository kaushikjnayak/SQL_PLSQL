set serveroutput on;
declare
x char(10);
y varchar2(10);
BEGIN
x :='&x';
y :='&y';

IF x = y THEN
DBMS_OUTPUT.PUT_LINE('EQUAL');
ELSE
DBMS_OUTPUT.PUT_LINE('NOT EQUAL');
END IF;
END;
/

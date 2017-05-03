--Simple COncatenation Example.Take user Input
set serveroutput on;

DECLARE

x number(5);
y char(5);
z char(15);

BEGIN
x :=&x;
y :='&y';

z := x|| ' and '||y;
DBMS_OUTPUT.PUT_LINE(z);
END;
/

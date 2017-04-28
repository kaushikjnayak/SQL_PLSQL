set serveroutput on;
declare
x number(10);
y number(10);
z number(10);
BEGIN
x := PK2.x;
y := x+1;
dbms_output.put_line('PK2.x = '||x);
dbms_output.put_line('y = '||y);
PK3.proc1(x);
z := PK3.diffsq(x,y);
dbms_output.put_line('z = '||z);
END;
/


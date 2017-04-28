create or replace package body pk3 
AS
procedure proc1(x IN NUMBER) is
begin
dbms_output.put_line ( 'X in Kilometer'||x * 1.6);
end proc1;
function diffsq(a in number,b in number) return number is
begin
c := a*a - b*b;
return c;
end diffsq;
end;
/

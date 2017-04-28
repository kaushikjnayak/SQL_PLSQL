set serveroutput on;
create or replace function sumsq(a in number,b in number) return number is
c number(10);
BEGIN
c := a*a + b*b;
RETURN c;
END;
/

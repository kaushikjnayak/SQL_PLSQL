SET SERVEROUTPUT ON;

DECLARE 
x NUMBER(5);
y VARCHAR2(5);
out_num NUMBER(5);
out_char VARCHAR2(5);

FUNCTION  prod_out ( v NUMBER) RETURN NUMBER  IS
BEGIN
RETURN x*x;
END prod_out;


FUNCTION  prod_out ( v varchar2) RETURN VARCHAR2  IS
BEGIN
RETURN x||'*'||x;
END prod_out;

BEGIN
x := 5;
y := '5';

out_num  := prod_out(x) ;
out_char := prod_out(y) ; 

DBMS_OUTPUT.PUT_LINE(out_char || '=' || out_num);

END;
/
SET SERVEROUTPUT ON;

DECLARE
--x number(2);
x number(4,2);
y CHAR(10);
z number(4,2);
BEGIN
x := &x;

--y :=
--CASE x
--WHEN 0 THEN 'ZERO'
--WHEN 1 THEN 'ONE'
--WHEN 2 THEN 'TWO'
--WHEN 3 THEN 'THREE'
--ELSE 'NULL'
--END;
--DBMS_OUTPUT.PUT_LINE(x || '->' || y);

z :=
CASE 
WHEN x >= 0 AND x < 1 THEN 0.5
WHEN x >= 1 AND x < 2 THEN 1.5
WHEN x >= 2 AND x < 3 THEN 2.5
WHEN x >= 3 THEN 3.5
ELSE 'NULL'
END;

DBMS_OUTPUT.PUT_LINE(x || 'LIMIT->' || z);


END;
/
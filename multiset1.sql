SET SERVEROUTPUT ON;
DECLARE 
TYPE nametype is TABLE OF VARCHAR2(10);
n1 nametype := nametype('Juhi','rani','madhuri','karishma');
n2 nametype := nametype('kareena','priyanka','karishma','bipasha');
n3 nametype;
n4 nametype;

BEGIN

n3 := n1 MULTISET UNION n2;
FOR i in n3.FIRST..n3.LAST
LOOP
DBMS_OUTPUT.PUT_LINE(n3(i));
END LOOP;
DBMS_OUTPUT.PUT_LINE('------------------------------------');
n4 := n1 MULTISET INTERSECT n2;
FOR i in n4.FIRST..n4.LAST
LOOP
DBMS_OUTPUT.PUT_LINE(n4(i));
END LOOP;


END;
/
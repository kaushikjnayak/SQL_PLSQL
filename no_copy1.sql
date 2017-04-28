SET SERVEROUTPUT ON;
DECLARE 
TYPE mobtype IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(5);
m1 mobtype;
m2 mobtype;

PROCEDURE def_mob ( mob_n IN OUT NOCOPY mobtype, mob_n2 IN OUT mobtype) IS
--PROCEDURE def_mob ( mob_n IN OUT mobtype) IS
BEGIN

mob_n('OS')  := 'ANDROID';
DBMS_OUTPUT.PUT_LINE( m1('OS') );
mob_n('MEM') := '1GB';
m1('OS') := 'WINDOWS';
DBMS_OUTPUT.PUT_LINE( m1('OS') );
mob_n2('OS')  := 'ANDROID';
DBMS_OUTPUT.PUT_LINE( m1('OS') );
END def_mob;

BEGIN
def_mob(m1,m1);
DBMS_OUTPUT.PUT_LINE( m1('OS') );

END;
/
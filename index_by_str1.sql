SET SERVEROUTPUT ON;
DECLARE
TYPE prodarr IS TABLE OF VARCHAR2(15) INDEX BY VARCHAR2(10);
pr1 prodarr;
inp VARCHAR2(10);
BEGIN

pr1('qty') := '250g';
pr1('price') := 'INR175';
pr1('code') := 'NFMC17654';
pr1('manf-date') := '2013-08-20';
pr1('exp-date') := '2013-12-20';

inp := '&inp';

IF pr1.exists(inp) THEN
dbms_output.put_line ('pr1->'||inp||' = '||pr1(inp));
ELSE
dbms_output.put_line ('pr1->'||inp||' Is not defined');
END IF;

END;
/
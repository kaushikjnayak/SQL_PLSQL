SET SERVEROUTPUT ON;
DROP TABLE COMPCONF;

CREATE TABLE COMPCONF (
MEMORY NUMBER(2),
CPU VARCHAR2(15),
NO_OF_CPU NUMBER(2),
HARD_DISK NUMBER(3)
);


DECLARE
c1 COMPCONF%ROWTYPE;
TYPE cpmtyp is RECORD ( MEM COMPCONF.MEMORY%TYPE, CPU COMPCONF.CPU%TYPE );
c2 cpmtyp;
BEGIN
c1.MEMORY := '4';
c1.CPU := 'INTEL';
c1.NO_OF_CPU := '4';
c1.HARD_DISK := '500';

INSERT INTO COMPCONF VALUES c1;

UPDATE COMPCONF SET MEMORY = '8' WHERE MEMORY = '4' 
RETURNING MEMORY,CPU into c2;

DBMS_OUTPUT.PUT_LINE (c2.MEM ||','|| c2.CPU);
END;
/
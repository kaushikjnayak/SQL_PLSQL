SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE pip_pkg IS
TYPE arr_ninto2 is TABLE OF NUMBER;
FUNCTION pipe_lined_f ( n NUMBER ) RETURN arr_ninto2  PIPELINED;
END  pip_pkg;
/
CREATE OR REPLACE PACKAGE BODY	pip_pkg AS
FUNCTION pipe_lined_f ( n NUMBER ) RETURN arr_ninto2  PIPELINED
IS  
BEGIN

FOR i in 1..n LOOP 
PIPE ROW(i*2);
END LOOP;

END;
END pip_pkg;
/


SELECT * FROM TABLE(pip_pkg.pipe_lined_f(5));
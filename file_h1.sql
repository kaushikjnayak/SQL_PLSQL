DECLARE

FILE1  UTL_FILE.FILE_TYPE;

BEGIN
FILE1 := UTL_FILE.FOPEN('TEMP_DIR','gli_out.txt','W');

FOR rec in  (SELECT KEY_1,DESCRIPTION FROM GLIF3) LOOP
UTL_FILE.PUT_LINE(FILE1,rec.KEY_1||','||rec.DESCRIPTION);
END LOOP;

EXCEPTION
WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('EXCEPTION OCCURED'); 
UTL_FILE.FCLOSE(FILE1);
END;
/
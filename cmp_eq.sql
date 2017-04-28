declare
d1 varchar2(12);   
d2 char(12); -- ADDS SPACE CHARACTERs AT THE END
BEGIN
d1 := 'definitions';  
d2 := 'definitions';

IF d1 = d2 then
dbms_output.put_line('   equal');
else
dbms_output.put_line('   not equal');
END IF;
END;
/

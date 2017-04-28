declare
z number;
excz1 exception;
begin
select count(1) into z  from tab1;
if   z = 0 
THEN
RAISE excz1;
END IF;

EXCEPTION
WHEN excz1  THEN
dbms_output.put_line('Zero value');
dbms_output.put_line(SQLCODE ||' '||SQLERRM);

END;
/
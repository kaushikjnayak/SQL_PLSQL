set serveroutput on;
BEGIN
FOR i in
(
select BRCH||TELLER||TERMNL  br_tellers FROM JR0110
)
LOOP
dbms_output.put_line( i.br_tellers);
END LOOP;
END;
/
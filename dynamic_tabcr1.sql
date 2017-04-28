
CREATE OR REPLACE PROCEDURE create_table( table_name IN  VARCHAR2 , statement  IN VARCHAR2) IS

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE '|| table_name;
EXECUTE IMMEDIATE 'CREATE TABLE '|| table_name || ' ' || statement;
END;
/

CREATE OR REPLACE PROCEDURE insert_into ( table_name IN  VARCHAR2 , statement IN VARCHAR2) IS
BEGIN
EXECUTE IMMEDIATE 'INSERT INTO '|| table_name || ' '|| statement;
COMMIT;
END;
/

DECLARE

BEGIN

create_table('GLIF5' , ' AS SELECT * FROM GLIF10');
insert_into ('FACTORS', 'VALUES (387,469)' );
END;
/
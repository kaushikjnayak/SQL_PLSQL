aSET SERVEROUTPUT ON;

DROP TABLE PROD_CATEG;
DROP TYPE prodtypes;

CREATE TYPE prodtypes AS TABLE OF VARCHAR2(10);
/

CREATE TABLE PROD_CATEG
(
product_name VARCHAR2(10) NOT NULL,
prod_v prodtypes 
) NESTED TABLE prod_v STORE AS prodtab;


BEGIN
INSERT INTO PROD_CATEG VALUES ( 'fan', prodtypes('ceiling','table','exhaust') );
INSERT INTO PROD_CATEG VALUES ( 'bulb', prodtypes('CFL','neon','LED') );
END;
/
DECLARE
fantype prodtypes;
bulbtype prodtypes;
newfantype  prodtypes;
BEGIN
SELECT prod_v INTO fantype FROM PROD_CATEG WHERE product_name='fan';
SELECT prod_v INTO bulbtype  FROM PROD_CATEG WHERE product_name='bulb';


FOR  i in fantype.FIRST..fantype.LAST
LOOP
DBMS_OUTPUT.PUT_LINE('fantype(' || i ||') =' || fantype(i));
END LOOP;


FOR  i in bulbtype.FIRST..bulbtype.LAST
LOOP
DBMS_OUTPUT.PUT_LINE('bulbtype(' || i ||') =' || bulbtype(i));
END LOOP;
END;
/

DECLARE
newfantype prodtypes := prodtypes('usha','khaitan');
BEGIN
UPDATE PROD_CATEG SET prod_v=newfantype where product_name='fan';
INSERT INTO TABLE( SELECT prod_v FROM PROD_CATEG where product_name='fan') VALUES ('polar') ;
UPDATE TABLE( SELECT prod_v FROM PROD_CATEG where product_name='fan') SET COLUMN_VALUE='philips' where COLUMN_VALUE = 'polar';
END;
/


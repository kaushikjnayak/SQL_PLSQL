create table tab_rowid_col 
(
c1_id NUMBER(10),
c1_rowid ROWID
);



INSERT INTO TAB_ROWID_COL 
SELECT ROWNUM,rid  FROM ( select ROWID  rid FROM EMPLOYEES);

select length(c1_rowid)  from tab_rowid_col;


CREATE OR REPLACE TYPE typ_ora_err AS OBJECT
(
o_dt  DATE,
o_err_no NUMBER(10),
o_err_msg VARCHAR2(200)
);

--DROP TABLE tab_ora_err_typ;
CREATE TABLE tab_ora_err_typ OF  typ_ora_err;



DECLARE
v1 VARCHAR2(2);
v_code NUMBER(10);
v_err_m VARCHAR2(200);
BEGIN

SELECT 'TAB' INTO v1 FROM DUAL;
EXCEPTION
 WHEN OTHERS THEN
 v_code := SQLCODE;
 v_err_m := SQLERRM;
 INSERT INTO tab_ora_err_typ VALUES (SYSDATE,v_code,v_err_m);
END;
/

select * from tab_ora_err_typ;

select * from user_objects where object_name = UPPEr('tab_ora_err_typ');

desc tab_ora_err_typ;
CREATE TABLE TAB_DDL_TRIG_IN
(
EVENT_DATE DATE,
EVENT_NAME VARCHAR2(10)
);
CREATE OR REPLACE TRIGGER TRG_AFTER_DDL AFTER
DDL ON SCHEMA 

DECLARE
v_event_name TAB_DDL_TRIG_IN.EVENT_NAME%TYPE;
BEGIN
SELECT ora_sysevent INTO v_event_name FROM DUAL;
INSERT INTO TAB_DDL_TRIG_IN
(
EVENT_DATE,
EVENT_NAME,
OBJECT_NAME
)
VALUES

(
SYSDATE,
v_event_name,
ora_dict_obj_name
);

END;


select to_char(event_date,'YYYY-MM-DD HH24:MI:SS'),a.* FROM ( select * from TAB_DDL_TRIG_IN) a;

ALTER TABLE TAB_DDL_TRIG_IN ADD ( OBJECT_NAME  VARCHAR2(30));

CREATE TABLE TAB_TRIG_TEST1 ( a NUMBER(10),b NUMBER(20));
DROP TABLE TAB_TRIG_TEST1;

ALTER  TRIGGER TRG_AFTER_DDL DISABLE;
ALTER  TRIGGER TRG_AFTER_DDL ENABLE;

CREATE OR REPLACE FUNCTION func1 ( n NUMBER )
RETURN NUMBER IS
BEGIN
return n + n;
END;

select a.x from (  select 24 x from dual 
UNION SELECT 23 x from DUAL) a  where a.x != 
ANY ( 
--select NULL x from dual UNION ALL
select 23 x FROM DUAL UNION ALL
select 25 x from DUAl UNION ALL
);


select 24 X from dual;
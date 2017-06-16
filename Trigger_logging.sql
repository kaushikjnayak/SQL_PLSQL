--General purpose trigger log storing table.
CREATE TABLE TRIGGER_LOG
  (
    DTTIME       TIMESTAMP WITH TIME ZONE NOT NULL,
    TABLE_NAME   VARCHAR2(30) ,
    COLUMN_NAME  VARCHAR2(30) ,
    TRIGGER_TYPE VARCHAR2(50) NOT NULL ,
    QUERY_TEXT CLOB
  );
ALTER TABLE TRIGGER_LOG ADD ( DESCRIPTION VARCHAR2(400) );


--Gp Trigger logging procedure.
CREATE OR REPLACE PROCEDURE pr_log_trigger(
    p_dttime TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    p_table_name  IN VARCHAR2 DEFAULT NULL,
    p_column_name IN VARCHAR2 DEFAULT NULL,
    trigger_type  IN VARCHAR2 DEFAULT 'DML',
    query_text CLOB,
    p_description VARCHAR2 )
AS
  PRAGMA AUTONOMOUS_TRANSACTION;  -- Commits /rollbacks  within this procedure do not affect the calling trigger.
BEGIN
  INSERT
  INTO TRIGGER_LOG
    (
      DTTIME,
      TABLE_NAME,
      COLUMN_NAME,
      TRIGGER_TYPE,
      QUERY_TEXT,
      DESCRIPTION
    )
    VALUES
    (
      p_dttime,
      p_table_name,
      p_column_name,
      trigger_type,
      query_text,
      p_description
    );
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
END;
/

--Table for which to trigger.
CREATE TABLE ALERT_TAB
  ( alert_id NUMBER(10), alert_name VARCHAR2(50)
  );


--Trigger definition
CREATE OR REPLACE TRIGGER TRIG_ALERT_TAB_1 AFTER
  UPDATE OF alert_name OR
  INSERT ON ALERT_TAB FOR EACH ROW WHEN ( REGEXP_LIKE( NEW.alert_name, '(SEVERE)|(CRITICAL)|(502)','i' )) 
  DECLARE 
  v_query_typ VARCHAR2(50);
  v_op  VARCHAR2(20);
  BEGIN
    IF INSERTING THEN
      v_op := ' INSERTED ';
    ELSE
      v_op := ' UPDATED TO ' ;
    END IF;
    v_query_typ :=
    CASE
    WHEN INSERTING THEN
      'INSERT INTO ALERT_TAB VALUES('||:new.ALERT_ID||','||:new.ALERT_NAME||');'
    WHEN UPDATING THEN
      'UPDATE ALERT_TAB SET ALERT_NAME = '||:new.ALERT_NAME||';'
    ELSE
      'MODIFYING ALERT_NAME'
    END;
    pr_log_trigger ( CURRENT_TIMESTAMP,'ALERT_TAB','ALERT_NAME', 'AFTER UPDATE OF ALERT_NAME OR INSERT ON ALERT_TAB', v_query_typ,:OLD.alert_name|| v_op || :NEW.alert_name);
  END;
  /


--DML transactions.
INSERT INTO ALERT_TAB VALUES( 1, 'COMMON_ALERT');
INSERT INTO ALERT_TAB VALUES( 5, '502err');
update ALERT_TAB SET ALERT_NAME = 'severe401'  where ALERT_ID = 5;

select * from alert_tab;
select * from TRIGGER_LOG;



--Get the structure of all the triggers in the db
select * from all_triggers;
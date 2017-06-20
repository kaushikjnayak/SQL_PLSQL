CREATE OR REPLACE TRIGGER comp_trig1 FOR UPDATE OR
  DELETE OR
  INSERT ON alert_tab COMPOUND TRIGGER 

 v_dml_type VARCHAR2(20) :=
    CASE
      WHEN inserting
      THEN 'INSERT'
      WHEN updating
      THEN 'UPDATE'
      WHEN deleting
      THEN 'DELETE'
    END;
  BEFORE STATEMENT
IS
BEGIN
  dbms_output.Put_line('BEFORE STATEMENT '||v_dml_type||' OF ALERT_TAB');
END BEFORE STATEMENT;
BEFORE EACH ROW
IS
BEGIN
  dbms_output.Put_line('BEFORE EACH ROW '||v_dml_type||' OF ALERT_TAB');
END BEFORE EACH ROW;
AFTER EACH ROW
IS
BEGIN
  dbms_output.Put_line('AFTER EACH ROW '||v_dml_type||' OF ALERT_TAB');
END AFTER EACH ROW;
AFTER STATEMENT
IS
BEGIN
  dbms_output.Put_line('AFTER STATEMENT '||v_dml_type||' OF ALERT_TAB');
END AFTER STATEMENT;
END;
/ 

SET SERVEROUTPUT ON;

INSERT INTO ALERT_TAB VALUES( 1, 'COMMON_ALERT');
DELETE FROM ALERT_TAB;
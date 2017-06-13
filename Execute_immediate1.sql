CREATE OR REPLACE PROCEDURE pr_inout_tst(
    p_1 IN NUMBER,
    p_2 OUT NUMBER,
    p_3 IN OUT NUMBER )
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE ( p_1 );
  p_2 := 1234;
  DBMS_OUTPUT.PUT_LINE ( p_2 );
  p_3 := p_3 * 2;
  DBMS_OUTPUT.PUT_LINE ( p_3 );
END;
/



SET SERVEROUTPUT ON;
DECLARE
  v_1 NUMBER(4):= 40;
  v_2 NUMBER(5);
  v_3 NUMBER(5):= 60;
BEGIN
  EXECUTE IMMEDIATE 'BEGIN pr_inout_tst(:1,:2,:3); END;' USING v_1, OUT v_2, IN OUT v_3;
END;
/
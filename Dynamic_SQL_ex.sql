CREATE OR REPLACE PACKAGE PKG_DYNAMIC_EXEC
AS
  PROCEDURE pr_task_1(
      p1 NUMBER);
  PROCEDURE pr_task_2(
      p1 NUMBER);
  PROCEDURE pr_task_3(
      p1 NUMBER);
END PKG_DYNAMIC_EXEC;
/
CREATE OR REPLACE PACKAGE BODY PKG_DYNAMIC_EXEC
AS
PROCEDURE pr_task_1(
    p1 IN NUMBER)
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE(' INSIDE pr_task_1.Value of Arg ->'|| p1);
END;
PROCEDURE pr_task_2(
    p1 IN NUMBER)
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE(' INSIDE pr_task_2.Value of Arg -> '|| p1 );
END;
PROCEDURE pr_task_3(
    p1 IN NUMBER)
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE(' INSIDE pr_task_3.Value of Arg -> '|| p1);
END;
END PKG_DYNAMIC_EXEC;
/
--Calling a apecific procedure dynamically based on the conditions.
SET SERVEROUTPUT ON;
DECLARE
  procnum NUMBER(2) :=
  CASE
  WHEN TO_CHAR(SYSDATE,'W') IN ( 1,2 ) THEN -- 1st and 2nd day of the week.
    1
  WHEN TO_CHAR(SYSDATE,'W') IN ( 3, 4 ) THEN -- 3rd nd 4th
    2
  ELSE
    3
  END;
  arg              NUMBER(5) := TO_NUMBER(TO_CHAR(SYSDATE,'MM'));
  p_proceduce_call VARCHAR2(1000);
BEGIN
  p_proceduce_call := 'BEGIN PKG_DYNAMIC_EXEC.pr_task_'||procnum||'(:arg);END;';  --use local variables and bind variable arguments.
  DBMS_OUTPUT.PUT_LINE(p_proceduce_call);
  EXECUTE IMMEDIATE p_proceduce_call USING arg;
END;
/
SELECT TO_CHAR(SYSDATE+2,'W' ) , TO_NUMBER(TO_CHAR(SYSDATE,'MM')) FROM DUAL;
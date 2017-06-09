SET SERVEROUTPUT ON;
DECLARE
  xclob CLOB;
BEGIN
  DBMS_OUTPUT.PUT_LINE ( 'LENGTH = ' || DBMS_LOB.GETLENGTH(xclob) );
  DBMS_OUTPUT.PUT_LINE
  (
    CASE
    WHEN xclob IS NULL THEN
      'NULL'
    ELSE
      'NOT NULL'
    END  );
--initialize clob
xclob := empty_clob();

DBMS_OUTPUT.PUT_LINE
  (
    CASE
    WHEN xclob IS NULL THEN
      'NULL'
    ELSE
      'NOT NULL'
    END  );
DBMS_OUTPUT.PUT_LINE ( 'LENGTH = ' || DBMS_LOB.GETLENGTH(xclob) );
END;
/
SET SERVEROUTPUT ON;
DECLARE
  cur PLS_INTEGER := DBMS_SQL.OPEN_CURSOR;
  cols DBMS_SQL.DESC_TAB;
  ncols PLS_INTEGER;
BEGIN
  -- Parse the query
  DBMS_SQL.PARSE (cur, 'SELECT * FROM employees', DBMS_SQL.NATIVE);
  -- Retrieve column information
  DBMS_SQL.DESCRIBE_COLUMNS (cur, ncols, cols);
  -- Display each of the column names
  FOR colind IN 1 .. ncols
  LOOP
    DBMS_OUTPUT.PUT_LINE (cols (colind).col_name || ' ' ||
    CASE cols (colind).col_type
    WHEN 96 THEN
      'CHAR'
    WHEN 1 THEN
      'VARCHAR2'
    WHEN 2 THEN
      'NUMBER'
    WHEN 12 THEN
      'DATE'
    END|| '('||cols (colind).col_max_len||')' );
  END LOOP;
  DBMS_SQL.CLOSE_CURSOR (cur);
END;
/
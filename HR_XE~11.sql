SET serveroutput ON;
DECLARE
  idx1 KJN_STD_OBJ.typ_idx_by_tab;
  var1 KJN_STD_OBJ.typ_varr := KJN_STD_OBJ.typ_varr();
BEGIN
  idx1(1) := 'KJN';
  idx1(2) := 'KJN2';
  idx1(3) := 'KJN3';
  idx1.delete(2);
  FOR i IN idx1.FIRST..idx1.LAST
  LOOP
    IF idx1.exists(i) THEN
    DBMS_OUTPUT.put_line(idx1(i));
    END IF;
  END LOOP;
  DBMS_OUTPUT.put_line(var1.LIMIT);
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.put_line('Exception occured');
END;
/
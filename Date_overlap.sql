CREATE OR REPLACE FUNCTION fn_count_range 
( p_start_date1 IN DATE, 
p_end_date1   IN DATE, 
p_start_date2 IN DATE, 
p_end_date2 IN DATE ) RETURN NUMBER AS 

v_days NUMBER;

BEGIN 
IF p_end_date1 < p_start_date1 OR p_end_date2 < p_start_date2 THEN 
 RETURN 0;
END IF;

SELECT COUNT(*) INTO v_days
FROM (
        (SELECT p_start_date1 + LEVEL - 1
         FROM dual CONNECT BY LEVEL <= p_end_date1 - p_start_date1 + 1 ) INTERSECT
        (SELECT p_start_date2 + LEVEL - 1
         FROM dual CONNECT BY LEVEL <= p_end_date2 - p_start_date2 + 1 ) );

RETURN v_days;

END;

/

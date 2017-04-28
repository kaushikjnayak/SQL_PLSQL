DECLARE
total_sales number(2) := 40;
no_revenue boolean;
BEGIN

CASE 
WHEN total_sales <= 0 THEN no_revenue := TRUE;
WHEN total_sales > 0 THEN no_revenue := FALSE;
END CASE;
END;
/
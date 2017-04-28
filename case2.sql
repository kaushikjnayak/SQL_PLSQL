SELECT REPORT_ID, 
CASE REPORT_ID
WHEN 'IN2050' THEN  'Product_sheet_ccod_depr2050'
WHEN 'SY0474' THEN  'Collection_cheques_returned_details'
WHEN 'SY0383' THEN  'Inward_clearing_cfpd0383'
ELSE 'NOT MENTIONED'
END AS DESCRIPTION,
COUNT(*) FROM ADHP GROUP BY  REPORT_ID;

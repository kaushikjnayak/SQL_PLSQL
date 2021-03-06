SELECT REPLACE('It is a great day','is','was') FROM DUAL;
SELECT ROUND(15.417,2) FROM DUAL;
SELECT ROUND(15.417,-1) FROM DUAL;
SELECT TRUNC(15.417,2) FROM DUAL;
SELECT TRUNC(15.417,-1) FROM DUAL;

-- to get 8th rqst_no
SELECT rqst_no
FROM adhp10
WHERE (ROWID,0) IN (SELECT ROWID, MOD(ROWNUM,8)
FROM adhp10);

            --OR
select RQST_NO,RNUM FROM (SELECT ROW_NUMBER() OVER (PARTITION BY INST_NO ORDER BY RQST_NO) AS RNUM FROM ADHP10 ) WHERE RNUM =8;


            
SELECT KEY_1,TRIM(LEADING 0 FROM BRCH) FROM  GLIF3;
SELECT TRIM(LEADING ' ' FROM RQST_DT) FROM  ADHP10;

SELECT TRANSLATE('SELECTED VALUES','ES','-(') FROM DUAL;

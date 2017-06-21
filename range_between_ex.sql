CREATE TABLE DATE_RANGES_TST AS
SELECT 'A_'
  || ( row_number() OVER ( ORDER BY ROWNUM ) ) r_id,
  dt
FROM
  (SELECT TO_DATE ( '2017-09-16 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-16 04:05:25' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-16 04:05:26' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-16 04:05:26' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-16 04:05:27' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-16 04:06:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-18 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-18 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-19 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-20 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-09-20 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-10-20 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2017-10-21 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2018-10-20 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  UNION ALL
  SELECT TO_DATE ( '2018-10-20 04:05:23' , 'YYYY-MM-DD HH24:MI:SS' ) dt
  FROM DUAL
  );


select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS')  from DATE_RANGES_TST;



-- count dates within the 
select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS') dt , 
count(*) OVER ( ORDER BY dt RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) no_of_dts_day from DATE_RANGES_TST;


-- 1 following day
select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS') dt , 
count(*) OVER ( ORDER BY dt RANGE BETWEEN UNBOUNDED PRECEDING AND 1  FOLLOWING ) no_of_dts_day from DATE_RANGES_TST;


--One month interval 
select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS') dt , 
count(*) OVER ( ORDER BY dt RANGE BETWEEN INTERVAL '1' MONTH   PRECEDING 
AND INTERVAL '1' MONTH  FOLLOWING ) no_of_dts_day from DATE_RANGES_TST;



-- hour interval 
select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS') dt , 
count(*) OVER ( ORDER BY dt RANGE BETWEEN INTERVAL '1' HOUR   PRECEDING 
AND INTERVAL '1' HOUR  FOLLOWING ) no_of_dts_day_sec from DATE_RANGES_TST;


-- second interval
select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS') dt , 
count(*) OVER ( ORDER BY dt RANGE BETWEEN INTERVAL '1' SECOND   PRECEDING 
AND INTERVAL '1' SECOND  FOLLOWING ) no_of_dts_day_sec from DATE_RANGES_TST;

select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS') dt , 
count(*) OVER ( ORDER BY dt RANGE BETWEEN UNBOUNDED   PRECEDING 
AND INTERVAL '1' SECOND  FOLLOWING ) no_of_dts_day_sec from DATE_RANGES_TST;



select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS') dt , 
count(*) OVER ( ORDER BY dt RANGE BETWEEN INTERVAL '1' SECOND   PRECEDING 
AND CURRENT ROW ) no_of_dts_day_sec from DATE_RANGES_TST;



--1 minute 1 second before and current time 
select r_id, to_char( dt,'YYYY-MM-DD HH24:MI:SS') dt , 
count(*) OVER ( ORDER BY dt RANGE BETWEEN INTERVAL '1:1' MINUTE TO SECOND   PRECEDING 
AND CURRENT ROW ) no_of_dts_day_sec from DATE_RANGES_TST;
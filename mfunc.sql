set echo on;

select ADD_MONTHS(sysdate,2) from dual;
select TO_CHAR( NEXT_DAY(sysdate,'saturday'), 'YYYY-MM-DD HH:MM:SS' )from dual;
select TO_CHAR( LAST_DAY(sysdate), 'YYYY-MM-DD HH:MM:SS' )from dual;
select MONTHS_BETWEEN(sysdate,sysdate + 30), MONTHS_BETWEEN(sysdate + 60,sysdate) from dual;



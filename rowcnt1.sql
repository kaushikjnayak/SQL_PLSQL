 SET SERVEROUTPUT ON;
 declare
 x number(2);
 type rectp is record 
 (
 JR01_DATE       JR0110.JR01_DATE%TYPE       ,
 JRNL_NO         JR0110.JRNL_NO%TYPE          ,
 CUSM_NO         JR0110.CUSM_NO%TYPE          ,
 BRCH            JR0110.BRCH%TYPE             ,
 TO_CURR_AMOUNT	 JR0110.TO_CURR_AMOUNT%TYPE
 );
r1 rectp;

 begin
 select *  INTO  r1 from ( select JR01_DATE,JRNL_NO,CUSM_NO,BRCH,TO_CURR_AMOUNT from JR0110 order by TO_CURR_AMOUNT DESC ) where rownum < 2;
 x := SQL%ROWCOUNT;
 dbms_output.put_line(x);
 end;
 /
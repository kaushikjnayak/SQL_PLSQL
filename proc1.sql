 create or replace procedure chg_brch (brch_in in GLIF10.BRCH%TYPE) as
 begin
 update GLIF10 set BRCH = brch_in where BRCH='01581';
 end;
 /
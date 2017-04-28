set linesize 100;
select KEY_1,BRCH,DESCRIPTION FROM GLIF10 WHERE ROWID = (SELECT MAX(ROWID) FROM GLIF10);
-- returns last row


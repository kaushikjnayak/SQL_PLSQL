--SESSION 1


DECLARE
  ct       NUMBER(5)             := 0;
  pipename CONSTANT VARCHAR2(20) := 'test_ins_pipe';
  result   INTEGER;
  pipebuf  VARCHAR2(64);
BEGIN
  result := DBMS_PIPE.create_pipe(pipename);
  LOOP
    ct := ct + 1;
    INSERT INTO LOG_EXEC VALUES
      ( SYSDATE,'R - '||ct
      );
    COMMIT;
    DBMS_LOCK.SLEEP(3);
    IF DBMS_PIPE.receive_message(pipename, 0) = 0 THEN
      /* interpret the message and act accordingly */
      DBMS_PIPE.unpack_message(pipebuf);
      EXIT
    WHEN pipebuf = 'stop';
    END IF;
  END LOOP;
END;
/



--SESSION 2
select * from LOG_EXEC;

DECLARE
pipename VARCHAR2 (20) := 'test_ins_pipe';
result INTEGER := DBMS_PIPE.create_pipe (pipename);
BEGIN
DBMS_PIPE.pack_message ('stop');
result := DBMS_PIPE.send_message (pipename);
END;
/
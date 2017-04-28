DROP TABLE Channel;
DROP TABLE Programme;


Create Table Channel 
( Channel_Number NUMBER(3),
  Channel_Name Varchar2(30),
  Channel_Language Varchar2(20)
  );


Create Table Programme
(
Program_ID  Number(4),
Channel_Number NUMBER(3),
Programme_Name Varchar2(40)
);


INSERT INTO CHANNEL VALUES (230,'ZEE CINEMA','Hindi');
INSERT INTO CHANNEL VALUES (244,'SONY','Hindi');
INSERT INTO CHANNEL VALUES (260,'NATIONAL GEOGRAPHIC','English');
INSERT INTO CHANNEL VALUES (463,'SET MAX','HINDI');
INSERT INTO CHANNEL VALUES (368,'SUVARNA','Kannada');
INSERT INTO CHANNEL VALUES (602,'STAR MOVIES','English');


commit;

INSERT INTO Programme VALUES (2376,230,'Jism');
INSERT INTO Programme VALUES (4587,660,'Mukta Mukta');
INSERT INTO Programme VALUES (1876,457,'Man vs Wild');
INSERT INTO Programme VALUES (7804,463,'SURYAVANSHAM');
INSERT INTO Programme VALUES (2345,368,'BIG BOSS 2');
INSERT INTO Programme VALUES (4580,244,'CID');
INSERT INTO Programme VALUES (4580,244,'Crime Patrol');

commit;


SELECT * FROM CHANNEL FULL JOIN Programme ON CHANNEL.Channel_Number = Programme.Channel_Number;
SELECT * FROM CHANNEL  JOIN Programme ON CHANNEL.Channel_Number = Programme.Channel_Number;





CREATE TABLE IMAGE_DATA2  
(
 IMAGE_ID NUMBER(5),
 IMAGE_NAME VARCHAR2(20),
 IMAGE_FILE BFILE,
 IMAGE_DB BLOB
 );

DECLARE
  myfile BFILE;
  imgdb BLOB;
BEGIN
  myfile := BFILENAME( 'BFILE_DATA' , 'garden_rose.jpg' );
  INSERT
  INTO IMAGE_DATA2 VALUES
    (
      10001,
      'RED GARDEN ROSE',
      myfile,
      empty_blob()
    )
  RETURNING IMAGE_DB INTO imgdb;
  DBMS_LOB.OPEN(myfile, DBMS_LOB.LOB_READONLY);
  DBMS_LOB.LOADFROMFILE(imgdb,myfile,DBMS_LOB.getlength(myfile));
  DBMS_LOB.CLOSE(myfile);
END;
/

select * FROM IMAGE_DATA2;

select utl_raw.cast_to_varchar2(dbms_lob.substr(IMAGE_DB,1024)) from IMAGE_DATA2 ;
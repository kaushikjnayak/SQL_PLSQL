CREATE TABLE MEMBER
(
member_no  number(5),
member_name char(20),
member_area_code number(4),
constraint member_no_pk PRIMARY KEY(member_no)
);

CREATE TABLE EXPENSE
(
product_code  number(3),
amount   number(10,4),
member_no number(5),
CONSTRAINT amtchk CHECK(amount like '%.%'),
CONSTRAINT memb_no_fk FOREIGN KEY(member_no)
REFERENCES MEMBER(member_no)
);

INSERT INTO EXPENSE VALUES (231,45.6,34567);  --PARENT KEY NOT FOUND;
INSERT INTO MEMBER VALUES  (34356,'KAUSHIK J N',3341); -- 1 ROW CREATED
INSERT INTO EXPENSE VALUES (231,45.6,34567); --PARENT KEY NOT FOUND;
INSERT INTO EXPENSE VALUES (231,45.6,34356); --1 ROW CREATED 


 ALTER TABLE EXPENSE RENAME CONSTRAINT amtchk TO decimal_check;

INSERT INTO EXPENSE VALUES (231,45.3,34356);

ALTER TABLE EXPENSE DROP CONSTRAINT decimal_check;
-- TRUNCATE THE TABLE
ALTER TABLE EXPENSE ADD CONSTRAINT decimal_check CHECK ( amount like '.%' );

INSERT INTO EXPENSE VALUES (231,45.3,34356);

ALTER TABLE EXPENSE DROP CONSTRAINT decimal_check;
ALTER TABLE EXPENSE ADD CONSTRAINT decimal_check CHECK ( amount like '%._%' );


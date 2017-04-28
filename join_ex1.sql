DROP TABLE GADGET;
DROP TABLE COMPANY;

create table Gadget (
Gadget_ID number(5) PRIMARY KEY,
gadget_name varchar2(10),
price number(8,2),
company_id number(6)
);

create table company (
Company_ID number(6) UNIQUE,
company_name varchar2(20)
);

INSERT INTO Gadget values (40675,'SAMSUNG S3',27000.00,189765);
INSERT INTO Gadget values (40678,'SAMSUNG S4',30000.00,189765);
INSERT INTO Gadget values (40679,'SAMSUNG S5',45000.00,189765);
INSERT INTO Gadget values (40689,'NOKIA 2330',4500.00,176890);
INSERT INTO Gadget values (40699,'SONY 21L',4500.00,157898);

INSERT INTO company values (189765,'SAMSUNG CORP');
INSERT INTO company values (157898,'SONY  INC');
INSERT INTO company values (176890,'NOKIA LTD');


select G1.Gadget_ID,g1.gadget_name from Gadget G1,GADGET G2 where G1.PRICE = G2.PRICE and G2.Gadget_ID = 40689; -- select all rows whose price is equal to that of NOKIA 2330;
select G1.Gadget_ID,g1.gadget_name from Gadget G1,GADGET G2 where G1.PRICE <  G2.PRICE and G2.Gadget_ID = 40679; -- select all rows whose  price is less than that of SAMSUNG S3;
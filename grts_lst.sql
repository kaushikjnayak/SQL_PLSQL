create table factors (factor1 number(10),factor2 number(10));

INSERT INTO factors values (42,45);
INSERT INTO factors values (3,45);
INSERT INTO factors values (42,45);
INSERT INTO factors values (42,75);
INSERT INTO factors values (62,45);
INSERT INTO factors values (42,47);
INSERT INTO factors values (15,45);
INSERT INTO factors values (12,45);
INSERT INTO factors values (42,5);
select greatest(factor1,factor2),least(factor1,fa ctor2) from factors;
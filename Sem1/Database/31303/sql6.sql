create table n_emp(id int,name varchar(20),sal int, did int,dname varchar(20));

create table o_emp(id int,name varchar(20),sal int, did int,dname varchar(20));

create or replace procedure avddup()
begin
declare d int default 0;
declare id,sal,did int;
declare name,dname varchar(20);
declare curr cursor for select * from n_emp as n where n.id not in (select o_emp.id from o_emp);
declare exit handler for not found set d = 1;
open curr;
label:loop
fetch curr into id,name,sal,did,dname;
insert into o_emp values (id,name,sal,did,dname);
end loop;
close curr;
end &&

insert into o_emp values(101,'Hello',10000,1,'Comp');
insert into o_emp values(102,'Hi',20000,2,'Comp');

insert into n_emp values(101,'Hello',10000,1,'Comp');
insert into n_emp values(102,'Hi',20000,2,'Comp');
insert into n_emp values(103,'Hiiii',30000,3,'Comp');
insert into n_emp values(104,'Byeee',30000,3,'Comp');
insert into n_emp values(105,'Let',50000,5,'Comp');

select * from o_emp;


create or replace procedure depadd(in deptid int)
begin
declare d int default 0;
declare id,sal,did int;
declare name,dname varchar(20);
declare curr cursor for select * from n_emp as n where n.did = dept.id and n.id not in (select o_emp.id from o_emp);
declare exit handler for not found set d = 1;
open curr;
label:loop
fetch curr into id,name,sal,did,dname;
insert into o_emp values (id,name,sal,did,dname);
end loop;
close curr;
end &&



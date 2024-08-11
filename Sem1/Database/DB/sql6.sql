create table n_emp(id int,name varchar(20),sal varchar(20),did int,dname varchar(20));

create table o_emp(id int,name varchar(20),sal varchar(20),did int,dname varchar(20));

create or replace procedure insertinto()
begin
declare d int default 0;
declare id,sal,did int;
declare name,dname varchar(20);
declare curr cursor for select * from n_emp as n where n.id not in (select id from o_emp);
declare exit handler for not found set d = 1;
open curr;
label:loop
fetch curr into id,name,sal,did,dname;
insert into o_emp values (id,name,sal,did,dname);
end loop;
close curr;
end &&

create procedure insertdep(in deptid int)
begin
declare d int default 0;
declare id,sal,did int;
declare name,dname varchar(20);
declare curr cursor for select * from n_emp as n where n.did = deptid and n.id not in (select id from o_emp);
declare exit handler for not found set d = 1;
open curr;
label:Loop
fetch curr into id,name,sal,did,dname;
insert into o_emp values (id,name,sal,did,dname);
end loop;
close curr;
end &&



create procedure p1()
begin
declare id,sal,did,b int ;
declare name,dname varchar(20);
declare c1 cursor for select * from n_emp where id not in (select id from o_emp);
declare exit handler for not found set b=1;
open c1;
label:LOOP
fetch c1 into id,name,sal,did,dname;
insert into o_emp values(id,name,sal,did,dname);
end LOOP;
end;
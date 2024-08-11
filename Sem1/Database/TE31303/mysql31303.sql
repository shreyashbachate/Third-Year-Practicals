create table Dept(dept_id int,dname varchar(20),dlocation varchar(20));

create table employee(emp_id int,dept_id int,fname varchar(20),lname varchar(20),designation varchar(20),joindate date);

create table Project(proj_id int,dept_id int,pname varchar(20),plocation varchar(20),pcost int,pyear date);

alter table Dept add primary key(dept_id);

alter table employee add primary key(emp_id);

alter table Project add Primary key(proj_id);

alter table Dept modify dname varchar(20) not null;

alter table employee modify fname varchar(20) not null;

alter table Project modify pname varchar(20) not null;

alter table employee add foreign key(dept_id) references Dept(dept_id) on delete cascade;

alter table Project add foreign key(dept_id) references Dept(dept_id) on delete cascade;

alter table employee drop primary key;

alter table employee modify emp_id int auto_increment primary key;

alter table Project drop primary key;

alter table Project modify proj_id int auto_increment primary key;

insert into Dept values(1,'Computer','Mumbai');

insert into Dept values(2,'IT','Mulund');

insert into Dept values(3,'ENTC','Pune');

insert into Dept values(4,'Mechanical','Malad');

insert into Dept values(5,'Electrical','Pune');

insert into Dept values(6,'Civil','Mumbai');

insert into Dept values(7,'AIML','Kolhapur');

insert into employee values(null,1,'Raja','Raman','G.Manager','2010-01-01');

insert into employee values(null,1,'Rohit','Dhavan','Manager','2012-03-01');

insert into employee values(null,1,'Prajwal','Kakade','HR','2016-04-01');

insert into employee values(null,2,'Gaurav','Chawda','HR','2016-04-01');

insert into employee values(null,3,'Sid','Bhusari','HR','2016-04-01');

insert into employee values(null,4,'Tushar','Bhurale','employee','2018-05-01');

insert into employee values(null,5,'Vinayak','Gondkar','employee','2018-07-01');

insert into employee values(null,6,'Yash','Ghosalkar','employee','2018-07-01');

insert into employee values(null,7,'Suyash','Teli','employee','2019-07-01');

insert into employee values(null,1,'Rohan','Tithe','employee','2020-07-01');

insert into Project values(null,1,'Tata Power','Mumbai',200000,'2018-01-01');

insert into Project values(null,2,'Olectra','Pune',100000,'2018-05-01');

insert into Project values(null,3,'ProjElect','Mumbai',50000,'2018-12-01');

insert into Project values(null,1,'Web','Mumbai',50000,'2020-01-01');

insert into Project values(null,6,'Construction','Mumbai',50000,'2021-01-01');

alter table employee add column Salary varchar(20);

update employee set Salary=2000000 where emp_id=1;

update employee set Salary=1000000 where emp_id=2;

update employee set Salary=500000 where emp_id=3;

update employee set Salary=500000 where emp_id=4;

update employee set Salary=500000 where emp_id=5;

update employee set Salary=450000 where emp_id=6;

update employee set Salary=450000 where emp_id=7;

update employee set Salary=450000 where emp_id=8;

update employee set Salary=400000 where emp_id=9;

update employee set Salary=400000 where emp_id=10;

select * from Project;

select * from employee where dept_id =1 or dept_id = 2 and fname like 'P%' or fname like 'h%';

select distinct designation from employee;

select count(distinct designation) from employee;

select count(distinct designation) as No_of_Positions  from employee;

select Salary*0.1 as Increase from employee where joindate<'2015-01-01';

select (Salary*0.1)+Salary as Increase from employee where joindate<'2015-01-01';

select pname from Project where plocation ='pune';

select pname from Project where pcost between 100000 and 500000;

select * from employee order by fname desc,emp_id desc;

select max(pcost) as Maximum_Cost from Project;

select avg(pcost) as Average_Cost from Project;

select avg(pcost) as Average_Cost, max(pcost) as Maximum_Cost  from Project;

insert into Project values(null,7,'Calculate','Kolhapur',500000,'2004-01-01');

insert into Project values(null,7,'AI-Vision','Kolhapur',400000,'2005-01-01');

 insert into Project values(null,7,'VisGrapgh','Kolhapur',300000,'2006-01-01');

insert into Project values(null,1,'HighWidth','Mumbai',500000,'2007-01-01');

select pname,plocation,pcost from Project where pyear between '2004-01-01' and '2005-12-31' or pyear between '2007-01-01' and '2007-12-31';

create index empname on employee(fname,lname);

create unique index projname on Project(pname);

create view empinfo as Select emp_id,fname,lname,designation from employee where dept_id = (select dept_id from Dept where dname = 'computer');




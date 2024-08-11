create table Dept(dept_id int primary key,dname varchar(20) not null,dlocation varchar(20));

create table Employee(emp_id int not null auto_increment,dept_id int,fname varchar(20),lname varchar(20),designation varchar(20),sal int, joindate date,primary key(emp_id),foreign key(dept_id) references Dept(dept_id) on delete cascade);

create table Project(proj_id int not null,dept_id int,pname varchar(20),plocation varchar(20),pcost int,pyear varchar(20),foreign key(dept_id) references Dept(dept_id) on delete cascade);

insert into Dept values(1,'Computer','Mumbai');

insert into Dept values(2,'IT','Mulund');

insert into Dept values(3,'ENTC','Pune');

insert into Dept values(4,'Mechanical','Malad');

insert into Dept values(5,'Electrical','Pune');

insert into Dept values(6,'Civil','Mumbai');

insert into Dept values(7,'AIML','Kolhapur');


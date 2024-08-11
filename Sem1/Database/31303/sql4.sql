create table area(radius int,area float);

create or replace procedure area()
begin
declare d int default 5;
label : loop
if d > 9 then
leave label;
end if;
insert into area values(d,3.14*d*d);
set d = d+1;
end loop;
end;

create or replace procedure area(in radius int)
begin
declare d float default 0;
if radius <0 
then signal sqlstate '45000'
set message_text = "Radius cannot be negative";
elseif radius > 9 or radius < 5
then signal sqlstate '51000'
set message_text = "Invalid Radius";
end if;
set d = 3.14*radius*radius;
insert into area values(radius,d);
end;


create table borrower(roll int,name varchar(20),doi date,bookname varchar(20),status varchar(20));

create table fine(roll int,datereturn date,fine int);

create or replace procedure calcfine(in rollno int,in bname varchar(20))
begin
declare v1 date;
declare v2 int;
declare stat varchar(20);

select status into stat from borrower where roll = rollno and bookname = bname;
if stat = 'R'
then signal sqlstate '45000'
set message_text = 'Book Already Returned';
end if;
select doi into v1 from borrower where roll = rollno and bookname = bname;
set v2 = datediff(curdate(),v1);

if v2 >= 16 and v2 <= 30
then insert into fine values(rollno,curdate(),5*(v2-15));
elseif v2 > 30
then
insert into fine values(rollno,curdate(),5*15 + 50*(v2-30));
end if;
update borrower set status = 'R' where roll = rollno and bookname = bname ;
end;

insert into borrower values(101,'Hello',"2022-09-01","HarryPotter",'I');

insert into borrower values(102,'Hi',"2022-10-01","HarryPotter",'I');

insert into borrower values(103,'Bye',"2022-11-01","HarryPotter",'I');

insert into borrower values(104,'Kay',"2022-10-01","HarryPotter",'I');

insert into borrower values(105,'Tiu',"2022-09-01","HarryPotter",'I');


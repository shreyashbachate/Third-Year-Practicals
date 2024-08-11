create table area(radius int,area float);

create or replace procedure area()
begin
declare p int default 5;
label:loop
if p > 9 then
leave label;
end if;
insert into area values(p,3.14*p*p);
set p = p+1;
end loop;
end; 


create table borrower(rollno int,name varchar(20),doi date,nameofbook varchar(20),status varchar(20));

create table fine(roll int,dateofreturn date,amount int);

create or replace procedure calcfine(roll int,bookname varchar(20))
begin
declare stat varchar(20);
declare v1 date;
declare v2 int;

select status into stat from borrower where rollno = roll and nameofbook = bookname;
if stat = 'R'
then signal sqlstate '45000'
set message_text = 'Book Already Returned';
end if;
select doi into v1 from borrower where rollno=roll and nameofbook = bookname;
set v2 = datediff(curdate(),v1);

if v2>=16 and v2<=30 then
insert into fine values(roll,curdate(),5*(v2-15));
elseif v2 >30 then
insert into fine values(roll,curdate(),5*15+50*(v2-30));
end if;
update borrower set status = 'R' where rollno = roll and nameofbook = bookname;
end;

insert into borrower values(101,'Hello',"2022-09-01","HarryPotter",'I');

insert into borrower values(102,'Hi',"2022-10-01","HarryPotter",'I');

insert into borrower values(103,'Bye',"2022-11-01","HarryPotter",'I');

insert into borrower values(104,'Kay',"2022-10-01","HarryPotter",'I');

insert into borrower values(105,'Tiu',"2022-09-01","HarryPotter",'I');

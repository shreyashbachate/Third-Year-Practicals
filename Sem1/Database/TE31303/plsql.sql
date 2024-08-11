create or replace procedure Select_rec(in id int) begin select * from empinfo where id = id; end&&

call Select_rec(1);

create or replace procedure Select_rec(in empid int) begin
select * from empinfo where emp_id = empid; end&&

call Select_rec(10);&&

create or replace procedure empname(out name varchar(20)) begin select * from empinfo where emp_id = 1; end&&

 call empname(@temp)&&

create or replace procedure empname(out name varchar(20)) begin select fname into name from empinfo where emp_id = 1; end&&

call empname(@temp)&&

select @temp&&

create or replace procedure depadd(in dept_id int,in dname
varchar(20),in dlocation varchar(20)) begin insert into Dept values(dept_id,dname,dlocation); end&&

 call depadd(9,'Kop','Kop')&&

create or replace procedure getres(in id int,out isavg boolean) 
begin 
declare avgsal float default 0.0; 
declare sal float default 0.0; 
select avg(Salary) into avgsal from employee; 
select Salary into sal from employee where emp_id = id; 
if(avgsal > sal) then  
set isavg = true; 
else set isavg = false; 
end if; 
end&&

call getres(1,@temp)&&

select @temp;&&

 create table AreaOfCircle(radius float,area float);

create or replace procedure area(in radius float,out circle float) 
begin 
declare calc float default 0.0; 
set calc = 3.14*radius*radius; 
set circle = calc; 
insert into AreaOfCircle values(radius,circle); 
end&&

call area(5,@temp);&&

select @temp&&

create or replace procedure area(in radius float, out circle float) 
begin 
declare calc float default 0.0; 
if radius>5 and radius <9 
then 
set calc =3.14*radius*radius; 
set circle = calc; 
insert into AreaOfCircle values(area,circle); 
else signal sqlstate '45000' set message_text='Invalid Radius'; 
end if; 
end&&

create table borrower(roll_no int,name varchar(20),dateofissue date,nameofbook varchar(20),status varchar(20));
create table fine(roll_no int, dateof date,amount int);





create or replace procedure insrt(in roll_no int, in name varchar(20), in date_of_issue date, in name_of_book varchar(20), in status varchar(20)) 
begin 
declare exit handler for 1062 begin select concat('duplicate roll no ', roll_no, ' occured') as error; 
end; 
insert into Borrower values (roll_no, name, date_of_issue, name_of_book, status); 
end@

create or replace procedure returnBook(in roll_no int, in name varchar(20)) 
begin  
	declare stat varchar(10); 
	declare doi date; 
	declare diff int; 
	select status into stat from Borrower where roll_no = roll_no and name_of_book = name; 
	if stat = 'R' then 
		signal sqlstate '50001' set message_text = 'book already returned'; 
	endif; 
	select date_of_issue into doi from Borrower where roll_no = roll_no and name_of_book = name; 
	set diff = datediff(curdate(), doi); 
	if (diff >= 15 and dif <= 30) then 
		insert into Fine values (roll_no, currdate(), 5*(diff-14)); 
	elseif (diff > 30) then 
		insert into values (roll_no, currdate(), 5*(15) + 50*(diff-30)); 
	endif; 
	update Borrower set status = 'R' where roll_no = roll_no and name_of_book = name;  
end@


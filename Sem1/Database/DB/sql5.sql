create table student(id int,name varchar(20),marks int);

create table result(id int,name varchar(20),status varchar(50));

delimiter  &&

create procedure showres (in id int,in name varchar(20),in marks int)
begin
declare status varchar(50); 
insert into student values(id,name,marks);
if marks < 0 
then signal sqlstate  '45000'
set message_text = 'Invalid Marks';
end if;
if marks<= 1500 and marks >= 990
then set status = 'Distinction'; 
elseif marks <=989 and marks >=900
then set status = 'First Class';
elseif marks <=899 and marks >= 800
then set status = 'Higher Second Class'; 
end if;
insert into result values(id,name,status);
end;&&

create function resFunc(id int,name varchar(20),marks int) returns varchar(50)
DETERMINISTIC
begin
declare status varchar(50);
if marks<0
then signal sqlstate '45000'
set message_text = 'Invalid marks';
end if;
if marks <= 1500 and marks >= 990
then set status = 'Distinction';
elseif marks <= 989 and marks >=900
then set status = 'First Class';
elseif marks <=899 and marks>=800
then set status = 'Higher Second Class';
end if;
insert into student values (id,name,marks);
insert into result values(id,name,status);
return status;
end;
&&
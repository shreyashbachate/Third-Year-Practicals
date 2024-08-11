create table student(roll int,name varchar(20),marks int);

create table result(roll int,name varchar(20),status varchar(20));

create or replace procedure calc(in roll int,in name varchar(20),in marks int)
begin
declare status varchar(20);
if marks < 0 then
signal sqlstate '45000'
set message_text = 'Marks cannot be negative';
end if;

if marks<=1500 and marks >=990
then
set status = 'Distinction';
elseif marks<=989 and marks >= 900
then set status = 'First Class';
elseif marks<=899 and marks >= 800
then set status = 'Higher Second Class';
else
set status = 'Fail';
end if;

insert into student values(roll,name,marks);
insert into result values(roll,name,status);
end;

create or replace function calcfun( roll int, name varchar(20), marks int) returns varchar(20)
DETERMINISTIC
begin
declare status varchar(20);
if marks < 0 then
signal sqlstate '45000'
set message_text = 'Marks cannot be negative';
end if;
if marks<=1500 and marks >=990
then
set status = 'Distinction';
elseif marks<=989 and marks >= 900
then set status = 'First Class';
elseif marks<=899 and marks >= 800
then set status = 'Higher Second Class';
else
set status = 'Fail';
end if;
insert into student values(roll,name,marks);
insert into result values(roll,name,status);
return status;
end;

create or replace procedure caldef()
begin
declare roll,marks,d int;
declare name,status varchar(20);
declare curr cursor for select * from student;
declare exit handler for not found set d = 1;
open curr;
label : loop
fetch curr into roll,name,marks;
if marks < 0 then
signal sqlstate '45000'
set message_text = 'Marks cannot be negative';
end if;
if marks<=1500 and marks >=990
then
set status = 'Distinction';
elseif marks<=989 and marks >= 900
then set status = 'First Class';
elseif marks<=899 and marks >= 800
then set status = 'Higher Second Class';
else
set status = 'Fail';
end if;
insert into result values(roll,name,status);
end loop;
close curr;
end;
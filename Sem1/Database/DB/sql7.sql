create table student(roll int,name varchar(20),book_count int);

create table library_audit(roll int,name varchar(20),book_count int);

create table totalbook(books int);

insert into totalbook values (500);

create or replace trigger bef_inst
before insert on student
for each row
begin
declare tot int;
select books into tot from totalbook;

if new.book_count > 5 or tot < new.book_count
then signal sqlstate '51000'
set message_text = 'Cant get books';
end if;

end;


create trigger aft_inst
after insert on student
FOR EACH ROW
begin
declare tot int;
select books into tot from totalbook;
update totalbook set books := tot - new.book_count;
end;


create or replace trigger bef_upd
before update on student
for each row
begin
if new.book_count > 5
then signal sqlstate '51000'
set message_text = 'No more than 5 books allowed';
end if;
end;

create or replace trigger aft_upd
after update on student
for each row 
begin
declare tot int;
select books into tot from totalbook;

insert into library_audit values (old.roll,old.name,old.book_count);
update totalbook set books = tot + old.book_count - new.book_count;
end;

create or replace trigger bef_del
before delete on student
for each row
begin
insert into library_audit values (old.roll,old.name,old.book_count);
end;

create or replace trigger aft_del
after delete on student
for each row
begin
declare tot int;
select books into tot from totalbook;
update totalbook set books = tot + old.book_count;
end;


 insert into student values(1,'Hello',10);&&

 create procedure display()
 begin
 select * from student;
 select * from library_audit;
 select * from totalbook;
 end;

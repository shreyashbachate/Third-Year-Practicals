create table studinfo(roll int,name varchar(20),bookcount int);

create table library_audit(roll int,name varchar(20),bookcount int);

create table totalbook(books int);

insert into totalbook values (500);

create or replace trigger bef_inst
before insert on studinfo
for each row
begin
declare sumbook int;
select books into sumbook from totalbook;
if new.bookcount > 5 or sumbook < new.bookcount
then signal sqlstate '45000'
set message_text = 'Cannot get books';
end if;
end;

create or replace trigger aft_inst
after insert on studinfo
for each row
begin
declare sumbook int;
select books into sumbook from totalbook;
update totalbook set books = sumbook - new.bookcount;
end;

create or replace trigger bef_udt
before update on studinfo
for each row
begin
if new.bookcount > 5
then signal sqlstate '45000'
set message_text = 'No more than 5 books allowed';
end if;
end;

create or replace trigger bef_del
before delete on studinfo
for each row
begin
    insert into library_audit values (old.roll,old.name,old.bookcount);
end;

create or replace trigger aft_upd
after update on studinfo
for each row
begin
insert into library_audit values (old.roll,old.name,old.bookcount);
update totalbook set books = books + (old.bookcount - new.bookcount);
end;

create or replace trigger aft_del
after delete on studinfo
for each row
begin
    update totalbook set books = books + old.bookcount;
end;

create or replace procedure display()
 begin
 select * from studinfo;
 select * from library_audit;
 select * from totalbook;
 end;



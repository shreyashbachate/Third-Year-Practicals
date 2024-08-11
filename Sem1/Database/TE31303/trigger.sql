create table Library_audit(roll_no int,name varchar(20),book_count int);

create table Student(roll_no int,name varchar(20),book_count int);

create table TotalBook(sum_books int);

insert into TotalBook values(500);

delimiter &&
create or replace Trigger update_table
after update on Student
for each row
Begin
if old.book_count = 5
then signal sqlstate '45000'
set message_text ="Limit Excedded";
update Student set book_count = 5 where old.roll_no = new.roll_no;
else
update TotalBook set sum_boks = sum_books - 1;
update Student set book_count = book_count+1 where old.roll_no = new.roll_no;
insert into Library_audit values(old.roll_no,old.name,old.book_count);
end if;
end&&


create or replace Trigger delete_table
before delete on Student
for each row
Begin
insert into Library_audit values(old.roll_no,old.name,old.book_count);
update TotalBook set sum_boks = sum_books+old.book_count;
end&&



create or replace trigger before_insert
before insert on Student
for each row
Begin
declare tot int;
select sum_books into tot from TotalBook;
if new.book_count > 5 or tot < new.book_count
then signal sqlstate '51000'
set message_text = "Cant get books";
end if;
end&&


create or replace trigger after_insert
after insert on Student
for each row
Begin
declare SumOfBooks int;
	select sum_books into SumOfBooks from Totalbook;

	update Totalbook set sum_books = SumOfBooks-NEW.book_count;
end&&


--check constraints on Student update

create trigger before_update BEFORE UPDATE ON Student
FOR EACH ROW
BEGIN
	if NEW.book_count > 5 then
		signal SQLState '50001'
		set MESSAGE_TEXT = "NO more than 5 books allowed";
	end if;
END&&

--update book sum on student update

create trigger after_update AFTER UPDATE ON Student
FOR EACH ROW
	BEGIN
		declare SumOfBooks int;
		select sum_books into SumOfBooks from Total_book;

		insert into Library_Audit(roll,name,book_count) values(OLD.roll_no,old.name,OLD.book_count);
		update TotalBook set sum_books=SumOfBooks+OLD.book_count-NEW.book_count;
	end&&

--before delete
create trigger before_delete BEFORE DELETE ON Student
FOR EACH ROW
	BEGIN
		insert into Library_Audit(roll,name,book_count) values(OLD.roll_no,old.name,OLD.book_count);
	END&&

--after delete
create trigger after_delete AFTER DELETE ON Student
FOR EACH ROW
	BEGIN
		declare SumOfBooks int;
		select sum_books into SumOfBooks from Total_book;


		update Total_book set sum_books = SumOfBooks+OLD.book_count;
	END&&



drop table N_Empid;
drop table O_Empid;
create table N_Empid(id int, name varchar(100));
create table O_Empid(id int, name varchar(100));
delimiter &&
create procedure insertinto()
begin
	declare done int default FALSE;
	declare currentName varchar(100);
	declare tempName varchar(100);
	declare tempId int;
	declare currentId int;
	declare curr cursor for select emp_id, emp_name from O_Empid;
	declare n_curr cursor for select emp_id, emp_name from N_Empid where emp_id=currentId;
	declare CONTINUE HANDLER for not found SET done = TRUE;
	open curr;
	read_till_end: LOOP
	FETCH NEXT from curr into currentName, currentId;
	if done 
	then leave read_till_end;
	end if;
	open n_curr;
	FETCH NEXT from n_curr into tempName, tempId;
	if done 
	then insert into n_emp values(currentId, currentName);
		set done = FALSE;
	else
		set done = FALSE;
	end if;
	close n_curr;
	end loop;
	close curr;
end&&

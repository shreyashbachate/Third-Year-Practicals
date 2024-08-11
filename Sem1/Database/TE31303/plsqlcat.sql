create table Stud_marks(roll int,name varchar(20),total_marks int);

create table Result(roll int,name varchar(20),class varchar(20));

create or replace procedure proc_Grade(in roll int,in name varchar(20),in marks int)
begin
declare status varchar(20);     
insert into Stud_marks values(roll,name,marks); 
if marks<=1500 and marks>=990 
then set status = 'Distinction'; 
elseif marks <=989 and marks>=900  
then set status = 'first class'; 
elseif marks <=899 and marks>=825 
then set status = 'High Sec Class'; 
end if; 
insert into Result values(roll,name,status); 
end&&




function 



create or replace function proc(roll int,name varchar(20),marks int) returns varchar(50)
begin
declare status varchar(20);     
insert into Stud_marks values(roll,name,marks); 
if marks<=1500 and marks>=990 
then set status = 'Distinction'; 
elseif marks <=989 and marks>=900  
then set status = 'first class'; 
elseif marks <=899 and marks>=825 
then set status = 'High Sec Class'; 
end if; 
insert into Result values(roll,name,status); 
return status;
end&&











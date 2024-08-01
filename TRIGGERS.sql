use t201;

drop table employee;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    salary FLOAT
);

insert into employee values
(1 , "raj" , 30 ,30000),
(2 , "rani" , 25  , 25000);

select * from employee;

create view emp_age as  
select avg(age) as avg_age , avg(salary) as avg_salary from employee;

select * from emp_age;

create table emp_avg(avg_age float , avg_salary float);

insert into emp_avg values(
(select avg(age) from employee),
(select avg(salary) from employee));

select * from emp_avg;

-- without trigger we can insert values inside emplyee but it will not reflect in emp_avg
SET sql_safe_updates = 0;

insert into employee values (7 , "sumit" , 11 , 5000);

select * from employee;

select * from emp_avg;

create trigger emp_avg_after_insert
after insert on employee 
for each row
update emp_avg
set
avg_age = (select avg(age) from employee),
avg_salary = (select avg(salary) from employee);

-- creating trigger before inserting record into emplyee
delimiter $$ 
create trigger age_checking_before_insert
before insert on employee
for each row
if new.age<18 then set new.age=0;
end if$$
delimiter ;

insert into employee values (8 , "sunita" , 10 , 1111);

select * from employee;

select * from employee;


create trigger backup_before_delete
before delete on employee
for each row
insert into employee_backup
values(old.id , old.name , old.age , old.salary);

use t201;
delete from employee where id = 2;

select * from employee_backup;

select * from employee;

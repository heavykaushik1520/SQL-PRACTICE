use t201;
show tables;
drop table employee;

create table employee(
id int primary key ,
name varchar(20) not null default 'NA' ,
salary float not null default 0
);

start transaction;

insert into employee
(id , name , salary)
values
(1 , 'rani' , 20000),
(2 , 'ajay' , 30000);

select * from employee;

savepoint instertion_step;

delete from  employee where id=1;

select * from employee;

-- for undo--------------------------------
rollback to instertion_step;

select * from employee;

update employee set name='vijay' where id=2;
select * from employee;

delete from employee where id=1;
commit;

rollback to insterion_step;

select * from employee;

use t201;

drop table employee;

create table employee(
id int primary key,
name varchar(20),
perday int,
leaves int,
bonus int
);

desc employee;

use t201;

insert into employee values 
(1 , "raj" , 1200 , 10 , 200 ),
(2 , "rani" , 900 , 1 , 500 ),
(3 , "ajay" , 1500 , 15 , 100 );

select * from employee;

-- getting some column from table
select name , perday from employee;

-- show name salary and 30 days salary
select name , perday , perday*30 as salary from employee;

-- show name , name , incremented salary after bonus
select name , perday*30+bonus as salary from employee;

-- after deducting leaves
select name , perday*30 - perday*leaves as after_deducting from employee;

-- after salary half due to covid
select name , perday*30/2 as salary_half from employee;

-- comparison operator
-- salary greater than 30k
select name , perday*30 as salary from employee where perday*30 > 30000;

-- salary less than 30k
select name , perday*30 as salary from employee where perday*30 < 30000;

-- show employees getting more than 1000 perday
select name from employee where perday>1000;

-- string
select name from employee where name like 'r%';

select name from employee where name like '%r';

select name from employee where name like 'r___';

-- and operator-------------------
use t201;
-- AND OPERATOR----------
select * from employee where name like 'r%' and perday>1000;

-- OR operator--------------
select * from employee where name like 'r%' or perday>1000;

-- not operator------------
select * from employee where name not like 'a%';

-- multiple or -------------------
select * from employee where perday=900 or perday=1200 or perday=1500;

select * from employee where perday in(900 , 1200 , 1500);

select * from employee where perday not in(900 , 1200);

-- data between range..........
select * from employee where bonus between 50 and 250;

select * from employee where bonus between 150 and 550;

-- order by ----------
select * from employee order by leaves;

select * from employee where bonus>150 order by leaves;

-- employee with max leaves
select * from employee order by leaves desc limit 1;

-- employee with second max leaves
select * from employee order by leaves desc limit 1 offset 1;

insert into employee (id , perday , leaves , bonus)
values
(4 , 1200 , 10 , 200);

insert into employee (id , name , perday , leaves)
values
(5 , "rani" , 900 , 1);

select * from employee where name is null;
select * from employee where bonus is null;
select * from employee where name is not null;
select * from employee where name = null; -- wrong

















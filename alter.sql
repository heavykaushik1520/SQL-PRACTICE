use t201;
-- deleting constraints
alter table employee drop constraint unique_name;

desc employee;

-- deleting column
alter table employee drop column city;

desc employee;

-- rename column
alter table employee rename column name to empname;
desc employee;

-- rename table
alter table employee rename to emp;
desc emp;

-- drop table
drop table emp;


-- er diagram
use t201;

desc t201;

drop table employee;

create table Employee
(id int primary key , fname varchar(20) , lname varchar(20) , salary float , leaves int , bonus float);

desc Employee;

insert into Employee 
values
(1 , "raj" , "kumar" , 25000 , 5 , 500),
(2 , "rani" , "dube" , 35000 , 10 , null),
(3 , "aniket" , "chavan" , 50000 , 7 , 200);

-- inbuilt string function
select concat("sql" , "-" , "java");

select concat(fname , ":" , lname) as full_name from Employee;

select concat_ws("-", fname , lname) as full_name from Employee;

select upper(fname) as uppercase from Employee;

select lower("TEJA") as lower;

select reverse(fname) as reverse from Employee;

select insert(fname , 1 , 2 , "#") from Employee;

-- aggregate function
-- min max avg sum count
select min(salary) from Employee;
select max(salary) from Employee;
select max(bonus) from Employee;
select avg(salary) from Employee;
select sum(salary) from Employee;
select count(id) from Employee;

-- show me employee getting salary 35000
select * from Employee where salary = 35000;

-- show me getting salary more than avg salary
select * from Employee where salary > (select avg(salary) from Employee);

-- math function
select abs(-56);
select abs(56);

select floor(52.99);
select ceil(52.10);

select round(52.51);
select round(52.45);


select round(52.125 , 2);
select round(52.124 , 2);

select truncate(52.129 , 2);





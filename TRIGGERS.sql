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
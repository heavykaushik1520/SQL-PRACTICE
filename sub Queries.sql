use t201;

select * from employee;

-- out of one query act as input of another query
-- when there is query inside a query
-- show employees having more salary than avg salary

select avg(salary) from employee;

select * from employee where salary > ( select avg(salary) from employee);

-- show me gareeb employee

select min(salary) from employee;

select * from employee where salary = (select min(salary) from employee);

select * from employee where fname = "raj";

select count(leaves) from employee where fname = "raj" ;

select * from employee where leaves > (select leaves from employee where fname = "raj");




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


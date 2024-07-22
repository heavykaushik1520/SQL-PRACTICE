show databases; -- checking all databases
use mysql; -- sekecting default database mysql
show tables; -- getting all tables from mysql
select * from user; -- selcting all column from user tables
select User from user; -- slecting only user column from user table

-- creating new users
create user 'ajay'@'localhost' identified by 'admin@123';
create user 'atul'@'localhost' identified by 'admin@123';

select * from user;

-- checking permissions for above user
show grants for 'root'@'localhost';
show grants for 'ajay'@'localhost';

-- give permission to particular user
grant insert on t201.book to 'ajay'@'localhost';
grant select on t201.book to 'atul'@'localhost';

show grants for 'atul'@'localhost';
show grants for 'ajay'@'localhost';

-- remove permission 
revoke select on t201.book from 'atul'@'localhost';
show grants for 'atul'@'localhost';



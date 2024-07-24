use t201;
create database practice;
use practice;
show databases;

create database gfg;
drop database gfg;

drop database if exists gfg;

use practice;

-- tables in SQL --

-- create table
create table Employee (
EmployeeID int primary key ,
FirstName varchar(50) ,
LastName varchar(50) ,
Salary decimal(10 , 2)
);

create table Customer (
CustomerID int primary key ,
CustomerName varchar(50) ,
LastName varchar(50) ,
Age int check (age >= 0 and age <= 99) ,
Phone int(10)
);

-- insert into table 
insert into Customer 
(CustomerID , CustomerName , LastName , Age , Phone)
values
	(1, 'Shubham', 'Thakur', 23, 1212121212),
    (2, 'Aman', 'Chopra', 21, 2323232323),
    (3, 'Naveen', 'Tulasi', 24, 3434343434),
    (4, 'Aditya', 'Arpan', 21, 4545454545),
    (5, 'Nishant. Salchichas S.A.', 'Jain', 22, 5656565656);

-- -------------------------------------------------------------------------
-- create table
CREATE TABLE Customer2 (
    CustomerID int PRIMARY KEY,
    CustomerName varchar(50),
    LastName varchar(50),
    Age int CHECK (Age >= 0 AND Age <= 99),
    Phone varchar(10),
    Country varchar(50)
);

-- insert into table 
INSERT INTO Customer2 
(CustomerID, CustomerName, LastName, Age, Phone, Country)
VALUES
    (1, 'Shubham', 'Thakur', 23, '1212121212', 'India'),
    (2, 'Aman', 'Chopra', 21, '2323232323', 'Australia'),
    (3, 'Naveen', 'Tulasi', 24, '3434343434', 'Sri Lanka'),
    (4, 'Aditya', 'Arpan', 21, '4545454545', 'Austria'),
    (5, 'Nishant. Salchichas S.A.', 'Jain', 22, '5656565656', 'Spain');
    
-- creating subtable
create table subCustomer as 
select CustomerID , CustomerName
from Customer2;

select * from subCustomer;

create table xyz(
catagoryID int not null primary key ,
catagoryName varchar(50) not null ,
ItemDescription varchar(50) not null );

insert into xyz 
(catagoryID , catagoryName , ItemDescription)
values
(1, 'Beverages', 'SoftDrink'),
(2, 'Condiments', 'Sweet and Savoury sauces'), 
(3, 'Confections', 'Sweet bread');

select * from xyz;

drop table xyz;

show tables;

create table GFG_Employees(
id int primary key ,
name varchar(20) ,
email varchar(25) ,
department varchar(20));

insert into GFG_Employees
(id , name , email , department)
values
(1, 'Jessie', 'jessie23@gmail.com', 'Development'),
(2, 'Praveen', 'praveen_dagger@yahoo.com', 'HR'),
(3, 'Bisa', 'dragonBall@gmail.com', 'Sales'),
(4, 'Rithvik', 'msvv@hotmail.com', 'IT'),
(5, 'Suraj', 'srjsunny@gmail.com', 'Quality Assurance'),
(6, 'Om', 'OmShukla@yahoo.com', 'IT'),
(7, 'Naruto', 'uzumaki@konoha.com', 'Development');

select * from GFG_Employees;

SET SQL_SAFE_UPDATES = 0;

-- deleting query
delete from GFG_Employees where name = 'Ritvik';

delete from GFG_Employees where department = 'Development';

-- delete all records
delete from GFG_Employees;

select * from GFG_Employees;

-- select query --
use practice;

show tables;

drop table customer;

create table customer (
customerID int primary key ,
customerName varchar(50) ,
LastName varchar(50) ,
Country varchar(50),
Age int ,
Phone int);

insert into customer
values
	   (1, 'Shubham', 'Thakur', 'India',23,123),
       (2, 'Aman ', 'Chopra', 'Australia',21,234),
       (3, 'Naveen', 'Tulasi', 'Sri lanka',24,345),
       (4, 'Aditya', 'Arpan', 'Austria',21,456),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain',22,567);
       
select * from customer;

select customerName , LastName from customer;

select customerName from customer where age = 21;

show tables;

create table employee2
(empId int primary key ,
name varchar(30) ,
Gender varchar(1) ,
Salary float ,
Department varchar(30) ,
Experience varchar(30));

insert into employee2 
(empId , name , Gender , Salary , Department , Experience)
values
(1 , 'Rachit' , 'M' , 50000 , 'Engineering' , '6 yrs'),
(2 , 'Shobit' , 'M' , 37000 , 'HR' , '3 yrs'),
(3 , 'Isha' , 'F' , 56000 , 'Sales' , '7 yrs'),
(4 , 'Devi' , 'F' , 43000 , 'Management' , '4 yrs'),
(5 , 'Akhil' , 'M' , 90000 , 'Engineering' , '15 yrs');

select * from employee2;

select Department , sum(Salary) as Salary
from employee2 
group by department 
having sum(Salary) >= 50000;

select * from customer order by age desc;

CREATE TABLE Employee3 (
   EmpId INTEGER PRIMARY KEY, 
   EmpName VARCHAR(225) NOT NULL,  
   Email VARCHAR(225) NOT NULL,   
   Address VARCHAR(225) NOT NULL,
   Age INT NOT NULL,
   Salary int NOT NULL
);
INSERT INTO Employee3 (EmpId, EmpName, Email, Address, Age, Salary)
VALUES (1, 'Shubham', 'shubham@example.com', 'India', 23, 50000.00),
       (2, 'Aman', 'aman@example.com', 'Australia', 21, 45000.00),
       (3, 'Naveen', 'naveen@example.com', 'Sri Lanka', 24, 55000.00),
       (4, 'Aditya', 'aditya@example.com', 'Austria', 21, 42000.00),
       (5, 'Nishant Saluja', 'nishant@example.com', 'Spain', 22, 48000.00);
       
select * from Employee3;

select * from Employee3
where Salary>45000 
order by Salary;

select * from Employee3 
where Age = 21
limit 2
offset 1;

SET SQL_SAFE_UPDATES = 0;


update Employee3 set EmpName = 'kaushik' where age = 22;

select * from Employee3;

update Employee3 set EmpName = 'kaushik';

select * from Employee3;

update Employee3 set EmpName = 'kaushik';

select * from Employee3;

CREATE TABLE GFG_Employees2 (
   id INT PRIMARY KEY,
   name VARCHAR (20) ,
   email VARCHAR (25),
   department VARCHAR(20)
);

INSERT INTO GFG_Employees2 (id, name, email, department) VALUES 
(1, 'Jessie', 'jessie23@gmail.com', 'Development'),
(2, 'Praveen', 'praveen_dagger@yahoo.com', 'HR'),
(3, 'Bisa', 'dragonBall@gmail.com', 'Sales'),
(4, 'Rithvik', 'msvv@hotmail.com', 'IT'),
(5, 'Suraj', 'srjsunny@gmail.com', 'Quality Assurance'),
(6, 'Om', 'OmShukla@yahoo.com', 'IT'),
(7, 'Naruto', 'uzumaki@konoha.com', 'Development');

select * from GFG_Employees2;

 alter table GFG_Employees2 rename to Kaushikk;
 
 alter table Kaushikk add column salary float;
 
 alter table Kaushikk rename column email to gmail;
 
 CREATE TABLE Student_details (
ROLL_NO INT,
NAME VARCHAR(25),
ADDRESS VARCHAR(25),
PHONE INT ,
AGE INT);  -- Inserting the data in Student Table

INSERT INTO 
Student_details(ROLL_NO,NAME,ADDRESS,PHONE,AGE)
 VALUES 
(1,'Ram','Delhi',9415,24),
(2,'Ramesh','Gurgaon',94145,21),
(3,'Sujit','Delhi',981,20),
(4,'Suresh','Noida',9115,21),
(5,'Kajal','Gurgaon',891,28),
(6,'Garima','Rohtak',701,23);

drop table Student_details;

show tables;

create table stud_2 as 
select ROLL_NO , NAME from Student_details;

select * from stud_2;

show databases;

use bookmanagementsystem;

show tables;

desc book;

select * from book;

use bank;

show tables;

select * from payments;



insert into payments
(customer_id , customer , mode , city)
values
(10 , 'charlie' , 'online' , 'Thane');

select customer from payments where customer is null;

alter table payments 
alter column customer
set default NULL;

insert into payments 
(customer_id , mode , city)
values
(111 , 'cash' , 'Pnavle'  );

select * from payments;














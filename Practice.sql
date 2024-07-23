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


use t201;

create table doctor(
did int primary key ,
dname varchar(20) ,
dphone varchar(20));

create table patient(
pid int primary key ,
pname varchar(20) ,
pphone varchar(20) ,
did int ,
constraint did_fk foreign key(did) references doctor(did));

desc doctor;
insert into doctor values 
(1 , "dr . raj" , "1234566789"),
(2 , "dr . rani" , "98765433210"),
(3 , "dr . amit" , "1234567890");

drop table patient;

desc patient;

insert into patient values
(11 , 'lalu' ,  "1234567890" , 1),
(22 , 'Jaggu' ,  "1234567890" , 1),
(33 , 'Mannu' ,  "1234567890" , 1),
(44 , 'Jaggu' ,  "1234567890" , 2),
(55 , 'pappu' , "1234567890" , null);

show tables;

drop table doctor;

create table doctor(
did int primary key ,
dname varchar(20) ,
dphone varchar(20));

insert into doctor values 
(1 , "dr . raj" , "1234566789"),
(2 , "dr . rani" , "98765433210"),
(3 , "dr . amit" , "1234567890");

create table patient(
pid int primary key ,
pname varchar(20) ,
pphone varchar(20) ,
did int ,
constraint did_fk foreign key(did) references doctor(did));

insert into patient values
(11 , 'lalu' ,  "1234567890" , 1),
(22 , 'Jaggu' ,  "1234567890" , 1),
(33 , 'Mannu' ,  "1234567890" , 1),
(44 , 'Jaggu' ,  "1234567890" , 2),
(55 , 'pappu' , "1234567890" , null);

select * from doctor;

select * from patient;

-- show me the patient name with doctor name who treated him/her
-- select column name from both tables
-- from table1
-- inner join table2
-- on table1.column_name = table2.column_name;

select pname as patient_name , dname as doctor_name
from doctor
inner join patient 
on doctor.did = patient.did;

-- show me all doctor whether they have treated a patient or not
select dname as doctor , pname as patient
from doctor 
left join patient
on doctor.did = patient.did;

--
select pname as patient , dname as doctor
from doctor
right join patient
on doctor.did = patient.did;

-- self join 
drop table employee;

create table emp(
id int primary key ,
name varchar(20) ,
phone varchar(20),
manager_id int);

insert into emp values 
(1 , "raj" , "123" , 2),
(2 , "rani" , "456" , 3),
(3 , "amit" , "789" , null);

select employee.id as employee_id , employee.name as employee_name ,
manager.name as manager_name
from emp employee inner join emp manager
on employee.manager_id = manager.id;


-- natural join
-- no need of ON while using natural join
select pname as patient , dname as doctor
from doctor
natural join patient;

select * from doctor natural join patient;

-- union => outer join
select d.dname as doctor , p.pname as patient
from doctor d left join patient p
on d.did = p.pid
union
select d.dname as doctor , p.pname as patient
from doctor d right join patient p
on d.did = p.pid;


desc doctor;

-- equi joins
create table sql_marks
(id int primary key ,
name varchar(20),
marks int);

create table java_marks
(id int primary key ,
name varchar(20),
marks int);

insert into sql_marks
(id , name , marks)
values
(1 , "raj" , 88),
(2 , 'rani' , 83),
(3 , 'anikat' , 85);

insert into java_marks
(id , name , marks)
values
(1 , "raj" , 78),
(2 , 'rani' , 73),
(3 , 'anikat' , 75);

select sql_marks.name , java_marks.name from sql_marks , java_marks 
where sql_marks.marks > java_marks.marks;

select sql_marks.name  from sql_marks , java_marks 
where sql_marks.marks > java_marks.marks or sql_marks.marks  = java_marks.marks;

drop table student;

create table student
(id int primary key ,
name varchar(20) ,
city varchar(20));

create table marks
(sid int ,
sql_makrs int ,
java_marks int ,
constraint sid_fk foreign key(sid) references student(id));








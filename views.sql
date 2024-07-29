use t201;

create table student
(id int primary key ,
name varchar(20) ,
city varchar(20));

create table marks
(sid int ,
sql_makrs int ,
java_marks int ,
constraint sid_fk foreign key(sid) references student(id));

select * from student;

select * from marks;

insert into student values
(1 , "raj" , "pune"),
(2 , "rani" , "pune"),
(3 , "amit" , "mumbai"),
(4 , "sumit" , "mumbai"),
(5 , "tejas" , "thane"),
(6 , "aarti" , "thane");

insert into marks values
(1 , 95 , 92),
(2 , 85 , 95) ,
(3 , 30 , 86) , 
(4 , 80 , 30) ,
(5 , 75 , 56) , 
(6 , 32 , 83);

-- create view with student name and their sql , java marks
create view student_marks as 
select id , name , sql_makrs , java_marks
from student , marks 
where student.id = marks.sid;

select * from student_marks;

select * from student_marks order by sql_makrs;

-- avg view with city wise avg sql marks
create view students_marks as
select city , sql_makrs
from student , marks
where student.id = marks.sid;


select * from students_marks;

select avg(sql_makrs) as avgMarks , city 
from students_marks
group by city;

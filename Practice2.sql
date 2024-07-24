use school;
show tables;

select * from stud_info;

select * from students;
desc students;

-- update query use to update data from table
update students 
set name = 'charlie' 
where id = 101;

SET SQL_SAFE_UPDATES = 0;

update students 
set class = 'Eleventh';

select * from students;

delete from students where name = 'charlie';

select * from students;

delete from students; -- delete all data from table

drop table students; -- to drop whole table with structure

--  aggregate function
select * from students where id = (select min(id) from students);

select * from students where id = (select max(id) from students);

select * from students;

-- alias 
select min(id) as minId from students; -- imp -> as always comes before table name

select max(id) as maxId from students ; 

-- group by
select count(id) as minId , blood_group from students group by blood_group;

-- count
select count(id) as minId , blood_group from students group by blood_group;

select count(distinct blood_group) from students;


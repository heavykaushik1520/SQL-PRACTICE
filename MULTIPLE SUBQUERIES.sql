use t201;

create table user(
uid int primary key ,
name varchar(20));

create table product(pid int primary key ,
name varchar(20) ,
price int);

create table orders(
oid int primary key ,
pid int ,
uid int ,
foreign key (pid) references product(pid) ,
foreign key (uid) references user(uid)
);

insert into user values (11 , 'raj') , (22 , 'aniket') , (33 , 'puja') , (44 , 'rupali');

insert into product values (1 , 'shirt' , 199) , (2 , 'mobile' , 1599) ;

insert into orders values (101 , 1 , 11) , (102 , 1 , 22) , (103 , 1 , 22 ) , (104 , 2 , 33) , (105 , 2 , 11);

select * from user ;

select * from product ;

select * from orders ;

select uid from user where name = 'raj';

-- order counts by raj
select count(oid) from orders where uid =  (select uid from user where name = 'raj');



select pid from product where name = 'shirt';


-- count order of shirt
select count(pid) from orders where pid = (select pid from product where name = 'shirt');



select uid from user;











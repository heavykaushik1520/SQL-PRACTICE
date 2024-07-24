use t201;

create table customers
(customer_id int primary key ,
name varchar(20) ,
amount float ,
mode varchar(20));

insert into customers
values
(1 , "raj" , 50 , "cash"),
(2 , "raju" , 60 , "online"),
(3 , "rajat" , 30 , "cash"),
(4 , "rani" , 90 , "card"),
(5 , "rutik" , 20 , "cash"),
(6 , "rupesh" , 50 , "card"),
(7 , "rakesh" , 50 , "online"),
(8 , "rupali" , 40 , "online");

select * from customers;

select amount , mode from customers group by mode;

select sum(amount) from customers group by mode; -- it cant give you appropriate output

select sum(amount) , mode from customers group by mode; -- best one

-- show total transaction according to mode greater than 2 transaction
select count(amount) , mode from customers group by mode having count(amount)>2; -- we use having instead of where and always use aggrigate fucntion with having


-- using order by , limit in group by
select count(amount) , mode from customers group by mode having count(amount)>2 order by mode desc limit 1;








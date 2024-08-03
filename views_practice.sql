show databases;
use practice;

show tables;

select * from products;

desc products;

-- 1 View: Product Names and Prices
create view BasicProductInfo
as 
select ProductName , Price 
from products;

CREATE VIEW BasicProductInfoo AS
SELECT ProductName, Price
FROM Products;


select * from BasicProductInfoo;

SELECT ProductName, Price
FROM Products;

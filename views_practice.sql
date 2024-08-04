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

-- 2 View: Products by Supplier
create view productBySailor
as select productName , supplierId
from Products;

-- 3 View: Products with Price Above 20
create view priceAbove20
as select productName
from products
where price > 20;

select * from priceAbove20;

-- 4 View: Products in Category 1
create view Cat1Product 
as select productName , categoryId 
from products
where categoryId = 1;

select * from Cat1Product;

-- 5 View: Supplier ID and Product Count
create view supplierAndProCount
as select supplierId , count(productId)
from products
group by SupplierId;

select * from supplierAndProCount;

-- 6 View: Products by Unit
create view ProductUnit as
select productName , unit
from products ;

select * from ProductUnit;

-- 7 View: Products in Category 2
create view Cat2Products
as select ProductName 
from products where categoryId = 2;

select * from Cat2Products;

-- View: Products by Price Range
create view PriceRange 
as select productName , price from 
products
order by price asc;

select * from priceRange;

-- view: View: Product Names and Categories
create view productNameCategory 
as select productName , CategoryId 
from products;

select * from productNameCategory;

-- View: Supplier IDs and Product Prices
create view SupplierIDsandProductPrices
as select SupplierId , Price 
from products ;

select * from SupplierIDsandProductPrices;

-- View: Products with Supplier Name
create view ProductswithSupplierName
as select p.productName , s.supplierName
from products p join suppliers s
on p.supplierId = s.supplierId;

select * from ProductswithSupplierName;

-- View: Products with Category Name
create view ProductswithCategoryName
as select ProductName , CategoryName
from products p join categories c
on
p.categoryId = c.categoryId;

select * from ProductswithCategoryName;

-- View: Products and Average Price by Category
create view ProductsandAveragePricebyCategoryyy
as select categoryId , avg(price) as AveragePrice
from products
group by categoryId;

select * from ProductsandAveragePricebyCategoryyy;

-- View: Supplier Product Count with Supplier Name
create view SupplierNamee
as select count(productId) as Supplier_Product , supplierName 
from products p join suppliers s
on p.supplierId = s.supplierId 
group by supplierName;

select  supplierName , Supplier_product from SupplierNamee;


desc  suppliers;

-- View: Products Above Average Price
create view ProductAboveAvgPrice
as select ProductName
from products
where price > (select avg(price) from products);

select * from ProductAboveAvgPrice;

-- View: Category-wise Total Product Price
create view CategoryWiseTotalProductPrice
as select CategoryId , sum(price) as TotalPrice
from products 
group by CategoryId;

select * from CategoryWiseTotalProductPrice;

-- View: Products with Supplier and Category Names
create view PSC as
select ProductName , SupplierName , CategoryName
from products p join suppliers s
on
p.supplierId = s.supplierId 
join
categories c
on
p.categoryId = c.categoryId;

select * from PSC;

-- View: Products Sold in Large Units (Units > 10)
create view productSoldInLargeUnit as
select productName from products where Unit > 10;

select * from productSoldInLargeUnit;

-- view Product Prices by Supplier
create view ProductPriceBySupplierr as
select productName , price , supplierName
from products p join suppliers s
on p.supplierId = s.supplierId;

select * from ProductPriceBySupplierr;

-- View: Products with Minimum Price per Category
create view minPrice as
select categoryName , min(price) as MinPrice
from products p join categories c
on p.categoryId = c.categoryId
group by categoryName;

-- View: Products with Maximum Price per Supplier
create view MaxPrice as
select SupplierName , max(price) as MaxPrice
from products p join suppliers s
on
p.supplierId = s.supplierId
group by SupplierName;

-- View: Products with Prices Below Supplier's Average
select avg(price) from products;

create view PriceBelowSupplierAvg as
select s.supplierName , p.price from
products p join suppliers s
on 
p.supplierId = s.supplierId
where p.price < (select avg(price) from products);

-- View: Product Price Changes (before and after discount)
create view PriceBeforeAfter as
select productName , price , price * 0.9 as AfterDiscount
from products;

-- View: Products by Supplier with Total and Average Price
create view TotalAndAvgPrice as
select supplierId , sum(price) as TotalPrice , avg(price) as avgPrice 
from products 
group by supplierId;

-- View: Products by Category with Supplier Name and Price Range
create view CategoryNameSupplierName as
select p.ProductName , c.categoryName , s.supplierName 
from products p 
join categories c
on p.categoryId = c.categoryId 
join suppliers s 
on p.supplierId = s.supplierId
where 
price between 20 and 30;

-- View: Products with Supplier and Category Information
create view InfoProductSupplierCategory as
select p.ProductName , c.categoryName , s.supplierName 
from products p 
join categories c
on p.categoryId = c.categoryId 
join suppliers s 
on p.supplierId = s.supplierId;

-- View: Supplier Product Details with High Price Alert
select * from products where price = (select max(price) from products);





























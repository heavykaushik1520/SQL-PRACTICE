use practice;

show tables;

select * from products;

-- Basic level Queries
-- Create a Procedure to Select All Products
call SelectAllProducts();

-- Create a Procedure to Insert a New Product
CALL InsertProduct(78, 'New Product', 25, 6, '20 - 1 kg tins', 29.99);

-- Create a Procedure to Update Product Price
call updatePrice(10 , 55.55);

select * from products;

-- Create a Procedure to Delete a Product
CALL DeleteProduct(1);


-- Create a Procedure to Count Total Products
call TotalCount();

-- Create a Procedure with Output Parameter to Find Maximum Price
call maxPrice();

-- Create a Procedure with Conditional Logic


-- Call the stored procedure
CALL checkProductPrice(9);

-- ------------------------------------------------------------------------------
-- Create a Procedure to Select Products by Category
call productsByCategory(1);


-- ------------------------------------------------------------------------------

-- Create a Procedure to Increase Product Prices by a Percentage
set sql_safe_updates = 0;
call IncreaseProductPrice(10);

select * from products;

-- -------------------------------------------------------------------------------
-- Create a Procedure with CASE Statement
call GetProductCategory(4);










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

-- ---------------------------------------------------------------------------------

-- Create a Procedure with WHILE Loop
call updatePriceWithLoop(5.0);

-- --------------------------------------------------------------------------------
-- Create a Procedure with TRY...CATCH for Error Handling
CALL SafeInsertProduct(79, 'Product A', 10, 2, 'Unit A', 99.99);


-- --------------------------------------------------------------------------------
-- Create a Procedure with Transaction Handling
-- Call the stored procedure
CALL TransferStock(1, 2, 10);


-- -------------------------------------------------------------------------------
-- Create a Procedure to Return a Value

call getTotalProduct();

-- -----------------------------------------------------------------------------
CREATE TABLE ProductLogs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    NewPrice DECIMAL(10, 2) NOT NULL,
    LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Create a Procedure with Nested Procedure Call
-- Call the stored procedure
CALL UpdateProductAndLog(79, 20.99);

select * from products;

-- ---------------------------------------------------------------------------------------
-- Create a Procedure to Get Products by Supplier
call GetProductsBySupplier(1);

-- --------------------------------------------------------------------------
-- Create a Procedure to Increase Prices Conditionally
call ConditionalPriceIncrease(3 , 2.00);

select * from Products where categoryId = 3;


-- --------------------------------------------------------------------------
-- Create a Procedure to Calculate Average Price by Category
CALL GetAveragePriceByCategory(1);























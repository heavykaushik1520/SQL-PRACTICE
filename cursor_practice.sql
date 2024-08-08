use practice;

-- Basic Cursor to Select All Products
call SelectAll();

-- 2. Cursor to Update Product Prices
call updateProductPriceWithCursor(1 , 2.5);

-- 3. Cursor to Select Products by Category
call SelectProductsByCategory(1);

-- 4. Cursor to Sum Prices by Supplier
set TotalPrice = 0;
call SumPriceBySupplier(2 , @TotalPrice);

select @TotalPrice as TotalPrice;
select * from products;

select sum(price) from products where supplierId = 2;

-- 5. Cursor to Delete Products by Category
call deleteByCat(1);

-- 6. Cursor to Find Products Below a Price
call selectProductBelowPrice(100.00); 

-- 7. Cursor to List Products from a Specific Supplier
call SelectProductBySupplierId(25);

-- 8. Cursor to Count Products in Each Category
call countProductInEachCategory();

-- 9. Cursor to Update Units of a Specific Category
select * from products where categoryId = 3;
CALL UpdateUnitsByCatId(3, '45 boxes ');

-- 10 Cursor to List Product Names in Alphabetical Order
call SelectProductAlphabetically();

-- 11 Cursor to Calculate Average Price by Category
call AvgPriceByCat(2);

select avg(price) from products where categoryId = 2;

-- 12  Cursor to List Products and Their Prices
call productsAndPrice();



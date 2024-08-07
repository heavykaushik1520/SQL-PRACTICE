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
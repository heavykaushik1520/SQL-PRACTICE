use practice;

show tables;


/*
	CREATE TRIGGER trigger_name    
    (AFTER | BEFORE) (INSERT | UPDATE | DELETE)  
         ON table_name FOR EACH ROW    
         BEGIN    
        --variable declarations    
        --trigger code    
        END;     

*/

drop table employee;

CREATE TABLE employee(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours varchar(10)  
);  

INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

select * from employee;

delimiter $$

create trigger before_insert_empworkinghours 
before insert on employee 
for each row 
begin 
	if new.working_hours < 0
		then set new.working_hours = 0;
	end if;
end$$

delimiter ;

INSERT INTO employee VALUES    
('Markus', 'Former', '2020-10-08', 14);  

insert into employee 
values
('Alexander', 'Actor', '2020-10-012', -13); 

show  triggers;

use practice;

-- Trigger on Insert - Automatically Set Product Price:

-- This trigger automatically sets the price to 10.00 if the inserted price is 0 or null.

delimiter $$
create trigger set_default_price 
before insert on product
for each row
begin
	IF NEW.Price IS NULL OR NEW.Price = 0 THEN
        SET NEW.Price = 10.00;
    END IF;
END $$
delimiter ;


-- Trigger on Update - Log Price Changes:

-- This trigger logs changes in the Price column into a separate table called PriceChanges.

delimiter $$


-- Trigger on Delete - Archive Product:

-- This trigger moves a product record to an ArchivedProducts table before it is deleted.

CREATE TABLE ArchivedProducts LIKE Products;

CREATE TRIGGER archive_product
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ArchivedProducts SELECT * FROM Products WHERE ProductID = OLD.ProductID;
END;


-- ----------------------------------------------------------------------------------------
-- Trigger on Insert - Ensure Unique Product Name:

-- This trigger prevents the insertion of a product with a duplicate ProductName.

CREATE TRIGGER unique_product_name
BEFORE INSERT ON Products
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM Products WHERE ProductName = NEW.ProductName) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate Product Name';
    END IF;
END;


-- --------------------------------------------------------------------------------------
-- Trigger on Update - Prevent Price Drop:
-- This trigger prevents the price of a product from being reduced by more than 10%.

create trigger prevent_large_price_drop 
before update on products
for each row 
begin 
	if NEW.price < OLD.price * 0.9 then 
		signal sqlstate '45000'
        set message_text = 'Price drop exceeds 10% limit';
	end if;
end;

-- ----------------------------------------------------------------------------------
-- Trigger on Insert - Calculate Total Cost (Price + Tax):

-- This trigger calculates a TotalCost that includes a 5% tax on the price and stores it in a new column.
DROP TABLE IF EXISTS ArchivedProducts;
alter table products add column TotalCost decimal(10 , 2);


-- ----------------------------------------------------------------------------------
-- Trigger on Update - Track Supplier Changes:
-- This trigger logs any changes to the SupplierID in a SupplierChanges table.
CREATE TABLE SupplierChanges (
    ChangeID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    OldSupplierID INT,
    NewSupplierID INT,
    ChangeDate DATETIME
);


select * from student_info;
 



	

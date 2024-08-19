use practice;

CREATE TABLE Bank (
    BankID INT AUTO_INCREMENT PRIMARY KEY,
    BankName VARCHAR(100) NOT NULL,
    HeadOfficeLocation VARCHAR(100),
    EstablishedYear YEAR,
    CEOName VARCHAR(100),
    TotalAssets DECIMAL(18,2)
);

CREATE TABLE Branch (
    BranchID INT AUTO_INCREMENT PRIMARY KEY,
    BankID INT,
    BranchName VARCHAR(100) NOT NULL,
    BranchLocation VARCHAR(100),
    ManagerName VARCHAR(100),
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (BankID) REFERENCES Bank(BankID)
);


INSERT INTO Bank (BankName, HeadOfficeLocation, EstablishedYear, CEOName, TotalAssets)
VALUES 
('National Bank', 'New York', 1975, 'John Doe', 100000000.00),
('Global Bank', 'London', 1980, 'Jane Smith', 150000000.00),
('Capital Bank', 'Sydney', 1985, 'Robert Brown', 200000000.00),
('Prime Bank', 'Tokyo', 1990, 'Emily White', 250000000.00),
('Unity Bank', 'Berlin', 1995, 'Michael Green', 300000000.00),
('Trust Bank', 'Paris', 2000, 'Linda Black', 350000000.00),
('Vision Bank', 'Toronto', 2005, 'William Scott', 400000000.00),
('Sunrise Bank', 'Dubai', 2010, 'Elizabeth King', 450000000.00),
('Silver Bank', 'Singapore', 2015, 'David Moore', 500000000.00),
('Pioneer Bank', 'San Francisco', 2020, 'Sophia Adams', 550000000.00),
('Centennial Bank', 'New York', 1970, 'George Clark', 120000000.00),
('Heritage Bank', 'London', 1983, 'Megan Harris', 160000000.00),
('Fortune Bank', 'Sydney', 1992, 'Anthony Wright', 220000000.00),
('Evergreen Bank', 'Tokyo', 1997, 'Jessica Turner', 260000000.00),
('Galaxy Bank', 'Berlin', 2002, 'Daniel Baker', 320000000.00),
('Liberty Bank', 'Paris', 2007, 'Amanda Carter', 370000000.00),
('Inspire Bank', 'Toronto', 2012, 'Matthew Wilson', 420000000.00),
('Infinity Bank', 'Dubai', 2017, 'Olivia Lewis', 470000000.00),
('Metro Bank', 'Singapore', 2022, 'James Hall', 520000000.00),
('Frontier Bank', 'San Francisco', 2025, 'Grace Young', 570000000.00);


INSERT INTO Branch (BankID, BranchName, BranchLocation, ManagerName, PhoneNumber)
VALUES 
(1, 'National Bank - Manhattan', 'New York', 'Chris Evans', '555-1234'),
(1, 'National Bank - Brooklyn', 'New York', 'Scarlett Johansson', '555-5678'),
(2, 'Global Bank - Soho', 'London', 'Tom Hiddleston', '555-2345'),
(2, 'Global Bank - Chelsea', 'London', 'Benedict Cumberbatch', '555-6789'),
(3, 'Capital Bank - Central', 'Sydney', 'Hugh Jackman', '555-3456'),
(3, 'Capital Bank - North', 'Sydney', 'Cate Blanchett', '555-7890'),
(4, 'Prime Bank - Shibuya', 'Tokyo', 'Ken Watanabe', '555-4567'),
(4, 'Prime Bank - Ginza', 'Tokyo', 'Rinko Kikuchi', '555-8901'),
(5, 'Unity Bank - Mitte', 'Berlin', 'Diane Kruger', '555-5678'),
(5, 'Unity Bank - Kreuzberg', 'Berlin', 'Til Schweiger', '555-9012'),
(6, 'Trust Bank - Champs-Elysees', 'Paris', 'Marion Cotillard', '555-6789'),
(6, 'Trust Bank - Montmartre', 'Paris', 'Vincent Cassel', '555-0123'),
(7, 'Vision Bank - Downtown', 'Toronto', 'Ryan Reynolds', '555-7890'),
(7, 'Vision Bank - Uptown', 'Toronto', 'Rachel McAdams', '555-1234'),
(8, 'Sunrise Bank - Business Bay', 'Dubai', 'Omar Sharif', '555-8901'),
(8, 'Sunrise Bank - Deira', 'Dubai', 'Nadine Labaki', '555-2345'),
(9, 'Silver Bank - Orchard', 'Singapore', 'Michelle Yeoh', '555-9012'),
(9, 'Silver Bank - Raffles', 'Singapore', 'Henry Golding', '555-3456'),
(10, 'Pioneer Bank - Market Street', 'San Francisco', 'Brie Larson', '555-0123'),
(10, 'Pioneer Bank - Mission', 'San Francisco', 'Chris Pratt', '555-4567');


-- --------------------------------------------------------------------------------------
-- views 
-- Create a basic view to show Bank Names and their Head Office Locations:
create view BankNamesHeadOffice as
select BankName , HeadOfficeLocation from Bank;

-- Create a view to show branches in New York:
create view branchInNewYork as
select BranchName from Branch 
where BranchLocation = "New York";

-- Create a view to show Banks established after 2000:
create view BankEstablish as
select BankName , EstablishedYear from Bank
where EstablishedYear > 2000;

-- Create a view to show the total number of branches per bank:
create view BranchCountPerBank as
select BankName as BankName , count(branchName) as TotalCount
from Bank bk join Branch br
on
bk.BankId = br.bankId
group by bk.BankName;

-- Create a view to show Bank names along with their Branch names:
create view BankBranch as
select BankName , BranchName 
from Bank bk join Branch br
on
bk.BankId = br.bankId;

-- Query to retrieve data from a view:
select * from BankBranch;

-- 7 .Update a view to include CEO Name in BankHeadOffices:



-- 8 Drop view
drop view if exists BankEstablish;

-- Create a view that shows branch details for a specific bank using a parameter:
create view BranchDetailsForSpecificBank as
select * from branch 
where bankId = (select BankId from bank where BankName = "Prime Bank");

-- -----------------------------------------------------------------------------

-- Procedure 
CALL AddNewBank('BankName', 'HeadOfficeLocation', 2023, 'CEOName', 15000000.00);

CALL AddNewBank('National Bank', 'New York', 1985, 'John Doe', 300000000.00);

select * from bank;

-- ---------------------------------------
-- Create a procedure to delete a bank by its ID:
call DeleteById(22);


-- Create a procedure to update a bank's CEO name:
call updateCeoName(2 , "Kaushik");

-- Create a procedure to get branch details by bank name:
CALL GetBranchDetails('National Bank');


-- Create a procedure to transfer a branch to another bank:
call TransferBranch(1 , 5);

-- Call a procedure to insert a new bank:
CALL AddNewBank('Future Bank', 'Miami', 2024, 'Emma Stone', 600000000.00);


-- Create a procedure to calculate the total assets of all banks:
set @total_assets = 0;
call calculateTotalAssets(@total_assets);
select @total_assets;

-- Create a procedure to insert a new branch:
call insertNewBranch(10, 'National Bank - Mission', 'Devrukh', 'Chris Pratt', '556-4567');
select * from branch;

-- Call a procedure to get branch details by bank name:
call getBranchDetails("Prime Bank");

-- -----------------------------------------------------------------------------------------
-- Cursor
-- Create a procedure using a cursor to list all banks:
call ListAllBank();

-- Create a procedure using a cursor to update the total assets for all banks by 10%:
call UpdateAssets();

select * from Bank;

-- Create a procedure using a cursor to calculate the average assets for banks established after 2000:
set @assets = 0;
call AvgAssetsAfter2000(@assets);

select @assets;

-- Create a procedure using a cursor to list all branches for a specific bank:
call ListBranchesForBank(1);

-- Create a procedure using a cursor to increase the assets of banks with more than 3 branches by 5%:
call IncreaseAssetsForLargeBank();





 






















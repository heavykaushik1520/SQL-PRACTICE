use school;

show tables;

select * from stud_info;

select * from students;
desc students;

-- update query use to update data from table
update students 
set name = 'charlie' 
where id = 101;

SET SQL_SAFE_UPDATES = 0;

update students 
set class = 'Eleventh';

select * from students;

delete from students where name = 'charlie';

select * from students;

delete from students; -- delete all data from table

drop table students; -- to drop whole table with structure

--  aggregate function
select * from students where id = (select min(id) from students);

select * from students where id = (select max(id) from students);

select * from students;

-- alias 
select min(id) as minId from students; -- imp -> as always comes before table name

select max(id) as maxId from students ; 

-- group by
select count(id) as minId , blood_group from students group by blood_group;

-- count
select count(id) as minId , blood_group from students group by blood_group;

select count(distinct blood_group) from students;

-- sum()
select sum(id) from students;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    SupplierID INT,
    CategoryID INT,
    Unit VARCHAR(255),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price) VALUES
(1, 'Chais', 1, 1, '10 boxes x 20 bags', 18.00),
(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19.00),
(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00),
(4, 'Chef Anton\'s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00),
(5, 'Chef Anton\'s Gumbo Mix', 2, 2, '36 boxes', 21.35);

SELECT AVG(Price)
FROM Products
WHERE CategoryID = 1;

select avg(price) as average_price
from products;

select * from Products where price > (select avg(price) from products);

select avg(price) as averagePrice , CategoryID from Products group by CategoryID;

select * from Products where ProductName like 'c%';

select * from Products where ProductName like 'c%' or ProductName like 'a%';

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Major VARCHAR(100),
    GPA DECIMAL(3, 2),
    EnrollmentDate DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

INSERT INTO Student (StudentID, FirstName, LastName, Age, Gender, Major, GPA, EnrollmentDate, Email, PhoneNumber) VALUES
(1, 'John', 'Doe', 20, 'M', 'Computer Science', 3.5, '2022-09-01', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 22, 'F', 'Mathematics', 3.8, '2021-09-01', 'jane.smith@example.com', '123-456-7891'),
(3, 'Alice', 'Johnson', 21, 'F', 'Physics', 3.7, '2021-09-01', 'alice.johnson@example.com', '123-456-7892'),
(4, 'Bob', 'Brown', 23, 'M', 'Chemistry', 3.2, '2020-09-01', 'bob.brown@example.com', '123-456-7893'),
(5, 'Charlie', 'Davis', 19, 'M', 'Biology', 3.6, '2023-09-01', 'charlie.davis@example.com', '123-456-7894'),
(6, 'Diana', 'Miller', 22, 'F', 'English', 3.9, '2021-09-01', 'diana.miller@example.com', '123-456-7895'),
(7, 'Eve', 'Wilson', 20, 'F', 'History', 3.4, '2022-09-01', 'eve.wilson@example.com', '123-456-7896'),
(8, 'Frank', 'Moore', 24, 'M', 'Philosophy', 3.1, '2019-09-01', 'frank.moore@example.com', '123-456-7897'),
(9, 'Grace', 'Taylor', 21, 'F', 'Sociology', 3.7, '2021-09-01', 'grace.taylor@example.com', '123-456-7898'),
(10, 'Hank', 'Anderson', 23, 'M', 'Political Science', 3.3, '2020-09-01', 'hank.anderson@example.com', '123-456-7899'),
(11, 'Ivy', 'Thomas', 20, 'F', 'Art', 3.5, '2022-09-01', 'ivy.thomas@example.com', '123-456-7900'),
(12, 'Jack', 'Jackson', 19, 'M', 'Music', 3.6, '2023-09-01', 'jack.jackson@example.com', '123-456-7901'),
(13, 'Karen', 'White', 22, 'F', 'Business', 3.8, '2021-09-01', 'karen.white@example.com', '123-456-7902'),
(14, 'Leo', 'Harris', 21, 'M', 'Economics', 3.7, '2021-09-01', 'leo.harris@example.com', '123-456-7903'),
(15, 'Mia', 'Clark', 20, 'F', 'Psychology', 3.9, '2022-09-01', 'mia.clark@example.com', '123-456-7904'),
(16, 'Noah', 'Lewis', 19, 'M', 'Engineering', 3.5, '2023-09-01', 'noah.lewis@example.com', '123-456-7905'),
(17, 'Olivia', 'Walker', 22, 'F', 'Nursing', 3.8, '2021-09-01', 'olivia.walker@example.com', '123-456-7906'),
(18, 'Paul', 'Hall', 23, 'M', 'Architecture', 3.2, '2020-09-01', 'paul.hall@example.com', '123-456-7907'),
(19, 'Quinn', 'Young', 21, 'F', 'Education', 3.7, '2021-09-01', 'quinn.young@example.com', '123-456-7908'),
(20, 'Ryan', 'King', 24, 'M', 'Environmental Science', 3.4, '2019-09-01', 'ryan.king@example.com', '123-456-7909');

select * from student;

select * from student where major in('Mathematics' , 'physics' , 'chemistry');

select * from student where major not in('Mathematics' , 'physics');

-- between 
select * from student where studentId between 1 and 10 ;

select * from student where studentId not between 1 and 10;

select * from student where studentId between 1 and 10 AND major in('Mathematics' , 'Physics');

select count(studentid) ,gpa  from student group by gpa;

select * from student where studentId between 2 and 12 order by studentId desc;

select * from student where EnrollMentDate between '2022-09-01' and '2023-09-01' ;

-- alias
select firstname from student where StudentId in (select studentId from student) ;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

INSERT INTO 
Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country) 
VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden'),
(6, 'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany'),
(7, 'Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France'),
(8, 'Bólido Comidas preparadas', 'Martín Sommer', 'C/ Araquil, 67', 'Madrid', '28023', 'Spain'),
(9, 'Bon app''', 'Laurence Lebihans', '12, rue des Bouchers', 'Marseille', '13008', 'France'),
(10, 'Bottom-Dollar Marketse', 'Elizabeth Lincoln', '23 Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada'),
(11, 'B''s Beverages', 'Victoria Ashworth', 'Fauntleroy Circus', 'London', 'EC2 5NT', 'UK'),
(12, 'Cactus Comidas para llevar', 'Patricio Simpson', 'Cerrito 333', 'Buenos Aires', '1010', 'Argentina'),
(13, 'Centro comercial Moctezuma', 'Francisco Chang', 'Sierras de Granada 9993', 'México D.F.', '05022', 'Mexico'),
(14, 'Chop-suey Chinese', 'Yang Wang', 'Hauptstr. 29', 'Bern', '3012', 'Switzerland'),
(15, 'Comércio Mineiro', 'Pedro Afonso', 'Av. dos Lusíadas, 23', 'São Paulo', '05432-043', 'Brazil'),
(16, 'Consolidated Holdings', 'Elizabeth Brown', 'Berkeley Gardens 12 Brewery', 'London', 'WX1 6LT', 'UK'),
(17, 'Drachenblut Delikatessend', 'Sven Ottlieb', 'Walserweg 21', 'Aachen', '52066', 'Germany'),
(18, 'Du monde entier', 'Janine Labrune', '67, rue des Cinquante Otages', 'Nantes', '44000', 'France'),
(19, 'Eastern Connection', 'Ann Devon', '35 King George', 'London', 'WX3 6FW', 'UK'),
(20, 'Ernst Handel', 'Roland Mendel', 'Kirchgasse 6', 'Graz', '8010', 'Austria'),
(21, 'Familia Arquibaldo', 'Aria Cruz', 'Rua Orós, 92', 'São Paulo', '05442-030', 'Brazil'),
(22, 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'C/ Moralzarzal, 86', 'Madrid', '28034', 'Spain'),
(23, 'Folies gourmandes', 'Martine Rancé', '184, chaussée de Tournai', 'Lille', '59000', 'France'),
(24, 'Folk och fä HB', 'Maria Larsson', 'Åkergatan 24', 'Bräcke', 'S-844 67', 'Sweden'),
(25, 'Frankenversand', 'Peter Franken', 'Berliner Platz 43', 'München', '80805', 'Germany'),
(26, 'France restauration', 'Carine Schmitt', '54, rue Royale', 'Nantes', '44000', 'France'),
(27, 'Franchi S.p.A.', 'Paolo Accorti', 'Via Monte Bianco 34', 'Torino', '10100', 'Italy'),
(28, 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Jardim das rosas n. 32', 'Lisboa', '1675', 'Portugal'),
(29, 'Galería del gastrónomo', 'Eduardo Saavedra', 'Rambla de Cataluña, 23', 'Barcelona', '08022', 'Spain'),
(30, 'Godos Cocina Típica', 'José Pedro Freyre', 'C/ Romero, 33', 'Sevilla', '41101', 'Spain'),
(31, 'Gourmet Lanchonetes', 'André Fonseca', 'Av. Brasil, 442', 'Campinas', '04876-786', 'Brazil'),
(32, 'Great Lakes Food Market', 'Howard Snyder', '2732 Baker Blvd.', 'Eugene', '97403', 'USA'),
(33, 'GROSELLA-Restaurante', 'Manuel Pereira', '5ª Ave. Los Palos Grandes', 'Caracas', '1081', 'Venezuela'),
(34, 'Hanari Carnes', 'Mario Pontes', 'Rua do Paço, 67', 'Rio de Janeiro', '05454-876', 'Brazil'),
(35, 'HILARIÓN-Abastos', 'Carlos Hernández', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', '5022', 'Venezuela'),
(36, 'Hungry Coyote Import Store', 'Yoshi Latimer', 'City Center Plaza 516 Main St.', 'Elgin', '97827', 'USA'),
(37, 'Hungry Owl All-Night Grocers', 'Patricia McKenna', '8 Johnstown Road', 'Cork', '', 'Ireland'),
(38, 'Island Trading', 'Helen Bennett', 'Garden House Crowther Way', 'Cowes', 'PO31 7PJ', 'UK'),
(39, 'Königlich Essen', 'Philip Cramer', 'Maubelstr. 90', 'Brandenburg', '14776', 'Germany'),
(40, 'La corne d''abondance', 'Daniel Tonini', '67, avenue de l''Europe', 'Versailles', '78000', 'France'),
(41, 'La maison d''Asie', 'Annette Roulet', '1 rue Alsace-Lorraine', 'Toulouse', '31000', 'France'),
(42, 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', '1900 Oak St.', 'Vancouver', 'V3F 2K1', 'Canada'),
(43, 'Lazy K Kountry Store', 'John Steel', '12 Orchestra Terrace', 'Walla Walla', '99362', 'USA'),
(44, 'Lehmanns Marktstand', 'Renate Messner', 'Magazinweg 7', 'Frankfurt a.M.', '60528', 'Germany'),
(45, 'Let''s Stop N Shop', 'Jaime Yorres', '87 Polk St. Suite 5', 'San Francisco', '94117', 'USA'),
(46, 'LILA-Supermercado', 'Carlos González', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', '3508', 'Venezuela'),
(47, 'LINO-Delicateses', 'Felipe Izquierdo', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', '4980', 'Venezuela'),
(48, 'Lonesome Pine Restaurant', 'Fran Wilson', '89 Chiaroscuro Rd.', 'Portland', '97219', 'USA'),
(49, 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Via Ludovico il Moro 22', 'Bergamo', '24100', 'Italy'),
(50, 'Maison Dewey', 'Catherine Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', 'B-1180', 'Belgium'),
(51, 'Mère Paillarde', 'Jean Fresnière', '43 rue St. Laurent', 'Montréal', 'H1J 1C3', 'Canada'),
(52, 'Morgenstern Gesundkost', 'Alexander Feuer', 'Heerstr. 22', 'Leipzig', '04179', 'Germany'),
(53, 'North/South', 'Simon Crowther', 'South House 300 Queensbridge', 'London', 'SW7 1RZ', 'UK'),
(54, 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', '1010', 'Argentina'),
(55, 'Old World Delicatessen', 'Rene Phillips', '2743 Bering St.', 'Anchorage', '99508', 'USA'),
(56, 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Mehrheimerstr. 369', 'Köln', '50739', 'Germany'),
(57, 'Paris spécialités', 'Marie Bertrand', '265, boulevard Charonne', 'Paris', '75012', 'France'),
(58, 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Calle Dr. Jorge Cash 321', 'México D.F.', '05033', 'Mexico'),
(59, 'Piccolo und mehr', 'Georg Pipps', 'Geislweg 14', 'Salzburg', '5020', 'Austria'),
(60, 'Princesa Isabel Vinhoss', 'Isabel de Castro', 'Estrada da saúde n. 58', 'Lisboa', '1756', 'Portugal'),
(61, 'Que Delícia', 'Bernardo Batista', 'Rua da Panificadora, 12', 'Rio de Janeiro', '02389-673', 'Brazil'),
(62, 'Queen Cozinha', 'Lúcia Carvalho', 'Alameda dos Canàrios, 891', 'São Paulo', '05487-020', 'Brazil'),
(63, 'QUICK-Stop', 'Horst Kloss', 'Taucherstraße 10', 'Cunewalde', '01307', 'Germany'),
(64, 'Rancho grande', 'Sergio Gutiérrez', 'Av. del Libertador 900', 'Buenos Aires', '1010', 'Argentina'),
(65, 'Rattlesnake Canyon Grocery', 'Paula Wilson', '2817 Milton Dr.', 'Albuquerque', '87110', 'USA'),
(66, 'Reggiani Caseifici', 'Maurizio Moroni', 'Strada Provinciale 124', 'Reggio Emilia', '42100', 'Italy'),
(67, 'Ricardo Adocicados', 'Janete Limeira', 'Av. Copacabana, 267', 'Rio de Janeiro', '02389-890', 'Brazil'),
(68, 'Richter Supermarkt', 'Michael Holz', 'Grenzacherweg 237', 'Genève', '1203', 'Switzerland'),
(69, 'Romero y tomillo', 'Alejandra Camino', 'Gran Vía, 1', 'Madrid', '28001', 'Spain'),
(70, 'Santé Gourmet', 'Jonas Bergulfsen', 'Erling Skakkes gate 78', 'Stavern', '4110', 'Norway'),
(71, 'Save-a-lot Markets', 'Jose Pavarotti', '187 Suffolk Ln.', 'Boise', '83720', 'USA'),
(72, 'Seven Seas Imports', 'Hari Kumar', '90 Wadhurst Rd.', 'London', 'OX15 4NB', 'UK'),
(73, 'Simons bistro', 'Jytte Petersen', 'Vinbæltet 34', 'København', '1734', 'Denmark'),
(74, 'Spécialités du monde', 'Dominique Perrier', '25, rue Lauriston', 'Paris', '75016', 'France'),
(75, 'Split Rail Beer & Ale', 'Art Braunschweiger', 'P.O. Box 555', 'Lander', '82520', 'USA'),
(76, 'Suprêmes délices', 'Pascale Cartrain', 'Boulevard Tirou, 255', 'Charleroi', 'B-6000', 'Belgium'),
(77, 'The Big Cheese', 'Liz Nixon', '89 Jefferson Way Suite 2', 'Portland', '97201', 'USA'),
(78, 'The Cracker Box', 'Liu Wong', '55 Grizzly Peak Rd.', 'Butte', '59801', 'USA'),
(79, 'Toms Spezialitäten', 'Karin Josephs', 'Luisenstr. 48', 'Münster', '44087', 'Germany'),
(80, 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Avda. Azteca 123', 'México D.F.', '05033', 'Mexico'),
(81, 'Tradição Hipermercados', 'Anabela Domingues', 'Av. Inês de Castro, 414', 'São Paulo', '05634-030', 'Brazil'),
(82, 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', '722 DaVinci Blvd.', 'Kirkland', '98034', 'USA'),
(83, 'Vaffeljernet', 'Palle Ibsen', 'Smagsløget 45', 'Århus', '8200', 'Denmark'),
(84, 'Victuailles en stock', 'Mary Saveley', '2, rue du Commerce', 'Lyon', '69004', 'France'),
(85, 'Vins et alcools Chevalier', 'Paul Henriot', '59 rue de l''Abbaye', 'Reims', '51100', 'France'),
(86, 'Die Wandernde Kuh', 'Rita Müller', 'Adenauerallee 900', 'Stuttgart', '70563', 'Germany'),
(87, 'Wartian Herkku', 'Pirkko Koskitalo', 'Torikatu 38', 'Oulu', '90110', 'Finland'),
(88, 'Wellington Importadora', 'Paula Parente', 'Rua do Mercado, 12', 'Resende', '08737-363', 'Brazil'),
(89, 'White Clover Markets', 'Karl Jablonski', '305 - 14th Ave. S. Suite 3B', 'Seattle', '98128', 'USA'),
(90, 'Wilman Kala', 'Matti Karttunen', 'Keskuskatu 45', 'Helsinki', '21240', 'Finland'),
(91, 'Wolski', 'Zbyszek', 'ul. Filtrowa 68', 'Walla', '01-012', 'Poland');

select * from customers;



show tables;

show databases;

use practice;

-- The following SQL statement lists the number of customers in each country:
select count(customerId) , country 
from customers 
group by country
order by count(country) desc
limit 1;

-- The following SQL statement lists the number of customers in each country, sorted high to low:
select count(customerId) , country
from customers
group by country
order by count(customerid)
desc;

-- creating order table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShipperID INT
);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID) VALUES
(10248, 90, 5, '1996-07-04', 3),
(10249, 81, 6, '1996-07-05', 1),
(10250, 34, 4, '1996-07-08', 2),
(10251, 84, 3, '1996-07-08', 1),
(10252, 76, 4, '1996-07-09', 2),
(10253, 34, 3, '1996-07-10', 2),
(10254, 14, 5, '1996-07-11', 2),
(10255, 68, 9, '1996-07-12', 3),
(10256, 88, 3, '1996-07-15', 2),
(10257, 35, 4, '1996-07-16', 3),
(10258, 20, 1, '1996-07-17', 1),
(10259, 13, 4, '1996-07-18', 3),
(10260, 55, 4, '1996-07-19', 1),
(10261, 61, 4, '1996-07-19', 2),
(10262, 65, 8, '1996-07-22', 3),
(10263, 20, 9, '1996-07-23', 3),
(10264, 24, 6, '1996-07-24', 3),
(10265, 7, 2, '1996-07-25', 1),
(10266, 87, 3, '1996-07-26', 3),
(10267, 25, 4, '1996-07-29', 1),
(10268, 33, 8, '1996-07-30', 3),
(10269, 89, 5, '1996-07-31', 1),
(10270, 87, 1, '1996-08-01', 1),
(10271, 75, 6, '1996-08-01', 2),
(10272, 65, 6, '1996-08-02', 2),
(10273, 63, 3, '1996-08-05', 3),
(10274, 85, 6, '1996-08-06', 1),
(10275, 49, 1, '1996-08-07', 1),
(10276, 80, 8, '1996-08-08', 3),
(10277, 52, 2, '1996-08-09', 3),
(10278, 5, 8, '1996-08-12', 2),
(10279, 44, 8, '1996-08-13', 2),
(10280, 5, 2, '1996-08-14', 1),
(10281, 69, 4, '1996-08-14', 1),
(10282, 69, 4, '1996-08-15', 1),
(10283, 46, 3, '1996-08-16', 3),
(10284, 44, 4, '1996-08-19', 1),
(10285, 63, 1, '1996-08-20', 2),
(10286, 63, 8, '1996-08-21', 3),
(10287, 67, 8, '1996-08-22', 3),
(10288, 66, 4, '1996-08-23', 1),
(10289, 11, 7, '1996-08-26', 3),
(10290, 15, 8, '1996-08-27', 1),
(10291, 61, 6, '1996-08-27', 2),
(10292, 81, 1, '1996-08-28', 2),
(10293, 80, 1, '1996-08-29', 3),
(10294, 65, 4, '1996-08-30', 2),
(10295, 85, 2, '1996-09-02', 2),
(10296, 46, 6, '1996-09-03', 1),
(10297, 7, 5, '1996-09-04', 2),
(10298, 37, 6, '1996-09-05', 2),
(10299, 67, 4, '1996-09-06', 2),
(10300, 49, 2, '1996-09-09', 2),
(10301, 86, 8, '1996-09-09', 2),
(10302, 76, 4, '1996-09-10', 2),
(10303, 30, 7, '1996-09-11', 2),
(10304, 80, 1, '1996-09-12', 2),
(10305, 55, 8, '1996-09-13', 3),
(10306, 69, 1, '1996-09-16', 3),
(10307, 48, 2, '1996-09-17', 2),
(10308, 2, 7, '1996-09-18', 3),
(10309, 37, 3, '1996-09-19', 1),
(10310, 77, 8, '1996-09-20', 2),
(10311, 18, 1, '1996-09-20', 3),
(10312, 86, 2, '1996-09-23', 2),
(10313, 63, 2, '1996-09-24', 2),
(10314, 65, 1, '1996-09-25', 2),
(10315, 38, 4, '1996-09-26', 2),
(10316, 65, 1, '1996-09-27', 3),
(10317, 48, 6, '1996-09-30', 1),
(10318, 38, 8, '1996-10-01', 2),
(10319, 80, 7, '1996-10-02', 3),
(10320, 87, 5, '1996-10-03', 3),
(10321, 38, 3, '1996-10-03', 2),
(10322, 58, 7, '1996-10-04', 3),
(10323, 39, 4, '1996-10-07', 1),
(10324, 71, 9, '1996-10-08', 1),
(10325, 39, 1, '1996-10-09', 3),
(10326, 8, 4, '1996-10-10', 2),
(10327, 24, 2, '1996-10-11', 1),
(10328, 28, 4, '1996-10-14', 3),
(10329, 75, 4, '1996-10-15', 2),
(10330, 46, 3, '1996-10-16', 1),
(10331, 9, 9, '1996-10-16', 1),
(10332, 51, 3, '1996-10-17', 2),
(10333, 87, 5, '1996-10-18', 3),
(10334, 84, 8, '1996-10-21', 2),
(10335, 37, 7, '1996-10-22', 2);

select * from orders;

-- The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers:
select count(customerId) , country
from customers 
group by country

having count(customerId) > 5
order by count(customerId) desc ;

-- PRACTICE QUESTION

--  1 Select all columns for all customers:
select * from Customers;

-- 2 Select only the CustomerName and City columns:
select Customername , city from Customers;

-- 3 Select customers from Germany:
select * from Customers where country = 'Germany';

-- 4 Count the number of customers in the table:
select count(customerId) from customers;

-- 5 Find the distinct cities in the table:
select distinct city from customers;

-- 6 Select customers with PostalCode starting with '05':
select * from Customers where PostalCode like '05%';

-- 7 Select customers in ascending order of CustomerName:
select customerName from customers order by CustomerName;

-- 8 Find the number of customers in each country:
select count(customerId) as number_of_customres , country 
from customers 
group by country;

-- 9 select first five customers
select * from customers limit 5;

-- 10 Select the last 5 customers in reverse order:
select * from Customers 
order by CustomerId
desc limit 5;

-- 11 Find customers who live in the same city as 'Alfreds Futterkiste':
select city from customers where customerName = 'Alfreds Futterkiste';
select * from customers 
where city = (select city from customers where customerName = 'Alfreds Futterkiste');

select * from customers where city = 'berlin';

-- 12 Update the city of 'Ernst Handel' to 'Vienna':
SET SQL_SAFE_UPDATES = 0;
update customers set city = 'Vienna' where city = 'Ernst Handel';

-- 13 Delete the customer 'Centro comercial Moctezuma':
delete from customers where customername = 'Centro comercial Moctezuma';

-- 14 Select customers from cities starting with 'M':
select * from customers where city like 'M%';

-- 15 Find customers with 'de' in their CustomerName:
select * from customers where customername like '%de%';

-- 16 Select customers and replace 'UK' with 'United Kingdom' in the result:
update customers set country = 'United Kingdom' where country = 'UK';

SELECT CustomerID, CustomerName, ContactName, Address, City, PostalCode, 
CASE WHEN Country = 'UK' THEN 'United Kingdom' ELSE Country END AS Country
FROM Customers;

-- 17 Find customers with postal codes containing '1':
select * from customers where postalcode like '%1%';

-- 18 Select customers whose contact name is not null:
desc customers;
select * from customers where contactName is not null;

-- 19 Select all customers but display City in upper case:
select 
CustomerID, CustomerName, ContactName, Address, upper(city) as city ,PostalCode, Country 
from customers ;

-- 20 Select the CustomerName and Country of the first 10 customers ordered by CustomerID:
select CustomerName, Country from customers 
order by customerId 
limit 10;

-- 21 Select customers who are in the same country as 'The Big Cheese':
select country from customers where customerName = 'The Big Cheese';

select * from customers
where country = (select country from customers where customerName = 'The Big Cheese') ;

-- 22 Count the number of unique cities in each country:
select count(distinct city) as uniqueCity 
from customers 
group by country;

-- 23 Select customers whose names contain exactly 15 characters:
select * from customers where length(customerName) = 15 ;

-- 24 Find the average length of CustomerName for customers in 'USA':
select avg(length(Customername)) as avgLength from customers where country = 'usa';

-- 25 Select customers who have the same contact name as their customer name:
select * from customers where customerName = contactname;

-- 26 Find the second most common country:
select count(customerId) , country from customers
group by country 
order by count(customerId) desc
limit 1
offset 1;

-- 27 Find customers with no postal code:
select * from customers where postalcode is null;

-- 28 Select customers whose address contains the word 'Avenue':
select * from customers where address like '%avenue%';

-- 30 Find customers whose city ends with the letter 'e':
select * from customers where city like '%e';

-- 31 Find customers who live in the same postal code as 'Ana Trujillo Emparedados y helados':
select * from customers 
where postalCode = (select postalCode from customers where customerName = 'Ana Trujillo Emparedados y helados');

-- 32 Select customers who live in cities that appear more than once:
select count(customerId) , city from customers
group by city
having count(customerId) > 1;

select * from customers where city in (select city from customers
group by city
having count(customerId) > 1);

-- 33 Select customers and display their PostalCode in reverse order:
select * from customers order by postalcode desc;

-- 35 Select customers whose CustomerName is the same when reversed:
select * from customers where customername = reverse(customername);


-- 36 Find customers in countries with exactly 6 characters:
select * from customer where length(country) = 6;

-- 37 Select customers with 'A' as the second letter in their CustomerName:
select * from customers where customername like '_a%';

-- 38 Find the longest CustomerName:
select max(length(customerName)) from customers;

select * from customers where length(customerName) = (select max(length(customerName)) from customers);

-- 39 Select customers whose ContactName contains a hyphen ('-'):
select * from customers where contactname like '%-%';

-- 26 / 07 / 2024
use practice;

show tables;

create table user(
uid int primary key ,
name varchar(20));

create table product(pid int primary key ,
name varchar(20) ,
price int);

create table ordered(
oid int primary key ,
pid int ,
uid int ,
foreign key (pid) references product(pid) ,
foreign key (uid) references user(uid)
);

-- Inserting data into the user table
INSERT INTO user (uid, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eve'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Hannah'),
(9, 'Ivy'),
(10, 'Jack'),
(11, 'Ken'),
(12, 'Liam'),
(13, 'Mona'),
(14, 'Nina'),
(15, 'Oscar');

-- Inserting data into the product table
INSERT INTO product (pid, name, price) VALUES
(1, 'Laptop', 1000),
(2, 'Smartphone', 500),
(3, 'Tablet', 300),
(4, 'Monitor', 150),
(5, 'Keyboard', 50),
(6, 'Mouse', 25),
(7, 'Printer', 200),
(8, 'Camera', 600),
(9, 'Speaker', 100),
(10, 'Headphones', 75),
(11, 'Microphone', 120),
(12, 'Charger', 20),
(13, 'Hard Drive', 80),
(14, 'SSD', 150),
(15, 'RAM', 90);

-- Inserting data into the orders table
INSERT INTO ordered (oid, pid, uid) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15);

-- 1 Select all users
select * from user;

-- 2 Select all products
select * from product;

-- select all ordered
select * from ordered;

-- 4 SELECT name FROM user;
select name from user;

-- 5 Select the name and price of all products
select name , price from product;

-- 6 Select user names and corresponding order IDs
select name from user where uid in (select uid from ordered);

-- 8 Select orders where user ID is 1
select * from ordered where uid = 1;

-- 9 select products price greater than 100
select * from product where price > 100 ;

-- 10 Count the number of users
select count(*) from user;

-- 11 find the average price of product
select avg(price) from product;

-- 12 Find the total number of orders
select count(oid) from ordered;

-- 13 Find the user who has made the most orders
select count(oid) ,uid from ordered
group by uid
order by count(oid) desc
limit 1;

-- 14 Find the product with the highest price
select max(price) from product;
select name from product where price =(select max(price) from product);

select * from product 
order by price 
desc limit 1;

-- 15 Find the product with the lowest price
select * from product order by price limit 1;

-- 16 Select the names of users who have placed an order
select uid from ordered;

select name from user where uid in (select uid from ordered);

-- 17 Select the names of products that have been ordered
select pid from ordered;
select name from product where pid in (select pid from ordered);

-- 18 Select the names and prices of products ordered by user ID 1
select pid from ordered where uid = 1;
select name, price from product where pid = (select pid from ordered where uid = 1);



-- 19 Select the order IDs and corresponding user names where product ID is 2
select pid from product where pid = 2;

-- 27 Find the order that contains the maximum number of products
select count(pid) , oid 
from ordered
group by oid
order by count(pid) desc
limit 1;

-- 30 more
-- 1 count the number of orders per user
select uid , count(oid) as no_of_orders from ordered
group by uid;

-- 2 Count the number of orders per product
select pid , count(*) as no_of_orders from ordered group by pid;

-- 3 Sum of product prices per user
SELECT uid, SUM((SELECT price FROM product WHERE pid = orders.pid)) as total_spent 
FROM orders GROUP BY uid;



-- 4 

-- 7 Count of different users who ordered each product

select count(uid) from user;
select pid , count((select count(uid) from user)) as uid  from product
group by pid;

select pid ,count(distinct uid) from ordered group by pid;


-- 8 count Total number of products ordered per user
select uid , count(pid) as orderedProduct from ordered group by uid;

-- 21 Select users who have made more than 3 orders
select uid , count(distinct oid) from ordered 
group by uid
having count(oid) > 3;

-- 23 Select the number of users who have ordered products costing more than the average product price
select avg(price) from product;
select count(pid) from product where price > (select avg(price) from product);

SELECT COUNT(DISTINCT uid) FROM ordered WHERE pid IN (
    SELECT pid FROM product WHERE price > (SELECT AVG(price) FROM product)
);

-- 24 Select the total number of orders for products with price less than 100
select price from product ;

select pid from product where price < 100 ;
select count(*) from ordered where pid in (select pid from product where price < 100);

-- 25 Select the user IDs of users who have ordered the cheapest product
select pid from product order by price asc limit 1;

select uid from ordered where pid = (select pid from product order by price asc limit 1);

-- 26 Select the product IDs of products ordered by the user with the most orders
SELECT pid FROM ordered WHERE uid = (
    SELECT uid FROM (
        SELECT uid, COUNT(*) as order_count FROM orders GROUP BY uid
    ) as subquery ORDER BY order_count DESC LIMIT 1
);





-- 27 Select the user names of users who have ordered a product named 'Laptop'
select pid from product where name = 'laptop';
select uid from ordered where pid = (select pid from product where name = 'laptop');
select name from user where uid in (select uid from ordered where pid = (select pid from product where name = 'laptop'));


 -- 28 Select the product names of products ordered by user ID 2
select pid from ordered where uid = 2;

select name from product where pid in (select pid from ordered where uid = 2);

SELECT name FROM product WHERE pid IN (
    SELECT pid FROM ordered WHERE uid = 2
);









































 




















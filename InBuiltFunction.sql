use practice;

show tables;

-- LENGTH(string): Returns the length of a string.
select length("kaushik");

-- CONCAT(string1, string2, ...): Concatenates two or more strings.
select concat('Hello' , '' , 'kaushik') as concat;

-- SUBSTRING(string, start, length): Extracts a substring from a string.
select substring("kaushik" , 1 , 9);

-- LOWER(string): Converts all characters in a string to lowercase.
select lower("KAUSHIK");

-- UPPER(string): Converts all characters in a string to uppercase.
select upper('kaushik');

-- reverse
select reverse('kaushik');

-- replace
select replace("HELLO WORLD " , "HELLO" , "GELLO");

-- ltrim
SELECT LTRIM(' Hello world') AS LeftTrimmedString;

-- DATE FUNCTION --
select curdate(); -- returns cur date

select now(); -- returns cur date and time

CREATE TABLE employeesss (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employeesss (first_name, last_name, department, salary) VALUES
('John', 'Doe', 'Engineering', 60000),
('Jane', 'Smith', 'Marketing', 55000),
('Emily', 'Davis', 'Sales', 50000),
('Michael', 'Brown', 'Engineering', 70000),
('Sarah', 'Johnson', 'Marketing', 60000),
('David', 'Wilson', 'Sales', 45000),
('Laura', 'Garcia', 'Engineering', 80000),
('Robert', 'Martinez', 'Sales', 40000),
('Linda', 'Lopez', 'Marketing', 50000),
('James', 'Hernandez', 'Engineering', 65000);


select * from employeesss limit 5;

select department , count(id) from employeesss  group by department order by id desc;



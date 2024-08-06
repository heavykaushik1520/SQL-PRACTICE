use assignment;

drop table employee;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager_id INT,
    location_id INT
);


CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    mobile VARCHAR(50),
    hire_date DATE,
    job_id INT,
    salary FLOAT,
    manager_id INT,
    dept_id INT null,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department (dept_id, dept_name, manager_id, location_id) VALUES
(1, 'HR', 101, 1),
(2, 'Engineering', 102, 2),
(3, 'Sales', 103, 3);


INSERT INTO employee (emp_id, first_name, last_name, email, mobile, hire_date, job_id, salary, manager_id, dept_id) VALUES
(1, 'Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '2023-01-10', 101, 56000, 201  , 2),
(2, 'Pravin', 'Patel', 'pravin.patel@example.com', '9765432109', '2023-03-15', 102, 25000, 202  , 3),
(3, 'Naresh', 'Kumar', 'naresh.kumar@example.com', '9654321098', '2023-05-20', 103, 8000, 203 , 1);

SELECT 
    emp_id,
    first_name,
    last_name,
    salary,
    ASSIGNGRADE(salary) AS grade
FROM
    employee;



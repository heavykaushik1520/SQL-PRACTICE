CREATE DATABASE BookManagementSystem;
USE BookManagementSystem;
show tables;

select * from book;

select * from borrowing;

select * from user;

create table abc(
id int primary key ,
name varchar(20) not null ,
age int not null );

create table xyz(
u_id int primary key ,
name varchar(20),
y_id int ,
constraint fk_abc foreign key (y_id) references abc(id) );

create table mnc(
a_id int ,
foreign key (a_id) references xyz(u_id));

desc xyz;



CREATE TABLE BOOK (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    genre VARCHAR(25),
    publication_date DATE,
    publisher VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE USER (
    user_id VARCHAR(10) PRIMARY KEY,
    username VARCHAR(10),
    email VARCHAR(20),
    dob DATE,
    gender VARCHAR(5),
    phoneno VARCHAR(10),
    address VARCHAR(20)
);


CREATE TABLE BORROWING (
    borrowing_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10),
    isbn VARCHAR(20),
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    fine DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES USER(user_id),
    FOREIGN KEY (isbn) REFERENCES BOOK(isbn)
);

INSERT INTO 
BOOK (isbn, title, author, genre, publication_date, publisher, price) 
VALUES
('978-81-7992-600-5', 'Shyamchi Aai', 'Sane Guruji', 'Biography', '1933-01-01', 'Mouj Prakashan', 250.00),
('978-81-7315-205-8', 'Mrutyunjay', 'Shivaji Sawant', 'Historical Fiction', '1967-01-01', 'Continental', 300.00),
('978-93-86603-31-5', 'Yayati', 'V. S. Khandekar', 'Mythological Fiction', '1959-01-01', 'Mehta Publishing', 280.00),
('978-81-7157-807-0', 'Panipat', 'Vishwas Patil', 'Historical Fiction', '1988-01-01', 'Rajhans Prakashan', 350.00),
('978-81-7936-123-4', 'Kosala', 'Bhalchandra Nemade', 'Classic', '1963-01-01', 'Popular Prakashan', 220.00),
('978-81-7227-190-0', 'Chava', 'Shivaji Sawant', 'Historical Fiction', '1980-01-01', 'Mouj Prakashan', 320.00),
('978-81-7434-321-0', 'Hindu', 'V. D. Savarkar', 'Historical', '1923-01-01', 'Swantryaveer Savarkar Rashtriya Smarak', 400.00),
('978-81-7157-605-2', 'Shriman Yogi', 'Ranjit Desai', 'Historical Fiction', '1982-01-01', 'Mehta Publishing', 380.00);

INSERT INTO USER 
(user_id, username, email, dob, gender, phoneno, address) 
VALUES
('UN001', 'AmitP', 'amit@gmail.com', '1985-01-15', 'M', '1234567890', 'Shivaji Nagar, Pune'),
('UN002', 'NehaK', 'sneha@gmail.com', '1990-02-20', 'F', '2345678901', 'Koregaon Park, Pune'),
('UN003', 'RahulD', 'rahul@gmail.com', '1988-03-25', 'M', '3456789012', 'Deccan, Pune'),
('UN004', 'PriyaJ', 'priya@gmail.com', '1986-04-30', 'F', '4567890123', 'FC Road, Pune'),
('UN005', 'VikramS', 'vikram@gmail.com', '1992-05-10', 'M', '5678901234', 'Baner, Pune'),
('UN006', 'AnjaliK', 'anjali@gmail.com', '1989-06-15', 'F', '6789012345', 'Aundh, Pune'),
('UN007', 'GaneshS', 'ganesh@gmail.com', '1987-07-20', 'M', '7840123456', 'Pashan, Pune'),
('UN008', 'MeeraD', 'meera@gmail.com', '1991-08-25', 'F', '8901234567', 'Shivaji Park, Mumbai');

INSERT INTO BORROWING
(borrowing_id, user_id, isbn, borrow_date, due_date, return_date, fine)
VALUES
('BK1', 'UN002', '978-81-7157-807-0', '2024-02-15', '2024-02-23', '2024-02-19', '0'),
('BK2', 'UN006', '978-81-7992-600-5', '2024-03-07', '2024-03-15', '2024-03-10', '0'),
('BK3', 'UN007', '978-81-7157-605-2', '2024-03-13', '2024-03-23', '2024-03-15', '0'),
('BK4', 'UN002', '978-81-7936-123-4', '2024-03-31', '2024-04-08', '2024-04-10', '50'),
('BK5', 'UN004', '978-81-7227-190-0', '2024-04-12', '2024-04-20', '2024-04-13', '0');



SELECT username
FROM USER
WHERE user_id IN (
  SELECT user_id
  FROM BORROWING
  GROUP BY user_id
  HAVING COUNT(*) = (
    SELECT MAX(borrow_count)
    FROM (
      SELECT user_id, COUNT(*) AS borrow_count
      FROM BORROWING
      GROUP BY user_id
    ) AS inner_query
  )
);

SELECT b.title, b.author, COUNT(DISTINCT br.user_id) AS user_count
FROM BOOK b
INNER JOIN BORROWING br ON b.isbn = br.isbn
WHERE br.user_id = 'UN007'
GROUP BY b.title, b.author;

SELECT u.user_id, u.username, COALESCE(MAX(b.fine), 0) AS max_fine
FROM USER u
LEFT JOIN BORROWING b ON u.user_id = b.user_id
GROUP BY u.user_id, u.username
ORDER BY u.user_id DESC;

SELECT u.username, b.borrowing_id, DATE_FORMAT(b.borrow_date, '%M, %Y') AS borrowed_date
FROM USER u
INNER JOIN BORROWING b ON u.user_id = b.user_id
ORDER BY b.borrowing_id DESC;

SELECT u.username, b.title, br.borrow_date
FROM USER u
INNER JOIN BORROWING br ON u.user_id = br.user_id
INNER JOIN BOOK b ON br.isbn = b.isbn
ORDER BY br.borrow_date DESC;




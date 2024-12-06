CREATE DATABASE library;
use library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES (1, 101, 'Downtown Library, NY', '1234567890'),
       (2, 102, 'City Central Library, LA', '9876543210');

select * from branch;

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (101, 'Alice Johnson', 'Manager', 60000, 1),
       (102, 'Bob Smith', 'Manager', 55000, 2),
       (103, 'Charlie Brown', 'Staff', 40000, 1);
       	SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

SELECT E.Emp_name, B.Branch_address 
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;



       
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(10),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES ('978-0-123456-47-2', 'The History of Time', 'History', 30, 'yes', 'Stephen Hawking', 'Cambridge'),
       ('978-1-234567-89-7', 'Learning SQL', 'Technology', 20, 'no', 'Alan Beaulieu', 'O\'Reilly');
       
	SELECT Books.Book_title, Customer.Customer_name 
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

SELECT Customer_name 
FROM Customer 
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';


       
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES (201, 'John Doe', '123 Main St, NY', '2021-12-15'),
       (202, 'Jane Smith', '456 Elm St, LA', '2023-03-10');
       
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES (301, 201, 'The History of Time', '2023-06-15', '978-0-123456-47-2');

SELECT * FROM IssueStatus;
SELECT DISTINCT Customer.Customer_name 
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Books.Rental_Price > 25;

SELECT Customer.Customer_name 
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';



CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
(401, 201, 'The History of Time', '2023-07-10', '978-0-123456-47-2'),
(402, 202, 'Learning SQL', '2023-06-20', '978-1-234567-89-7');

SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';




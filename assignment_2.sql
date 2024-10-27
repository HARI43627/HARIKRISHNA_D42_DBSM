create database managers;
use managers;
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18 AND Age <= 65),
    Last_Update TIMESTAMP DEFAULT NOW(), 
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Last_Update, Gender, Department, Salary)
VALUES 
    (1, 'John', 'Doe', '1980-05-12', 44, CURRENT_DATE, 'M', 'Sales', 30000),
    (2, 'Aaliya', 'Hussain', '1985-03-25', 39, CURRENT_DATE, 'F', 'IT', 28000),
    (3, 'Robert', 'Smith', '1978-09-15', 46, CURRENT_DATE, 'M', 'Marketing', 35000),
    (4, 'Linda', 'Jones', '1990-01-20', 34, CURRENT_DATE, 'F', 'IT', 27000),
    (5, 'Michael', 'Brown', '1982-11-05', 42, CURRENT_DATE, 'M', 'Finance', 32000),
    (6, 'Sara', 'Miller', '1976-06-30', 48, CURRENT_DATE, 'F', 'HR', 24000),
    (7, 'David', 'Wilson', '1991-12-14', 33, CURRENT_DATE, 'M', 'IT', 26000),
    (8, 'Sophia', 'Taylor', '1989-07-19', 35, CURRENT_DATE, 'F', 'Sales', 31000),
    (9, 'James', 'Anderson', '1984-08-08', 40, CURRENT_DATE, 'M', 'Operations', 23000),
    (10, 'Patricia', 'Moore', '1975-04-10', 49, CURRENT_DATE, 'F', 'IT', 36000);
    select * from  managers; 
    SELECT First_Name, Last_Name, DOB 
    
FROM Managers WHERE Manager_Id = 1;

SELECT First_Name, Last_Name, (Salary * 12) AS Annual_Income FROM Managers;

SELECT * FROM managers WHERE First_Name <> 'Aaliya';

SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;






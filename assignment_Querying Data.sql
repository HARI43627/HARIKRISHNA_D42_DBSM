create database country;
use country;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 67000000, 242495),
(4, 'India', 1380000000, 3287263),
(5, 'Australia', 25000000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Japan', 126000000, 377975),
(9, 'Russia', 144000000, 17098246),
(10, 'Brazil', 213000000, 8515767);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.2, 1, 'USA'),
(2, 'Jane', 'Smith', 38000000, 3.9, 2, 'Canada'),
(3, 'Alice', 'Johnson', 67000000, 4.5, 3, 'UK'),
(4, 'Bob', 'Brown', 1380000000, 4.8, 4, 'India'),
(5, 'Charlie', 'Davis', 25000000, 3.7, 5, 'Australia'),
(6, 'David', 'Wilson', 83000000, 4.1, 6, 'Germany'),
(7, 'Emma', 'Clark', 67000000, 3.6, 7, 'France'),
(8, 'Lucas', 'Lee', 126000000, 4.9, 8, 'Japan'),
(9, 'Liam', 'Young', 144000000, 4.4, 9, 'Russia'),
(10, 'Sophia', 'Martinez', 213000000, 3.8, 10, 'Brazil');

SELECT DISTINCT Country_name FROM Persons;

SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

SELECT * FROM Persons WHERE Rating > 4.0;

SELECT * FROM Country WHERE Population > 1000000;

SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

SELECT * FROM Persons WHERE Country_name IS NULL;

SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';












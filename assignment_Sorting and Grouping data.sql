use country;


CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT
);


CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);


INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'CountryA', 100000, 250.5),
(2, 'CountryB', 200000, 550.7),
(3, 'CountryC', 300000, 150.8),
(4, 'CountryD', 400000, 350.4),
(5, 'CountryE', 500000, 450.2),
(6, 'CountryF', 600000, 750.6),
(7, 'CountryG', 700000, 650.3),
(8, 'CountryH', 800000, 850.1),
(9, 'CountryI', 900000, 950.9),
(10, 'CountryJ', 1000000, 1050.0);


INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 25000, 4.5, 1, 'CountryA'),
(2, 'Jane', 'Smith', 30000, 3.8, 2, 'CountryB'),
(3, 'Bob', 'Brown', 15000, 4.2, 3, 'CountryC'),
(4, 'Alice', 'Johnson', 50000, 5.0, 4, 'CountryD'),
(5, 'Charlie', 'Davis', 45000, 4.0, 5, 'CountryE'),
(6, 'Eve', 'Williams', 35000, 3.9, 6, 'CountryF'),
(7, 'Frank', 'Miller', 28000, 4.1, 7, 'CountryG'),
(8, 'Grace', 'Wilson', 22000, 3.7, 8, 'CountryH'),
(9, 'Hank', 'Moore', 33000, 4.3, 9, 'CountryI'),
(10, 'Ivy', 'Taylor', 27000, 3.6, 10, 'CountryJ');

SELECT LEFT(Country_name, 3) AS FirstThreeChars FROM Country;

SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

SELECT COUNT(DISTINCT Country_name) AS UniqueCountryCount FROM Persons;

SELECT MAX(Population) AS MaxPopulation FROM Country;

SELECT MIN(Population) AS MinPopulation FROM Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'Leo', NULL, 18000, 4.2, 1, 'CountryA'),
(12, 'Nina', NULL, 24000, 3.5, 2, 'CountryB');

SELECT COUNT(Lname) AS LnameCount FROM Persons;

SELECT COUNT(*) AS RowCount FROM Persons;

SELECT Population FROM Country LIMIT 3;

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name;

SELECT Country_name FROM Persons GROUP BY Country_name HAVING SUM(Population) > 50000;

SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AvgRating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AvgRating ASC;

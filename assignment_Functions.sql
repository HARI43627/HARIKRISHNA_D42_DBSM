use country ;

ALTER TABLE Persons ADD DOB DATE;

UPDATE Persons
SET DOB = '1990-01-01'
WHERE ID = 1;

UPDATE Persons
SET DOB = '1985-07-15'
WHERE ID = 2;

UPDATE Persons
SET DOB = '1992-03-23'
WHERE ID = 3;

UPDATE Persons
SET DOB = '1988-11-09'
WHERE ID = 4;

UPDATE Persons
SET DOB = '1995-05-30'
WHERE ID = 5;

delimiter $$
CREATE FUNCTION dbo.CalculateAge (@DOB DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;

    SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) 
               - CASE 
                     WHEN MONTH(@DOB) > MONTH(GETDATE()) 
                          OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
                     THEN 1 
                     ELSE 0 
                 END;

    RETURN @Age;
END;
delimiter ;

SELECT Fname AS FirstName, Lname AS LastName, DOB, dbo.CalculateAge(DOB) AS Age
FROM Persons;

SELECT Country_name, length(Country_name) AS CountryNameLength
FROM Persons;

SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Persons;

SELECT Country_name, 
       UPPER(Country_name) AS CountryNameUpper,
       LOWER(Country_name) AS CountryNameLower
FROM Persons;


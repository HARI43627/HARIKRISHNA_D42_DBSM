use country;
-- inner join 
SELECT Country.Id AS CountryId, Country.Country_name AS CountryName, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
INNER JOIN Persons ON Country.Id = Persons.Country_Id;
-- left join
SELECT Country.Id AS CountryId, Country.Country_name AS CountryName, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
LEFT JOIN Persons ON Country.Id = Persons.Country_Id;
-- right join
SELECT Country.Id AS CountryId, Country.Country_name AS CountryName, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
RIGHT JOIN Persons ON Country.Id = Persons.Country_Id;

SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

SELECT Id, Fname, Lname, Population, ROUND(Rating) AS RoundedRating, Country_Id, Country_name
FROM Persons;

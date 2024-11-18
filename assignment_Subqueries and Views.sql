use country ;

SELECT c.Country_name, COUNT(p.Id) AS NumberOfPersons
FROM country c
LEFT JOIN persons p ON c.Id = p.Country_Id
GROUP BY c.Country_name;

SELECT c.Country_name, COUNT(p.Id) AS NumberOfPersons
FROM country c
LEFT JOIN persons p ON c.Id = p.Country_Id
GROUP BY c.Country_name
ORDER BY NumberOfPersons DESC;

SELECT c.Country_name, AVG(p.Rating) AS AverageRating
FROM country c
JOIN persons p ON c.Id = p.Country_Id
GROUP BY c.Country_name
HAVING AVG(p.Rating) > 3.0;

SELECT c.Country_name
FROM country c
WHERE c.Id IN (
    SELECT p.Country_Id
    FROM persons p
    WHERE p.Rating = (
        SELECT Rating
        FROM persons
        WHERE Country_Id = (SELECT Id FROM country WHERE Country_name = 'USA')
        LIMIT 1
    )
);

SELECT Country_name
FROM country
WHERE Population > (
    SELECT AVG(Population)
    FROM country
);

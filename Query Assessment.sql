CREATE DATABASE assess;
USE assess;
CREATE TABLE Country(ID INT PRIMARY KEY, Country_Name VARCHAR(30), Population INT NOT NULL,Area DECIMAL (8,2));
INSERT INTO Country VALUES
(1,'US',3454265, 983.41);
INSERT INTO Country VALUES
(6,'UK',691381,2.43);
SELECT*FROM Country;
CREATE TABLE Persons(Personal_ID INT PRIMARY KEY, FName VARCHAR (15), LName VARCHAR(15), Population INT,ID INT, Country_Name VARCHAR(15), FOREIGN KEY(ID) REFERENCES Country(ID));
ALTER TABLE Persons ADD COLUMN Rating DECIMAL(3,2);
DESC TABLE Persons;
INSERT INTO Persons VALUES
(107,'Jasmine','Mahmoud',3972443,7,'Canada',3.55);
SELECT *FROM Persons;
UPDATE persons SET Country_name='Australia',ID=3 WHERE Personal_Id=104;
#(1)List the distinct country names from the Persons table 
SELECT DISTINCT Country_Name FROM Persons;
#(2)Select first names and last names from the Persons table with aliases
SELECT concat( FName,' ',LName) AS Full_Name FROM Persons;
#(3)Find all persons with a rating greater than 4.0. 
SELECT * FROM Persons WHERE Rating>4.00;
#(4)Find countries with a population greater than 10 lakhs.
SELECT * FROM Country WHERE Population > 1000000;
#(5)Find persons who are from 'USA' or have a rating greater than 4.05
SELECT * FROM Persons WHERE Country_Name ='US' AND Rating>=4.05;
#(5)Find persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons WHERE Country_Name ='US' AND Rating>=4.5;
UPDATE Persons SET Country_Name = Canada WHERE Personal_ID= 107;
#(6)Find all persons where the country name is NULL
SELECT FName, LName, Country_Name FROM persons WHERE Country_Name IS NULL;
#(7)Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT FName, LName, Country_Name FROM persons WHERE Country_Name ='US'OR Country_Name = 'Canada'OR Country_Name ='UK';
#(8)Find all persons not from the countries 'India' and 'Australia'. 
SELECT FName, LName, Country_Name FROM persons WHERE Country_Name NOT IN ('India','Australia');
#(9)Find all countries with a population between 5 lakhs and 20 lakhs. 
SELECT Country_Name, Population FROM Country WHERE Population BETWEEN 500000 AND 2000000;
#(10)Find all countries whose names do not start with 'C'.
SELECT Country_Name FROM Country WHERE COUntry_Name NOT LIKE 'C%';
#1. Write an SQL query to print the first three characters of Country_name from the Country table. 
SELECT substring(Country_name,1,3) FROM country;
#2. Write an SQL query to concatenate first name and last name from Persons table
SELECT concat( FName,' ',LName) AS Full_Name FROM Persons;
#3. Write an SQL query to count the number of unique country names from Persons table. 
SELECT COUNT(DISTINCT Country_Name) FROM Persons;
#4. Write a query to print the maximum population from the Country table
SELECT MAX(Population) FROM Country;
#5. Write a query to print the minimum population from Persons table. 
SELECT MIN(Population) FROM persons;
#6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
INSERT INTO Persons VALUES 
(112,'Raya','Null',691381,6,'UK',4.66);
SELECT COUNT(LName) FROM persons;
#7. Write a query to find the number of rows in the Persons table
SELECT COUNT(*) FROM persons;
#8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
SELECT * FROM Country WHERE Population LIMIT 3;
#9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
SELECT * FROM Country WHERE rand(ID) LIMIT 3;
#10. List all persons ordered by their rating in descending order. 
SELECT * FROM persons ORDER BY (rating)DESC;
#11. Find the total population for each country in the Persons table. 
SELECT SUM(population) FROM persons GROUP BY Country_Name;
#12. Find countries in the Persons table with a total population greater than 50,000 
SELECT Country_Name, SUM(Population) FROM persons  GROUP BY Country_Name HAVING SUM(Population)>50000;
#13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
SELECT Country_Name, COUNT(FName) ,AVG(Rating) FROM persons GROUP BY Country_Name HAVING COUNT(FName)>2 ORDER BY AVG(Rating) ASC;
/*Joins and Union
Consider the Country table and Persons table that you created earlier and perform the following: 
(1)Perform inner join, Left join, and Right join on the tables.*/
SELECT Country.Country_Name, Country.Population, Persons.FName, Persons.LName, Persons.Rating FROM Country INNER JOIN persons ON Country.ID =Persons.ID;
SELECT Country.Country_Name, Country.Population, Persons.FName, Persons.LName, Persons.Rating FROM Country LEFT JOIN persons ON Country.ID =Persons.ID;
SELECT Country.Country_Name, Country.Population, Persons.FName, Persons.LName, Persons.Rating FROM Country RIGHT JOIN persons ON Country.ID =Persons.ID;
#(2)List all distinct country names from both the Country and Persons tables. 
SELECT DISTINCT Country_Name FROM Persons;
SELECT DISTINCT Country_Name FROM Country;
#(3)List all country names from both the Country and Persons tables, including duplicates
SELECT Country_Name FROM country UNION ALL SELECT Country_Name FROM Persons;
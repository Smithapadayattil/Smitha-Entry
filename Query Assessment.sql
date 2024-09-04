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
#(1)List the distinct country names from the Persons table 
SELECT DISTINCT Country_Name FROM Persons;
#(2)Select first names and last names from the Persons table with aliases
SELECT concat( FName,' ',LName) AS Full_Name FROM Persons;
#(3)Find all persons with a rating greater than 4.0. 
SELECT * FROM Persons WHERE Rating>4.00;
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
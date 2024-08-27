USE Sales;
CREATE TABLE Managers(
Manager_Id INT PRIMARY KEY,
First_Name VARCHAR(30),
Last_Name VARCHAR(30),
DOB DATE,
Age INT CONSTRAINT CHECK (Age>18),
Gender VARCHAR(10),
Department varchar(10),
Salary DECIMAL(8,2) NOT Null
);
DESC Managers;
INSERT INTO Managers VALUES
(1, 'John','Brown','1967-02-27',57,'M','IT',55678.89),
(2,'Mathew','Hayden','1972-09-16',51,'M','Purchase',87658.52),
(3, 'Gary','Hunt','1983-12-13',41,'M','Sales',67548.99),
(4,'steve','Jobs','1999-11-09',24,'M','IT',93000.00),
(5,'Penny','Cooper','2000-08-11', 24,'F','Accounts',52342.98),
(6,'Susan','Shelly','1998-07-24',26,'F','IT',43000.00),
(7, 'Kiara','Adwani','1995-09-11',28,'F','IT',37865.98),
(8,'Stephen','Hawkings','1959-11-04',64,'M','IT',99967.87),
(9,'Aaliya','Bhatt','1998-02-12',26,'F','Accounts',24382.98),
(10,'Paul','Mvcartney','1965-06-15',59,'M','Purchase',96972.33);
SELECT*FROM Managers;
#Write a query that retrieves the name and date of birth of the manager with Manager_Id 1.
SELECT First_Name,Last_Name,DOB FROM Managers WHERE Manager_Id=1;
#Write a query to display the annual income of all managers
SELECT Salary*12 AS Annual_Income FROM Managers;
#Write a query to display records of all managers except ‘Aaliya’. 
SELECT* FROM Managers WHERE Manager_Id!=9;
SELECT* FROM Managers WHERE Salary>25000.00;
SELECT Manager_Id FROM Managers GROUP BY Department;
#Write a query to display details of managers whose department is IT and earns more than 25000 per month
SELECT First_Name,Last_Name,Age,Salary,Department FROM Managers WHERE Department= 'IT' HAVING Salary >25000;
#Write a query to display details of managers whose salary is between 10000 and 35000.
SELECT *FROM Managers WHERE Salary >10000 AND Salary<35000;



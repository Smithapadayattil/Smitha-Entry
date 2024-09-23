/* Create a database named library and following TABLES in the database: 
1. Branch 
2. Employee 
3. Books 
4. Customer 
5. IssueStatus 
6. ReturnStatus 
Attributes for the tables: 
1. Branch Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no 
2. Employee Emp_Id – Set as PRIMARY KEY Emp_name Position Salary Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table 
3. Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status [Give yes if book available and no if book not available] Author Publisher 
4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date 
5. IssueStatus Issue_Id - Set as PRIMARY KEY Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table Issued_book_name Issue_date Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table 
6. ReturnStatus Return_Id - Set as PRIMARY KEY Return_cust Return_book_name Return_date Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table*/
CREATE DATABASE library;
USE library;
CREATE TABLE Branch(
Branch_no  INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR (30),
Contact_no INT
);
INSERT INTO Branch VALUES
(001,112,'firsts lane Bangalore', 563987),
(002,113,'seconds lane Mumbai',562365),
(003,114,'3rd street Kolkatta',458792),
(004,115,'4th street Delhi',568741);
SELECT * FROM Branch;
CREATE TABLE Employee(
 Emp_Id INT PRIMARY KEY, 
 Emp_name VARCHAR(15),
 Position VARCHAR(15),
 Salary DECIMAL(8,2),
 Branch_no INT,
 FOREIGN KEY (Branch_No) REFERENCES Branch (Branch_no)
 );
 INSERT INTO Employee VALUES
 (1, 'John',  'Finance', 55000.00, 001),
(2, 'Jane', 'HR', 60000.00,002),
(3, 'Mike', 'IT', 72000.00,001),
(4, 'Sara', 'Marketing', 48000.00,002),
(5, 'Paul', 'IT', 75000.00, 003),
(6, 'Emily', 'HR', 58000.00,004);
SELECT * FROM Employee;
INSERT INTO Employee ( Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (19,'Roy','Manager',85000.00,003);
 
 CREATE table Books( 
 ISBN INT PRIMARY KEY, 
 Book_title VARCHAR(50),
 Category VARCHAR(15), 
 Rental_Price DECIMAL(8,2),
 Status VARCHAR(10),
 Author VARCHAR(30),
 Publisher VARCHAR(30)
 );
 Insert into Books Values
 (010, '1776', 'history',58.5, 'Yes','david mccullogh','Penguin'),
(011,'Moby dick','Fiction',45.8,'Yes','Herman Melville','Harper Collins'),
(012,'Bible','Spititual',23.6,'Yes','Unknown','KCBC'),
(013,'Anna Kareneena','Fiction',16.2,'No','Leo tolstoy','Macmillan'),
(014,'University Physics','Physics',14.5,'Yes','Young','Mcgrawhill'),
(015,'freedom at Midnight','History',66.9,'No','Dominique lappiere','Penguin'),
(016,'Wings of fire','Autobiography',23.6,'Yes','Abdul Kalam','Penguin'),
(017,'Harry potter','Fantasy',13.6,'No','J K Rowling','Macmillan'),
(018,'Power','Self help',25.6,'No','Robert L Greene','Profile'),
(019,'French cooking','Cookery',4.90,'No','Julia Child','Macmillan'),
(020,'selected poems','Poetry',5.36,'Yes','Rumi','Penguin');
SELECT * FROM Books;

 #put condition if book available then yes else no
 CREATE TABLE  Customer( 
 Customer_Id INT PRIMARY KEY, 
 Customer_name VARCHAR(15),
 Customer_address VARCHAR(80),
 Reg_No DATE
 );
 INSERT INTO Customer VALUES
 (1111, 'Alice Smith','2nd street yellowstone New york 100001 USA','2019-09-23'),
 (1112, 'Bob Johnson', '3rd street greenstone  Los Angeles 200034 USA','2020-09-16'),
 (1113, 'Charlie Brown', '4th street bluestone Chicago 300058 USA','2021-05-09'),
(1114, 'David Williams', '5th street brownstone Texas Houston 400056 USA','2023-08-17'),
(1115, 'Eve Jones','6th street whitestone Arizona 500023 USA','2024-08-14'),
(1116, 'Frank Garcia','7th street blackstone lavendar Philadelphia  200456 USA','2024-01-02'),
(1117, 'Grace Miller', '8th street rosestone San Antonio California 200565 USA','2024-09-08'),
(1118, 'Hannah Moore', '2nd street yellowstone Buffalo New york 100001 USA','2024-06-05'),
(1119, 'Ivy Clark', '2nd street yellowstone Buffalo New york 100001 USA','2022-12-26'),
(1110, 'Jack Hall','2nd street yellowstone Buffalo New york 100001 USA','2023-10-11');
SELECT * FROM Customer;
CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT, 
FOREIGN KEY (Issued_cust) REFERENCES CUSTOMER ( customer_id),
Issued_book_name VARCHAR(50),
Issue_date DATETIME,
Isbn_Book INT,
FOREIGN KEY (Isbn_book) REFERENCES BOOKS(isbn)
);
INSERT INTO IssueStatus VALUES
(561,1111,'Bible','2023-02-18 07:23:45',012),
(562,1117,'Moby dick','2024-09-18 09:23:45',011),
(563,1113,'Wings of fire','2024-01-18 11:53:09',016),
(564,1118,'Anna Kareneena','2023-09-18 12:25:45',013),
(565,1116,'1776','2023-06-12 10:53:49',011);
SELECT * FROM IssueStatus;
CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(30),
Return_date DATETIME,
Isbn_book2 INT, 
FOREIGN KEY(Isbn_book2) REFERENCES BOOKS(isbn)
);
 
INSERT INTO ReturnStatus VALUES
(2353, 'Charlie','University Physics','2024-09-21 08:56:34',014),
(2354, 'David','Harry Potter','2024-09-21 08:59:44',017),
(2355, 'Eve','French cooking','2024-09-21 08:56:34',019),
(2356, 'Frank','Power','2024-09-21 09:56:34',018),
(2357, 'Grace','selected poems','2024-09-21 10:16:34',018);
SELECT * FROM ReturnStatus;
#1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,Category, Rental_Price FROM Books WHERE status ='yes';
#2. List the employee_names and their respective salaries in descending order of salary. 
SELECT Emp_Name, Salary FROM Employee ORDER BY salary DESC;
#3. Retrieve the book titles and the corresponding customers who have issued those books.  
SELECT IssueStatus.Issued_book_name, Customer.Customer_Name FROM IssueStatus INNER JOIN Customer ON IssueStatus.Issued_Cust =Customer.Customer_Id;
#4. Display the total count of books in each category.
SELECT Category, COUNT(*)Book_title FROM Books GROUP BY Category;
#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_Name, position,Salary FROM Employee WHERE salary>50000;
#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
 SELECT IssueStatus.Issued_book_name, Customer.Customer_Name FROM IssueStatus RIGHT JOIN Customer 
 ON IssueStatus.Issued_Cust =Customer.Customer_Id WHERE Issued_book_name IS NULL;
#7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_No, COUNT(*)Emp_Id FROM Employee GROUP BY Branch_No;
#8. Display the names of customers who have issued books in the month of June 2023.
SELECT IssueStatus.Issue_date, Customer.Customer_Name FROM IssueStatus INNER JOIN Customer ON IssueStatus.Issued_Cust =Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01 00:00:00' AND '2023-06-30 00:00:00';
#9. Retrieve book_title from book table containing history.
SELECT Book_title, Category AS History_Books FROM Books WHERE category='history';
#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
SELECT Branch_No, COUNT(*)Emp_Name  FROM Employee GROUP BY Branch_No HAVING COUNT(Emp_Name)>5;
#11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT Employee.Emp_Name,Branch.Branch_address FROM Employee INNER JOIN Branch ON Employee.Branch_no=Branch.Branch_no
WHERE position='Manager';
#12. Display the names of customers who have issued books with a rental price higher than Rs. 25.*/ 
SELECT Customer.Customer_Name, IssueStatus.Issued_book_name, Books.Rental_price FROM IssueStatus INNER JOIN Customer INNER JOIN Books ON 
books.isbn=IssueStatus.Isbn_book AND Customer.Customer_Id =IssueStatus.Issued_Cust WHERE rental_Price>25;
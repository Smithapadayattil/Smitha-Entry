CREATE DATABASE Sales;
USE Sales;
CREATE TABLE Orders (
Order_Id INT PRIMARY KEY, 
Customer_name VARCHAR (15), 
Product_Category VARCHAR (15) UNIQUE , 
Ordered_item VARCHAR (10) NOT NULL, 
Contact_No VARCHAR (15) NOT NULL);

ALTER TABLE Sales_Orders
MODIFY COLUMN Product_Category VARCHAR (30);
ALTER TABLE Sales_Orders
MODIFY COLUMN Product_Category VARCHAR (30);ALTER TABLE Sales_Orders;
ALTER TABLE Sales_Orders
MODIFY COLUMN Contact_No VARCHAR (15) UNIQUE;
DESC Orders;
ALTER TABLE Orders
ADD Order_quantity INT NOT NULL;
RENAME TABLE Orders TO Sales_Orders;
DESC Sales_Orders;
INSERT INTO Sales_Orders  
VALUES (11, 'Raj', 'electronics', 'mobile', '7865498761', 1),
	   (12, 'Reena','Clothing','Dress','6754378654',4),
       (13, 'Roy', 'Apparels','tie','9856432121',10),
       (14, 'Lisa','Bakery','Cookies','5555444433',24),
       (15, 'Ray','Snacks','Chips','9856215555',3),
       (16,'Sheldon','Frozen','Nuggets','8887655543',3),
       (17,'Howard','Grains','Rice','3423234598',10),
       (18,'Amy','Fruits','Apple','4326759899', 6), 
       (19,'Cece','Cosmetics','Lipstick','6098798723',2),
       (20,'Mary','Confectionary','Candy','3985478622',50);
SELECT * FROM Sales_Orders;
SELECT Customer_name,Ordered_item FROM Sales_Orders;
UPDATE Sales_Orders SET Product_Category='Accessory' WHERE Order_Id=13;       
DROP TABLE Sales_Orders;

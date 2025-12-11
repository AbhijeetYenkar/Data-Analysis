CREATE DATABASE RetailMartDB;
USE RetailMartDB;
-- Customers Table
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustName VARCHAR(50) NOT NULL,
Email VARCHAR(80) UNIQUE,
City VARCHAR(50),
JoinDate DATE NOT NULL,
Status VARCHAR(20)
CHECK(Status IN ('Active','Inactive'))
);
INSERT INTO Customers (CustomerID,CustName,Email,City,JoinDate,Status)
VALUES
(1, 'Aarav Patil','aarav.patil@maha.com','Pune','2023-01-15', 'Active'),
(2, 'Riya Deshmukh', 'riya.deshmukh@maha.com','Mumbai',  '2023-02-10', 'Active'),
(3, 'Soham Kulkarni', 'soham.kulkarni@maha.com', 'Nashik','2023-03-05', 'Inactive'),
(4, 'Tanvi Jadhav', 'tanvi.jadhav@maha.com','Nagpur','2023-04-22', 'Active'),
(5, 'Kunal Shinde', 'kunal.shinde@maha.com','Aurangabad','2023-05-18', 'Active'),
(6, 'Snehal More', 'snehal.more@maha.com', 'Thane','2023-06-10', 'Inactive'),
(7, 'Prathamesh Joshi','pratham.joshi@maha.com', 'Kolhapur','2023-07-02','Active'),
(8, 'Megha Pawar', 'megha.pawar@maha.com', 'Solapur','2023-08-14', 'Active'),
(9, 'Rohit Sawant','rohit.sawant@maha.com', 'Navi Mumbai','2023-09-09','Active'),
(10,'Bhavana Kapse', 'bhavana.kapse@maha.com', 'Pune','2023-10-01', 'Inactive');


-- Stores Table
CREATE TABLE Stores (
StoreID INT PRIMARY KEY,
StoreName VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
ManagerName VARCHAR(50) NOT NULL,
OpenDate DATE NOT NULL
);

INSERT INTO Stores (StoreID,StoreName,City,ManagerName,OpenDate) VALUES
(1, 'Pune Central Mall','Pune','Vishal Kulkarni', '2019-01-10'),
(2, 'Mumbai Mega Store','Mumbai','Rakesh Shah','2019-02-18'),
(3, 'Nashik Smart Plaza','Nashik','Sachin Deshmukh', '2019-03-12'),
(4, 'Nagpur Shopping Hub','Nagpur','Arvind Patil','2019-04-25'),
(5, 'Aurangabad Retail Mart','Aurangabad','Sujata Joshi','2019-05-20'),
(6, 'Thane City Center','Thane','Mahesh Rao','2019-06-28'),
(7, 'Kolhapur Market Point','Kolhapur','Swapnil Naik','2019-07-14'),
(8, 'Solapur Super Store','Solapur','Amol Pawar','2019-08-21'),
(9, 'Navi Mumbai Mart','Navi Mumbai','Prerna Singh','2019-09-30'),
(10,'Pune East Outlet','Pune','Manasi Patwardhan','2019-10-05');


-- Products Table
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(60) NOT NULL,
Category VARCHAR(40) NOT NULL,
UnitPrice DECIMAL(10,2) CHECK(UnitPrice > 0),
Stock INT CHECK(Stock >= 0)
);

INSERT INTO Products (ProductID,ProductName,Category,UnitPrice,Stock) VALUES
(1, 'Smartphone','Electronics', 15000, 50),
(2, 'Laptop Bag','Accessories', 1200, 100),
(3, 'Ceiling Fan','Appliances', 3000, 40),
(4, 'Bluetooth Earbuds','Electronics', 2200, 80),
(5, 'Electric Iron','Appliances', 1800, 60),
(6, 'USB Cable','Accessories', 250, 200),
(7, 'Smartwatch','Electronics', 3500, 70),
(8, 'Mixer Grinder','Appliances', 4200, 30),
(9, 'Memory Card 64GB','Electronics', 600, 150),
(10,'LED Table Lamp','Home',900, 90);


-- Orders Table
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
StoreID INT,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL(12,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

INSERT INTO Orders (OrderID,CustomerID,StoreID,OrderDate,TotalAmount) VALUES
(1,1, 1,'2024-01-12',15000),
(2,2,2,'2024-01-20',1200),
(3,3,3,'2024-02-01',3000),
(4,4, 4,'2024-02-15',2200),
(5,5, 5,'2024-03-05', 1800),
(6,6, 6,'2024-03-18', 250),
(7, 7,7, '2024-04-02',3500),
(8,8,8, '2024-04-20',4200),
(9, 9,9,'2024-05-01', 600),
(10,10,10,'2024-05-12',900);


-- OrderItems Table
CREATE TABLE OrderItems (
ItemID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT CHECK(Quantity > 0),
LineTotal DECIMAL(12,2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderItems (ItemID,OrderID,ProductID,Quantity,LineTotal) VALUES
(1, 1,1, 1,15000),
(2, 2, 2, 1,1200),
(3,3, 3, 1,3000),
(4, 4,4, 1,2200),
(5,5,5, 1,1800),
(6,6, 6,1, 250),
(7,7,7, 1,3500),
(8,8, 8, 1, 4200),
(9,9, 9, 1, 600),
(10,10,10,1,900);


-- Payments Table
CREATE TABLE Payments (
PaymentID INT PRIMARY KEY,
OrderID INT UNIQUE,
PaymentMode VARCHAR(20) CHECK (PaymentMode IN ('UPI', 'Card', 'Cash')),
PaymentDate DATE NOT NULL,
AmountPaid DECIMAL(12,2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payments (PaymentID,OrderID,PaymentMode,PaymentDate,AmountPaid) VALUES
(1, 1,'UPI', '2024-01-12', 15000),
(2, 2,'Card','2024-01-20', 1200),
(3, 3,'Cash','2024-02-01', 3000),
(4, 4,'UPI','2024-02-15', 2200),
(5, 5,'Card','2024-03-05', 1800),
(6, 6,'UPI','2024-03-18', 250),
(7, 7,'Cash','2024-04-02', 3500),
(8, 8,'Card','2024-04-20', 4200),
(9, 9,'UPI','2024-05-01', 600),
(10,10,'Cash', '2024-05-12', 900);

-- 1. Insert 10 sample records in all tables while maintaining constraints.

-- 2. Update the email of any customer.
UPDATE Customers
SET Email = 'riya.deshmukh123@maha.com'
WHERE CustomerID = 2;

-- 3. Delete customers whose status is Inactive.
DELETE FROM Orders
WHERE CustomerID IN (
SELECT CustomerID FROM Customers WHERE Status = 'Inactive');


DELETE FROM Customers
WHERE Status = 'Inactive';

-- 4. Add a new column LoyaltyPoints INT with default 0 in Customers.
ALTER TABLE Customers ADD COLUMN LoyaltyPoints INT DEFAULT 0;

-- 5. Increase UnitPrice of Electronics products by 10 percent.
UPDATE Products
SET UnitPrice = UnitPrice * 1.10
WHERE Category = 'Electronics';

-- 6. Display all unique product categories.
SELECT DISTINCT Category FROM Products;

-- 7. Retrieve customers who joined between two given dates.
SELECT * FROM Customers WHERE JoinDate BETWEEN '2023-01-15' AND '2023-06-10';
SELECT * FROM Customers;
-- 8. List orders with TotalAmount between 1000 and 3000.
SELECT * FROM Orders WHERE TotalAmount BETWEEN 1000 AND 3000;

-- 9. Show top 5 most expensive products using ORDER BY and LIMIT.
SELECT * FROM Products ORDER BY UnitPrice DESC LIMIT 5;

-- 10. Count number of customers in each city.
SELECT City, COUNT(*) FROM Customers
GROUP BY City;

-- 11. Display cities having more than 3 stores.
SELECT City , COUNT(*)
FROM Stores
GROUP BY City
HAVING COUNT(*) > 3;

-- 12. Retrieve orders sorted by OrderDate descending.
SELECT * FROM Orders ORDER BY OrderDate DESC;

-- 13. Display all products whose ProductID is IN (101,105,106).
SELECT * FROM Products WHERE ProductID IN (1,5,6);

-- 14. Retrieve stores NOT IN ('Pune','Delhi').
SELECT * FROM Stores WHERE City NOT IN ('Pune','Delhi');

-- 15. Display upper-case version of customer names.
SELECT UPPER(CustName) FROM Customers;

-- 16. Show difference between today's date and JoinDate.
SELECT DATEDIFF(NOW(),JoinDate) FROM Customers;

-- 17. Show min, max, avg UnitPrice for each category.
SELECT MIN(UnitPrice) , MAX(UnitPrice) , AVG(UnitPrice) FROM Products;

-- 18. Compute total revenue generated by each store.
SELECT StoreID,SUM(TotalAmount) FROM Orders
GROUP BY StoreID;

-- 19. Display first 3 characters of product names.
SELECT LEFT(ProductName,3) FROM Products;

-- 20. Round off TotalAmount for all orders.
SELECT ROUND(TotalAmount) FROM Orders;

-- 21. Retrieve OrderID, CustName, StoreName, OrderDate using joins.
SELECT Orders.OrderID, Customers.CustName, Stores.StoreName, Orders.OrderDate
FROM Orders
LEFT JOIN Customers
ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Stores
ON Stores.StoreID = Orders.StoreID;


-- 22. List all products purchased by a specific customer using joins.
SELECT Products.ProductName, Orders.OrderID, Customers.CustName
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID 
LEFT JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID 
LEFT JOIN Products
ON Products.ProductID = OrderItems.ProductID 
WHERE Customers.CustomerID = 2;

-- 23. Get store-wise quantity sold for each product.
SELECT Stores.StoreName,SUM(OrderItems.Quantity)
FROM Orders
LEFT JOIN Stores
ON Stores.StoreID = Orders.StoreID
LEFT JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID
GROUP BY Stores.StoreName;

-- 24. Find customers who have not placed any orders.
SELECT Customers.CustomerID, Customers.CustName
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;


-- 25. Display StoreName and ManagerName for stores with card payments.
SELECT Stores.StoreName, Stores.ManagerName, Payments.PaymentMode
FROM Orders
LEFT JOIN Stores
ON Stores.StoreID = Orders.StoreID 
LEFT JOIN Payments
ON Orders.OrderID = Payments.OrderID
WHERE Payments.PaymentMode IN ('Card');


-- 26. Retrieve OrderID, PaymentMode, PaymentDate for all orders including unpaid ones.
SELECT Orders.OrderID, Payments.PaymentMode, Payments.PaymentDate
FROM Orders
LEFT JOIN Payments
ON Orders.OrderID = Payments.OrderID;


-- 27. Find product with highest UnitPrice.
SELECT ProductName,UnitPrice FROM Products
WHERE UnitPrice = ALL(SELECT MAX(UnitPrice) FROM Products);

-- 28. Retrieve customers whose JoinDate is earlier than the earliest JoinDate.


-- 29. Display store located in the same city as CustomerID 101.
SELECT StoreName,City FROM Stores
WHERE City = ANY (
SELECT City FROM Customers WHERE CustomerID = 1

);
-- 30. Retrieve orders whose TotalAmount is greater than average order value.
SELECT OrderID ,TotalAmount
FROM Orders
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);


-- 31. Retrieve products whose UnitPrice is greater than any product in Groceries.
SELECT ProductName,Category,UnitPrice FROM Products
WHERE UnitPrice > ANY(SELECT ProductName FROM Products WHERE Category IN ('Accessories'));

-- 32. List customers whose city matches any city containing a store.
SELECT CustName,City FROM Customers
WHERE City = ANY(SELECT City FROM Stores);

-- 33. Find orders for customers with status Active.
SELECT Orders.OrderID, Customers.CustName, Customers.Status 
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID 
WHERE Customers.Status = 'Active';

-- 34. Display stores where at least one order exceeds 5000.
SELECT Stores.StoreID ,Stores.StoreName, Orders.TotalAmount 
FROM Orders
LEFT JOIN Stores
ON Stores.StoreID = Orders.StoreID 
WHERE Orders.TotalAmount > 5000;

-- 35. Retrieve OrderItems for products belonging to categories returned by a subquery.
SELECT OrderItems.ItemID, Products.ProductName, Products.Category
FROM OrderItems
LEFT JOIN Products
ON Products.ProductID = OrderItems.ProductID
WHERE Products.Category IN (
SELECT Category FROM Products WHERE CAtegory IS NOT NULL);


-- 36. Reduce stock of a product inside a transaction and rollback if payment fails.
START TRANSACTION;

UPDATE Products
SET Stock = Stock - 50
WHERE ProductID = 6;

SELECT * FROM Products;
-- 37. Insert order, order items, and payment using a transaction and commit only if all succeed.


SELECT * FROM Payments;
START TRANSACTION;

INSERT INTO Orders VALUES (11,5,5,'2024-05-24',3600);
INSERT INTO OrderItems VALUES (11,11,6,2,3600);
INSERT INTO Payments VALUES (11,11,'UPI','2024-05-24',3600);
COMMIT;

-- 38. Attempt to delete a store with existing orders and observe constraint failure.
DELETE FROM Stores
WHERE StoreID IN (
SELECT StoreID FROM Orders WHERE OrderID = 5);

DELETE FROM Stores
WHERE StoreID = 1;


-- 39. Demonstrate SAVEPOINT usage while updating product records.
START TRANSACTION;

UPDATE Products
SET UnitPrice = UnitPrice + 120
WHERE ProductName = 'USB Cable';

SAVEPOINT update_unitprice;

-- 40. Reverse a customer’s last order using ROLLBACK.










USE testdb;
CREATE TABLE Books_info (
book_id VARCHAR(10),
title VARCHAR(30),
price DECIMAL(10,2),
publication_date DATE,
author_id VARCHAR(10),
author_name VARCHAR(30) );

INSERT INTO Books_info (book_id, title, price, publication_date, author_id, author_name) VALUES
('B001', 'The Silent River', 499.00, '2021-05-12', 'A001', 'Rahul Deshmukh'),
('B002', 'Shadows of Tomorrow', 350.00, '2020-11-08', 'A002', 'Anita Kulkarni'),
('B003', 'Python for Beginners', 599.00, '2022-02-25', 'A003', 'Sagar Patil'),
('B004', 'The Lost Kingdom', 450.00, '2019-08-17', 'A004', 'Meera Joshi'),
('B005', 'Data Science Made Easy', 750.00, '2023-03-10', 'A005', 'Vikram Shah'),
('B006', 'Journey to the Stars', 399.00, '2018-12-04', 'A006', 'Tanvi Rane'),
('B007', 'Modern Web Dev', 820.00, '2021-07-19', 'A007', 'Harish Nair'),
('B008', 'The Hidden Truth', 275.00, '2020-09-21', 'A008', 'Priya Sinha'),
('B009', 'ML Basics', 680.00, '2022-06-14', 'A009', 'Kunal Verma'),
('B010', 'The Art of Focus', 350.00, '2019-04-29', 'A010', 'Sneha Pandey'),
('B011', 'Digital Universe', 540.00, '2021-01-11', 'A011', 'Rohit Pawar'),
('B012', 'Cyber Security 101', 610.00, '2022-09-23', 'A012', 'Nikita Shetty'),
('B013', 'Mind Power Secrets', 320.00, '2019-06-30', 'A013', 'Yash Kulkarni'),
('B014', 'Deep Learning Start', 799.00, '2023-02-16', 'A014', 'Amol Desai'),
('B015', 'History of AI', 450.00, '2018-03-14', 'A015', 'Kiran Wagh'),
('B016', 'Startup Stories', 500.00, '2021-12-28', 'A016', 'Rutuja Khare'),
('B017', 'The Green Planet', 299.00, '2020-07-05', 'A017', 'Sameer Joshi'),
('B018', 'Cloud Computing Guide', 700.00, '2022-11-10', 'A018', 'Neha Bhosale'),
('B019', 'Mastering SQL', 650.00, '2023-04-01', 'A019', 'Ajay More'),
('B020', 'Think Like a Pro', 380.00, '2020-08-22', 'A020', 'Pooja Kamat');

CREATE TABLE Authors (
 author_id VARCHAR(10),
 author_name VARCHAR(30),
 book_id VARCHAR(10),
 book_name VARCHAR(30) );
 
 INSERT INTO Authors (author_id, author_name, book_id, book_name) VALUES
 ('A001','Rahul Deshmukh','B001', 'The Silent River'),
 ('A002', 'Anita Kulkarni','B002', 'Shadows of Tomorrow'),
 ('A003', 'Sagar Patil','B003', 'Python for Beginners'),
 ('A004', 'Meera Joshi','B004', 'The Lost Kingdom'),
 ('A005', 'Vikram Shah','B005', 'Data Science Made Easy'),
 ('A006', 'Tanvi Rane','B006', 'Journey to the Stars'),
 ('A007', 'Harish Nair','B007', 'Modern Web Dev'),
 ('A008', 'Priya Sinha','B008', 'The Hidden Truth'),
 ('A009', 'Kunal Verma','B009', 'ML Basics'),
 ('A010', 'Sneha Pandey','B010', 'The Art of Focus'),
 ('A011', 'Rohit Pawar','B011', 'Digital Universe'),
 ('A012', 'Nikita Shetty','B012', 'Cyber Security 101'),
 ('A013', 'Yash Kulkarni','B014', 'Deep Learning Start'),
 ('A014', 'Amol Desai','B014', 'Deep Learning Start'),
 ('A015', 'Kiran Wagh','B015', 'History of AI'),
 ('A016', 'Rutuja Khare','B016', 'Startup Stories'),
 ('A017', 'Sameer Joshi','B017', 'The Green Planet'),
 ('A018', 'Neha Bhosale','B018', 'Cloud Computing Guide'),
 ('A019', 'Ajay More','B019', 'Mastering SQL'),
 ('A020', 'Pooja Kamat','B020', 'Think Like a Pro') ;
 
 
 CREATE TABLE Orders (
 order_id VARCHAR(10),
 book_id VARCHAR(10),
 order_date DATE,
 quantity int,
 author_id VARCHAR(10) ); 

INSERT INTO Orders (order_id, book_id, order_date, quantity, author_id) VALUES
('R001', 'B001', '2024-01-05', 2, 'A001'),
('R002', 'B002', '2024-01-08', 1, 'A002'),
('R003', 'B003', '2024-01-12', 3, 'A003'),
('R004', 'B004', '2024-01-15', 1, 'A004'),
('R005', 'B005', '2024-01-18', 4, 'A005'),
('R006', 'B006', '2024-01-20', 2, 'A006'),
('R007', 'B007', '2024-01-23', 1, 'A007'),
('R008', 'B008', '2024-01-26', 2, 'A008'),
('R009', 'B009', '2024-01-29', 3, 'A009'),
('R010', 'B010', '2024-02-02', 1, 'A010'),
('R011', 'B011', '2024-02-04', 2, 'A011'),
('R012', 'B012', '2024-02-06', 1, 'A012'),
('R013', 'B013', '2024-02-09', 3, 'A013'),
('R014', 'B014', '2024-02-11', 2, 'A014'),
('R015', 'B015', '2024-02-13', 1, 'A015'),
('R016', 'B016', '2024-02-16', 2, 'A016'),
('R017', 'B017', '2024-02-18', 4, 'A017'),
('R018', 'B018', '2024-02-20', 1, 'A018'),
('R019', 'B019', '2024-02-22', 2, 'A019'),
('R020', 'B020', '2024-02-25', 3, 'A020');


-- Q.2 Write a SELECT statement to retrieve all books from the Books table. 
SELECT * FROM Books_info;

-- Q.3 Write a SELECT statement to retrieve books with a price greater than 20. 
SELECT * FROM Books_info WHERE price > 20;

-- Q.4 Write a SELECT statement to retrieve books with a publication date between
-- '2020-01-01' and '2020-06-30'. 

SELECT * FROM Books_info WHERE publication_date BETWEEN '2020-01-01' AND '2020-11-30';

-- Q.5 Write a SELECT statement to retrieve orders with a quantity greater than or equal to 2. 
SELECT * FROM Orders WHERE quantity >= 2;

-- Q.6. Write an UPDATE statement to update the price of a book with a book_id of 1. 
UPDATE Books_info SET price = 745 WHERE book_id = 'B001';

-- Q.7. Write a DELETE statement to delete an order with an order_id of 5. 

DELETE FROM Orders WHERE order_id = 'R005';

-- Q.8. Write a SELECT statement to retrieve books with a price less than 15. 
SELECT * FROM Books_info WHERE price < 15;

-- Q.9. Write a SELECT statement to retrieve orders with an order date greater than or
-- equal to '2020-03-01'.
SELECT * FROM Orders WHERE order_date <= '2020-08-01';

-- Q.10. Write a SELECT statement to retrieve books with a title not equal to 'Book 1'. 
SELECT * FROM Books_info WHERE title != 'The Silent River';

-- Q.11. Write a SELECT statement to retrieve authors with an author_id less than or equal to 2.
SELECT author_id FROM Books_info WHERE author_id <= 'A002';

-- Q.12. Write a SELECT statement to retrieve books with a price between 10 and 20. 
SELECT * FROM Books_info WHERE price BETWEEN 200 AND 300;

-- Q.13. Write a SELECT statement to retrieve orders with a quantity in (1, 2, 3). 
SELECT * FROM Orders WHERE quantity = 1 OR 2 OR 3;

-- Q.14. Write a SELECT statement to retrieve books with a publication date like '%2020%'. 
SELECT * FROM Books_info 
WHERE publication_date LIKE '%2020%';

-- Q.15. Write a SELECT statement to retrieve authors with an author_name starting with 'A'.

SELECT * FROM Authors WHERE author_name LIKE 'A%';


-- 16. Write an INSERT statement to add a new book to the Books table.
INSERT INTO Books_info VALUES ('B021', 'The Forest King', 365, '2024-08-23', 'A021', 'Yash Bhadane') ;


-- 17. Write an UPDATE statement to update the quantity of an order in the Orders table.
UPDATE Orders 
SET quantity = 5
WHERE order_id = 'R002';


-- 18. Write a DELETE statement to delete a book from the Books table.
DELETE FROM Books_info WHERE book_id = 'B005';


-- 19. Write a SQL query to retrieve the total number of books in the Books table.
SELECT COUNT(*) Total_books FROM Books_info;


-- 20. Write a SQL query to retrieve the average price of books in the Books table.
SELECT AVG(price) AS Average_price FROM Books_info;


-- 21. Write a SQL query to retrieve the maximum quantity of orders in the Orders table.
SELECT max(quantity) AS Max_quantity FROM Orders;



-- 22. Write a SQL query to retrieve the minimum publication date of books in the Books table.
SELECT min(publication_date) AS min_date FROM Books_info;



-- 23. Write a GRANT statement to grant SELECT privilege to bookstore_user on the Orders table.
CREATE USER 'Bookstore_user1'@'localhost' IDENTIFIED BY 'user1@12';
GRANT SELECT ON testdb.Orders TO 'Bookstore_user1'@'localhost';


-- 24. Write a REVOKE statement to revoke INSERT privilege from bookstore_user on the Books table. 
REVOKE INSERT ON testdb.Orders FROM 'Bookstore_user1'@'localhost';












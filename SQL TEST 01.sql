CREATE DATABASE tco_company_db;
USE tco_company_db;

CREATE TABLE department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);

CREATE TABLE employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary DECIMAL(10,2),
join_date DATE,
status VARCHAR(20),
FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE project (
project_id INT PRIMARY KEY,
project_name VARCHAR(50),
dept_id INT,
start_date DATE,
budget DECIMAL(10,2),
FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department VALUES 
(10,'HR','Pune'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Markating','Delhi');

INSERT INTO employee VALUES
(101,'Arav',20,75000,'2021-06-15','Active'),
(102,'Neha',10,50000,'2020-03-10','Active'),
(103,'Karan',30,68000,'2019-11-01','Inactive'),
(104,'Riya',20,82000,'2022-01-20','Active'),
(105,'Manish',40,60000,'2018-07-25','Active'),
(106,'Sneha',10,48000,'2023-02-14','Active'),
(107,'Vikram',30,90000,'2017-09-05','Inactive');

INSERT INTO project VALUES
(201,'HR Analytics',10,'2023-01-01',300000),
(202,'AI Platform',20,'2022-08-15',1200000),
(203,'Budget Planning',30,'2021-04-10',400000)
;

-- Q.1
SELECT salary ,AVG(salary) AS avg_salary
FROM employee
WHERE join_date < '2021-01-01'
GROUP BY salary
HAVING salary > AVG(salary);


-- Q.2
SELECT dept_id, SUM(salary) , AVG(salary)
FROM employee
GROUP BY dept_id
HAVING SUM(salary) > AVG(salary);

-- Q.3
SELECT emp_name, dept_id, salary
FROM employee 
WHERE salary > ANY (SELECT MIN(salary) FROM employee);

-- Q.4 
SELECT emp_name,dept_id, salary, AVG(salary)
FROM employee
GROUP BY emp_name 
HAVING salary > AVG(salary);

-- Q.5 
SELECT dept_id, emp_name,  
 
 
-- Q.6
SELECT emp_name, LENGTH(emp_name), AVG(LENGTH(emp_name))
FROM employee
GROUP BY emp_name
HAVING LENGTH(emp_name) > AVG(LENGTH(emp_name)) ;

-- Q.7
SELECT dept_id,emp_name, salary , ROUND(salary) , AVG(ROUND(salary))
FROM employee
GROUP BY dept_id
HAVING ROUND(salary) = AVG(ROUND(salary)) ;

-- Q.21
SELECT emp_name, salary, dept_id
FROM employee e
WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id GROUP BY dept_id);

-- Q.22 
SELECT emp_name, dept_id, salary FROM employee WHERE salary > 50000;

-- Q.23
SELECT dept_id, emp_name , salary
FROM employee
WHERE salary = ANY (
SELECT MAX(salary) FROM employee
);

-- Q.24
SELECT 


-- Q.27
START TRANSACTION;
DELETE FROM employee WHERE join_date < '2019-01-01';
SAVEPOINT S1;
ROLLBACK TO s1;
COMMIT;

-- Q.16
SELECT emp_name, dept_id, salary
FROM employee
WHERE salary > ALL (SELECT salary FROM employee WHERE dept_id = 10);

-- Q.26
START TRANSACTION;
UPDATE employee
SET salary = salary * 0.10
WHERE dept_id = 20;

ROLLBACK;


-- Q.18
SELECT emp_name, dept_id, salary
FROM employee
WHERE salary = ANY (SELECT MAX(salary) FROM employee);


-- Q.20
SELECT emp_name,salary,dept_id
FROM employee
WHERE salary < ALL(SELECT AVG(salary) FROM employee GROUP BY dept_id);


-- Q.19
SELECT emp_name, join_date
FROM employee
WHERE join_date < (SELECT MIN(join_date) FROM employee WHERE join_date < 
( SELECT MIN(join_date) FROM employee WHERE dept_id = 30)); 


-- Q.30
START TRANSACTION;
UPDATE employee
SET salary = salary * 0.10
WHERE dept_id = 20;

SAVEPOINT s2;
ROLLBACK;


-- Q.
SELECT emp_name,salary,dept_id
FROM employee
WHERE salary < ALL(SELECT AVG(salary) FROM employee GROUP BY dept_id);











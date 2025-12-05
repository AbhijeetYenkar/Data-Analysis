-- HOSPITAL DATABASE — SQL ASSIGNMENT
CREATE DATABASE Hospital;
USE Hospital;

-- Tables & Columns:
-- Patients: patient_id, name, age, gender, disease, doctor_id.
-- Doctors: doctor_id, doctor_name, specialization, department_id
-- Departments: department_id, dept_name
-- Appointments: appointment_id, patient_id, doctor_id, appointment_date, fees
-- Medical_Records: record_id, patient_id, diagnosis, bill_amount, admission_date


-- Q1. Create the table Patients with the above structure.
CREATE TABLE Patients(
patient_id INT PRIMARY KEY, 
p_name VARCHAR(30),
age int,
gender VARCHAR(10),
disease VARCHAR(25),
doctor_id int
);

-- Q2. Create the Doctors table with the given columns.
CREATE TABLE Doctors (
doctor_id int,
doctor_name VARCHAR(30),
specialization VARCHAR(25),
department_id int
);
ALTER TABLE Doctors MODIFY COLUMN doctor_id INT PRIMARY KEY;

-- Q3. Create the Departments table using department_id as primary key.
CREATE TABLE Departments (
department_id INT PRIMARY KEY,
dept_name VARCHAR(25)
);


-- Q4. Create the Appointments table linked to patient_id and doctor_id as foreign keys.
CREATE TABLE Appointments (
appointment_id INT PRIMARY KEY,
patient_id INT,
doctor_id INT,
appointment_date DATE,
fees DECIMAL(10,2),
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);


-- Q5. Create the Medical_Records table with record_id as the primary key.
CREATE TABLE Medical_Records (
record_id INT PRIMARY KEY,
patient_id INT,
diagnosis VARCHAR(30),
bill_amount DECIMAL(10,2),
admission_date DATE
);


-- Q6. Alter the Patients table to add a new column phone_number.
ALTER TABLE Patients ADD COLUMN phone_number INT;

-- Q7. Modify the data type of doctor_name in Doctors table.
ALTER TABLE Doctors MODIFY doctor_name VARCHAR(35);

-- Q8. Drop the column gender from Patients table.
ALTER TABLE Patients DROP COLUMN gender;

-- Q9. Rename the table Medical_Records to Patient_Records.
RENAME TABLE Medical_Records TO Patient_Records;

-- Q10. Add a NOT NULL constraint to the disease column in Patients.
ALTER TABLE Patients MODIFY disease VARCHAR(30) NOT NULL;

-- Q11. Insert one complete record into the Patients table.
-- Patients: patient_id, name, age, gender, disease, doctor_id.
SELECT * FROM Patients;
ALTER TABLE Patients
MODIFY phone_number VARCHAR(15);

INSERT INTO Patients (patient_id, p_name, age, disease, doctor_id,phone_number) VALUES (1,'Yash Bhadane',21,'Corona',1,'7778889991');
INSERT INTO Patients (patient_id, p_name, age, disease, doctor_id,phone_number) VALUES 
(2, 'Amit Sharma', 45, 'Fever', 2, '9876543210'),
(3, 'Rohan Patil', 32, 'Diabetes', 3, '9988776655'),
(4, 'Sneha Kulkarni', 28, 'Migraine', 4, '9090909090'),
(5, 'Priya Deshmukh', 39, 'Fracture', 5, '8080808080'),
(6, 'Rahul Tiwari', 50, 'Asthma', 2, '9001234567'),
(7, 'Meera Joshi', 29, 'Allergy', 1, '9812345678'),
(8, 'Sagar Jadhav', 41, 'Heart Pain', 3, '9123456789'),
(9, 'Neha Shinde', 34, 'Skin Infection', 4, '9998887776'),
(10, 'Aditya Pawar', 55, 'Blood Pressure', 5, '7008009001');

-- Q12. Insert three doctors into the Doctors table.
-- Doctors: doctor_id, doctor_name, specialization, department_id
INSERT INTO Doctors (doctor_id, doctor_name, specialization, department_id) VALUES
(1, 'Dr. Arjun Mehta', 'Cardiology', 1),
(2, 'Dr. Priya Sharma', 'Neurology', 2),
(3, 'Dr. Rohan Kulkarni', 'Orthopedics', 3)
;

INSERT INTO Doctors (doctor_id, doctor_name, specialization, department_id) VALUES
(4, 'Dr. Sneha Patil', 'Dermatology', 4),
(5, 'Dr. Vivek Singh', 'Pediatrics', 5);

-- Q13. Insert a new department called ‘Radiology’.
-- Departments: department_id, dept_name
INSERT INTO Departments (department_id,dept_name) VALUES (4,'Radiology');


-- Q14. Insert an appointment with today’s date and fees = 500.
-- Appointments: appointment_id, patient_id, doctor_id, appointment_date, fees

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, fees) VALUES 
(101,1,3,'2025-11-24',500);
INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, fees) VALUES
(102, 2, 1, '2025-11-25', 600),
(103, 3, 2, '2025-11-26', 450),
(104, 4, 4, '2025-11-27', 700),
(105, 5, 5, '2025-11-28', 550),
(106, 6, 2, '2025-11-29', 800),
(107, 7, 1, '2025-11-30', 400),
(108, 8, 3, '2025-12-01', 650),
(109, 9, 4, '2025-12-02', 750),
(110, 10, 5, '2025-12-03', 900);

-- Q15. Update the doctor_id of a patient whose patient_id = 3.
UPDATE Appointments
SET doctor_id = 5
WHERE patient_id = 3;

-- Q16. Update the fees of all appointments to increase them by 10%.
UPDATE Appointments
SET fees = fees * 1.10;


-- Q17. Delete the patient whose name is ‘Rohan’.
DELETE FROM Patients WHERE p_name = 'Rohan Patil';
SELECT * FROM Appointments WHERE patient_id = 3;
DELETE FROM Appointments WHERE patient_id = 3;


SELECT * FROM Patients;
-- Q18. Delete all appointments where fees are less than 300.
DELETE FROM Appointments WHERE fees < 300;

-- Q19. Insert a medical record for patient_id = 2 with diagnosis = ‘Flu’.
-- Medical_Records: record_id, patient_id, diagnosis, bill_amount, admission_date

INSERT INTO Patient_Records (record_id, patient_id, diagnosis, bill_amount, admission_date
) VALUES (1,2,'Flu',2500,'2025-09-14');

INSERT INTO Patient_Records (record_id, patient_id, diagnosis, bill_amount, admission_date
) VALUES
(2, 3, 'Free Checkup', 100, '2025-09-15'),
(3, 4, 'Fracture', 4500, '2025-09-16'),
(4, 1, 'Free Checkup', 100, '2025-09-17'),
(5, 5, 'Asthma', 3200, '2025-09-18'),
(6, 7, 'Free Checkup', 100, '2025-09-19'),
(7, 6, 'Infection', 1800, '2025-09-20'),
(8, 8, 'Free Checkup', 100, '2025-09-21'),
(9, 9, 'Diabetes', 5000, '2025-09-22'),
(10, 10, 'Free Checkup', 100, '2025-09-23');

-- Q20. Update bill_amount to 0 for all records where diagnosis = ‘Free Checkup’.
UPDATE Patient_Records
SET bill_amount = 0
WHERE diagnosis = 'Free Checkup';

SELECT * FROM Patient_Records;
-- Q21. Create a new user named hospital_admin.
CREATE USER 'hospital_admin'@'localhost' IDENTIFIED BY 'admin1';

-- Q22. Grant SELECT and INSERT privileges on Patients table to hospital_admin.

GRANT SELECT,INSERT ON Hospital.Patients TO 'hospital_admin'@'localhost';

-- Q23. Grant UPDATE privilege on Doctors table to hospital_admin.
GRANT UPDATE ON Hospital.Doctors TO 'hospital_admin'@'localhost';

-- Q24. Revoke INSERT privilege on Patients from hospital_admin.
REVOKE INSERT ON Hospital.Patients FROM 'hospital_admin'@'localhost';


-- Q25. Grant ALL privileges on Appointments table to hospital_admin.
GRANT ALL PRIVILEGES ON Hospital.Appointments TO 'hospital_admin'@'localhost';

-- Q26. Start a transaction and insert two new patient records.
START TRANSACTION;
INSERT INTO Patients (patient_id, p_name, age, disease, doctor_id,phone_number) VALUES 
(11, 'Kiran Patil', 36, 'Cold', 2, '9001112233'),
(12, 'Tina Sharma', 29, 'Fever', 3, '9002223344');
COMMIT;

-- Q27. Update the fees of appointment_id = 5, then rollback.
START TRANSACTION;
UPDATE Appointments
SET fees = 5400
WHERE appointment_id = 5;

ROLLBACK;

-- Q28. Delete a doctor record inside a transaction and then commit.
START TRANSACTION;
DELETE FROM Doctors WHERE doctor_id = 4;
DELETE FROM Appointments WHERE doctor_id  = 4;
COMMIT;

-- Q29. Insert a medical record and save the change using SAuVEPOINT.
START TRANSACTION;
INSERT INTO Patient_Records VALUES (11, 5, 'Asthma', 2540, '2025-02-15');
SAVEPOINT s1


-- Q30. Undo the last operation after SAVEPOINT using ROLLBACK TO.
ROLLBACK TO s1;


-- Q31. Display all patients whose age > 50.
SELECT * FROM Patients WHERE age > 50;

-- Q32. List all doctors whose specialization = ‘Cardiology’.
SELECT * FROM Doctors WHERE specialization = 'Cardiology';

-- Q33. Show all appointments where fees > 1000.
SELECT * FROM Appointments WHERE fees > 1000;


-- Q34. Show patient name and disease where disease = ‘Diabetes’.
SELECT * FROM Patients WHERE disease = 'Diabetes';


-- Q35. Display all departments with department_id > 2.
SELECT * FROM Departments WHERE department_id > 2;


-- Q36. Show details of appointments done on a specific date.
SELECT * FROM Appointments WHERE appointment_date = '2025-11-30';


-- Q37. List all medical records where bill_amount > 5000.
SELECT * FROM Patient_Records WHERE bill_amount > 5000;

-- Q38. Show all patients assigned to doctor_id = 4.
SELECT * FROM Patients WHERE doctor_id = 4;

-- Q39. Display appointments for patient_id = 10.
SELECT * FROM Appointments WHERE patient_id = 10;

-- Q40. Show all records where diagnosis = ‘Fracture’.
SELECT * FROM Patient_Records WHERE diagnosis = 'Fracture';

-- 1. Display the distinct list of patient cities from the Patients table.
ALTER TABLE Patients ADD COLUMN p_city VARCHAR(20);
UPDATE Patients
SET p_city = 'Amravati'
WHERE patient_id = 12;

SELECT p_city FROM Patients;


-- 2. Find all distinct doctor specializations.
SELECT DISTINCT specialization FROM Doctors;

-- 3. Show distinct appointment statuses.
ALTER TABLE Appointments ADD COLUMN a_status VARCHAR(20);
UPDATE Appointments
SET a_status = 'Completed'
WHERE appointment_id = 109;



SELECT * FROM Appointments;
SELECT DISTINCT a_status FROM Appointments;

-- 4. Display patients whose age is between 30 and 50.
SELECT * FROM patients WHERE age BETWEEN 30 AND 50;


-- 5. Display bills where total_amount is between 5000 and 15000.
SELECT * FROM Patient_Records WHERE bill_amount BETWEEN 5000 AND 15000;

SELECT * FROM Patient_Records;

-- 6. Select doctors whose experience is not between 5 and 15 years.
ALTER TABLE Doctors ADD COLUMN d_experience INT;
UPDATE Doctors
SET d_experience = 4
WHERE doctor_id = 5;

SELECT * FROM Doctors WHERE d_experience NOT BETWEEN 5 AND 15;


SELECT * FROM Doctors;

-- 7. Show appointments scheduled between '2024-01-01' and '2024-02-01'.
SELECT * FROM Appointments WHERE appointment_date BETWEEN '2024-01-01' AND '2024-02-01';

SELECT * FROM Appointments;
-- 8. Display patients whose city is IN ('Pune','Mumbai','Delhi').
SELECT * FROM Patients WHERE p_city IN ('Pune','Mumbai','Delhi');

-- 9. Display doctors whose specialization is IN ('Cardiology','Neurology').
SELECT * FROM Doctors WHERE specialization IN ('Cardiology','Neurology');

-- 10. Show appointments where status is NOT IN ('Cancelled','Rescheduled').
SELECT * FROM Appointments WHERE a_status NOT IN ('Cancelled','Rescheduled');


-- 11. Show departments where the department_name is NOT IN ('ICU','Emergency').
INSERT INTO Departments VALUES 
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(5, 'Dermatology'),
(6, 'Radiology'),
(7, 'ICU'),
(8, 'Emergency'),
(9, 'Pediatrics'),
(10, 'Oncology');

SELECT * FROM Departments WHERE dept_name NOT IN ('ICU','Emergency');

-- 12. Display all patients ordered by age ascending.
SELECT * FROM Patients ORDER BY age ASC;

-- 13. Display all doctors ordered by experience descending.
SELECT * FROM Doctors ORDER BY d_experience DESC;

-- 14. Show appointments ordered by appointment_date descending.
SELECT * FROM Appointments ORDER BY appointment_date DESC;

-- 15. Display billing records ordered by total_amount ascending.
SELECT * FROM Patient_Records ORDER BY bill_amount DESC;

-- 16. Count the number of patients in each city.
SELECT p_city, COUNT(*) AS total_city FROM Patients GROUP BY p_city;

-- 17. Show number of doctors in each specialization.
SELECT specialization , COUNT(*) AS t_specia FROM Doctors GROUP BY specialization;

-- 18. Show total billing amount generated by each patient.
SELECT bill_amount , 

-- 19. Show number of appointments per doctor.
SELECT doctor_id ,COUNT(*) AS t_appo FROM Appointments GROUP BY doctor_id;

-- 20. Show departments where the number of doctors > 5.
INSERT INTO Doctors VALUES 
(6, 'Dr. Sameer Joshi', 'Cardiology', 1, 12),
(7, 'Dr. Rina Shah', 'Neurology', 2, 9),
(8, 'Dr. Aditya Mehta', 'Orthopedics', 3, 7),
(9, 'Dr. Kavita Deshmukh', 'Dermatology', 5, 10),
(10, 'Dr. Arjun Patil', 'Radiology', 6, 6);

SELECT department_id , COUNT(*) AS total_doc 
FROM Doctors 
GROUP BY department_id 
HAVING COUNT(*) > 5;

-- 21. Show cities where patient count is greater than 10.
SELECT p_city , COUNT(*) AS city_count
FROM Patients 
GROUP BY p_city
HAVING COUNT(*) > 1;

-- 22. Show doctors grouped by specialization where average experience is more than 7 years.
SELECT specialization, AVG(d_experience) AS avg_exp
FROM Doctors 
GROUP BY specialization
HAVING AVG(d_experience) > 7;

-- 23. Display the first 5 patients from the Patients table.
SELECT * FROM Patients LIMIT 5;

-- 24. Display the first 10 appointments.
SELECT * FROM Appointments LIMIT 10;

-- 25. Display 5 patients after skipping first 5.
SELECT * FROM Patients LIMIT 5 OFFSET 5;

-- 26. Display 10 billing records after skipping first 2.
SELECT bill_amount FROM Patient_RecordS LIMIT 10 OFFSET 2;

-- 27. Show the top 5 highest bill amounts.
SELECT bill_amount FROM Patient_Records ORDER BY bill_amount DESC LIMIT 5;

-- 28. Display doctor list with 10 records after skipping first 10.
SELECT * FROM Doctors LIMIT 10 OFFSET 10;

-- 29. Show appointments for doctors with specialization IN ('Orthopedic','Dermatology') ordered by appointment_date.
ALTER TABLE Appointments ADD COLUMN specialization VARCHAR(25);
UPDATE Appointments
SET specialization = 'Rediology'
WHERE doctor_id = 10;

SELECT * FROM Appointments WHERE specialization IN ('Orthopedic', 'Dermatology')
ORDER BY appointment_date;


-- 30. Group bills by payment_status and display groups having total count > 3.
SELECT * FROM Patient_Records;
ALTER TABLE Patient_Records
ADD COLUMN payment_status VARCHAR(15);

UPDATE Patient_Records
SET payment_status ='PAID'
WHERE record_id = 7;

SELECT payment_status, COUNT(*) AS total_records
FROM Patient_Records
GROUP BY payment_status
HAVING COUNT(*) > 3;



-- 31. Show cities with patient count between 5 and 15.
SELECT p_city , COUNT(*)  AS total_city
FROM Patients
GROUP BY p_city
HAVING COUNT(*) BETWEEN 5 AND 15;

-- 32. Display top 3 patients who have the highest total billing amount.
SELECT * FROM Patient_Records ORDER BY bill_amount DESC LIMIT 3;


-- 33. Show departments ordered alphabetically, skip first 2 and display next 4.
SELECT * FROM Departments ORDER BY dept_name ASC LIMIT 4 OFFSET 2;

-- 34. Display all appointments where appointment_time is NOT BETWEEN '10:00' and '17:00', ordered by appointment_time.
ALTER TABLE Appointments ADD COLUMN appointment_time TIME;
UPDATE Appointments
SET appointment_time = '20:06:00'
WHERE appointment_id = 110;

SELECT * FROM Appointments
WHERE appointment_time NOT BETWEEN '10:00:00' AND '17:00:00'
ORDER BY appointment_time;


SELECT * FROM Appointments; 

-- 35. Display the distinct cities of patients, ordered alphabetically, only first 3.
SELECT DISTINCT p_city FROM Patients ORDER BY p_city ASC LIMIT 3;



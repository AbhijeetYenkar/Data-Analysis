-- 1. Create a database named HotelDB.
CREATE DATABASE hotelDB;
USE hotelDB;
-- 2. Create a table Rooms with columns: room_id, room_type, price_per_night, status.

CREATE TABLE Rooms (
room_id VARCHAR(10),
room_type VARCHAR(20),
price_per_night int,
status VARCHAR(20)
);

-- 3. Create a table Guests with columns: guest_id, full_name, phone, email.
CREATE TABLE Guests (
guest_id VARCHAR(10),
full_name VARCHAR(30),
phone VARCHAR(15),
email VARCHAR(20)
);

-- 4. Create a table Bookings with columns: booking_id, guest_id, room_id,
-- check_in_date, check_out_date, total_amount.
CREATE TABLE Bookings (
booking_id VARCHAR(10),
guest_id VARCHAR(10),
room_id VARCHAR(10),
check_in_date DATE,
check_out_date DATE,
total_amount DECIMAL
);

-- 5. Add a new column payment_status to Bookings
ALTER TABLE Bookings ADD COLUMN payment_status VARCHAR(20);

-- 6. Modify the size of column status in Rooms.
ALTER TABLE Rooms MODIFY COLUMN status VARCHAR(30);

-- 7. Remove the column phone from Guests.
ALTER TABLE Guests DROP COLUMN phone;

-- 8. Create a table Staff with columns staff_id, staff_name, role.
CREATE TABLE Staff (
staff_id VARCHAR(10),
staff_name VARCHAR(30),
role VARCHAR(20)
);

-- 9. Drop the table Staff.
DROP TABLE Staff;

-- SECTION 2 – DML
-- Q10. Insert 5 sample records into Rooms.
INSERT INTO Rooms(room_id,room_type,price_per_night,status)
VALUES
('R101', 'Deluxe', 3000, 'Available'),
('R102', 'Suite', 8000, 'Available'),
('R103', 'Standard', 2000, 'Occupied'),
('R104', 'Deluxe', 3200, 'Available'),
('R105', 'Suite', 8500, 'Occupied');

-- Q11. . Insert 5 sample records into Guests
INSERT INTO Guests(guest_id,full_name,email)
VALUES
('G001', 'Amit Sharma', 'amit@gmail.com'),
('G002', 'Priya Mehta', 'priya@gmail.com'),
('G003', 'Rohan Desai', 'rohan@gmail.com'),
('G004', 'Sneha Kulkarni', 'sneha@gmail.com'),
('G005', 'Vikas Patil', 'vikas@gamil.com');


-- Q12. Insert 5 sample records into Bookings.
INSERT INTO Bookings (booking_id, guest_id, room_id, check_in_date, check_out_date, total_amount, payment_status)
VALUES
('B001', 'G001', 'R101', '2025-11-01', '2025-11-05', 17020, 'PENDING'),
('B002', 'G002', 'R102', '2025-11-10', '2025-11-12', 15000, 'PAID'),
('B003', 'G003', 'R103', '2025-11-15', '2025-11-18', 13000, 'PENDING'),
('B004', 'G004', 'R104', '2023-11-20', '2025-11-22', 6450, 'PENDING'),
('B005', 'G005', 'R105', '2025-11-25', '2025-11-28', 6200, 'PAID');

-- 13. Update status of all rooms where room_type = 'Deluxe'.
UPDATE Rooms
SET status = 'Available'
WHERE room_type = 'Deluxe';

-- 14. Increase price_per_night of Suite rooms by 500.
UPDATE Rooms
SET price_per_night = price_per_night + 500
WHERE room_type = 'Suite';

-- 15. Delete the guest record where guest_id = 3.
DELETE FROM Guests WHERE guest_id = 'G003';

-- 16. Update payment_status to 'PAID' for booking_id = 2.
UPDATE Bookings
SET payment_status = 'PAID'
WHERE booking_id = 'B002';

-- SECTION 3 – DQL (SELECT + WHERE Only)
-- 17. Select all rooms where status = 'Available'.
SELECT * FROM Rooms WHERE status = 'Available';

-- 18. Select guest details where full_name = 'Amit Sharma'.
SELECT * FROM Guests WHERE full_name = 'Amit Sharma';

-- 19. Select all bookings where payment_status = 'Pending'.
SELECT * FROM Bookings WHERE payment_status = 'Pending';

-- 20. Select room details where room_type = 'Suite'.
SELECT * FROM Rooms WHERE room_type ='Suite'; 

-- 21. Fetch guest details where email = 'abc@gmail.com'.
SELECT * FROM Guests WHERE email = 'abc@gmail.com';

-- 22. Select bookings where total_amount > 8000.
SELECT * FROM Bookings WHERE total_amount > 8000;

-- 23. Select rooms where price_per_night < 4000.
SELECT * FROM Rooms WHERE price_per_night < 4000;

-- 24. Display bookings where room_id = 101.
SELECT * FROM Bookings WHERE room_id = 'R101';

-- 25. Select guests where guest_id > 2.
SELECT * FROM Guests WHERE guest_id > 'G002'; 

-- 26. Select rooms where price_per_night = 5000.
SELECT * FROM Rooms WHERE price_per_night = 5000;


-- 27. Select bookings where check_in_date = '2024-02-01'.
SELECT * FROM Bookings WHERE check_in_date = '2024-02-01';

-- 28. Select guests where full_name = 'Roshni Yadav'.
SELECT * FROM Guests WHERE full_name = 'Roshni Yadav';

-- SECTION 4 – DCL
-- 29. Create a user hotel_user with password "hotel123".
CREATE USER 'hotel_user1'@'localhost' IDENTIFIED BY 'user1';

-- 30. Grant SELECT permission on all tables to hotel_user.
GRANT SELECT ON hotelDB.* TO 'hotel_user1'@'localhost';



-- 31. Revoke SELECT permission from hotel_user.
REVOKE SELECT ON hotelDB.* FROM 'hotel_user1'@'localhost';


-- SECTION 5 – TCL
-- 32. Begin a transaction and update price of all rooms to 4500, then ROLLBACK.
START TRANSACTION ;
UPDATE Rooms
SET price_per_night = 4500;

ROLLBACK ;

-- 33. Begin a transaction and insert a new guest record, then COMMIT.
START TRANSACTION ;
INSERT INTO Guests(guest_id,full_name,email) 
VALUES ('G006','Yash Bhadane','yash@gmail.com');
COMMIT;


-- 34. Delete all records in Bookings inside a transaction, then ROLLBACK.
START TRANSACTION ;
DELETE FROM Bookings;
ROLLBACK;

-- SECTION 6 – Additional WHERE Clause Practice
-- 35. Select rooms where status = 'Occupied'.
SELECT * FROM Rooms WHERE status = 'Occupied';

-- 36. Select bookings where total_amount >= 10000.
SELECT * FROM Bookings WHERE total_amount >= 10000;

-- 37. Select guests where email = 'xyz@yahoo.com'.
SELECT * FROM Guests WHERE email = 'xyz@yahoo.com';

-- 38. Select rooms where room_type = 'Deluxe'.
SELECT * FROM Rooms WHERE room_type = 'Deluxe';

-- 39. Select bookings where booking_id = 1.
SELECT * FROM Bookings WHERE booking_id = 'B001';

-- 40. Select guests where guest_id = 5.
SELECT * FROM Guests WHERE guest_id = 'G005';

-- mysql -h localhost -u root -p
--1 point each for the two insert statements
-- Insert statement 1
INSERT INTO Employee VALUES ('1002','Mogens','Tangoe');
-- Insert statement 2
INSERT INTO Employee VALUES ('1003','Johnnie','Vigil');
SELECT * FROM Employee;

--1 point each for the two update statements
-- Update statement 1
SELECT * FROM part_quantity;
UPDATE part_quantity
SET  part_id = 'PI-0001'
WHERE Item_Number='AS-00006';
SELECT * FROM part_quantity;
-- Update statement 2
SELECT * FROM incoming_inventory_control;
UPDATE incoming_inventory_control
SET Receipt_Date = '2024-02-26'
WHERE Incoming_ID='1001';
SELECT * FROM incoming_inventory_control;

--1 point for the delete statement
-- Delete statement
SELECT * FROM Employee;
DELETE FROM Employee
WHERE Emp_ID='1006';
SELECT * FROM Employee;

--1 point for the simple select statement
-- Simple select statement
SELECT * FROM Employee; 
-- OR
SELECT Emp_ID , First_Name , Last_Name FROM Employee; 


--2 points each for the 2 join statements
-- Select statement with inner join
SELECT Quality.Quality_ID,Quality.Date,Quality.Emp_ID,Quality.Employee_Emp_ID, Employee.Emp_ID, Employee.First_Name, Employee.Last_Name
FROM Quality INNER JOIN Employee ON Quality.Emp_ID = Employee.Emp_ID;

-- Select statement with left join
SELECT Purchase_Order.PO_Number,Purchase_Order.Date,Purchase_Order.Vendor_ID,Purchase_Order.Item_Number,Purchase_Order.Vendor_List_Vendor_ID,Vendor_List.Vendor_ID,Vendor_List.Vendor_Name,Vendor_List.Description
FROM Purchase_Order
LEFT JOIN Vendor_List ON Purchase_Order.Vendor_ID = Vendor_List.Vendor_ID;

--2 points each for the two that use summary statements
-- Summary function 1
SELECT SUM(Total_PO_Price), AVG(Total_PO_Price), COUNT(*)
FROM purchase_order
WHERE Price_per_part > '2';

-- Summary function 2
SELECT MAX( Price_per_part), MIN( Price_per_part)
FROM purchase_order
WHERE Price_per_part > '2';

--2 points for the multi-table query
-- Multi-table query
SELECT Vendor_List.Vendor_ID,Vendor_List.Vendor_Name,Vendor_List.Description, Purchase_Order.Vendor_ID,Purchase_Order.Quantity_Ordered,Purchase_Order.Total_Price_of_Parts,Incoming_Inventory_Control.Emp_ID,Incoming_Inventory_Control.Vendor_ID,Incoming_Inventory_Control.Total_Item_Quantity_Received
FROM Vendor_List
INNER JOIN Purchase_Order ON Vendor_List.Vendor_ID = Purchase_Order.Vendor_ID
INNER JOIN Incoming_Inventory_Control ON Purchase_Order.Vendor_ID = Incoming_Inventory_Control.Vendor_ID;

--2 points for the query of your choice.
-- Your chosen query
SELECT Purchase_Order_Number, COUNT(*)
FROM  incoming_inventory_control
GROUP BY Expiration_Date 
ORDER BY COUNT(*) DESC;


--Indexes
SHOW INDEXES FROM Vendor_List;
SHOW INDEXES FROM Purchase_Order;
SHOW INDEXES FROM Incoming_Inventory_Control;
CREATE INDEX idx_Vendor_Name on Vendor_List(Vendor_Name);
CREATE INDEX idx_Total_Price_of_Parts on Purchase_Order(Total_Price_of_Parts);
CREATE INDEX idx_Total_Item_Quantity_Received on Incoming_Inventory_Control(Total_Item_Quantity_Received);
SHOW INDEXES FROM Purchase_Order;
SHOW INDEXES FROM Incoming_Inventory_Control;
EXPLAIN SELECT Vendor_List.Vendor_Name,Vendor_List.Description, Purchase_Order.PO_Number,Purchase_Order.Total_Price_of_Parts,Incoming_Inventory_Control.Incoming_ID,Incoming_Inventory_Control.Vendor_ID,Incoming_Inventory_Control.Total_Item_Quantity_Received 
FROM Vendor_List 
INNER JOIN Purchase_Order ON Vendor_List.Vendor_ID = Purchase_Order.Vendor_ID 
INNER JOIN Incoming_Inventory_Control ON Purchase_Order.Vendor_ID = Incoming_Inventory_Control.Vendor_ID;


--Views
-- View 1: Combined data from Vendor_List and Purchase_Order tables
CREATE VIEW Vendor_Purchase_View AS
SELECT v.Vendor_ID, v.Vendor_Name, v.Description, p.PO_Number, p.Quantity_Ordered, p.Price_per_part
FROM Vendor_List v
INNER JOIN Purchase_Order p ON v.Vendor_ID = p.Vendor_ID;

-- View 2: Combined data from Incoming_Inventory_Control and Receiving_Status
CREATE VIEW Incoming_Receiving_View AS
SELECT i.Incoming_ID, i.Emp_ID, i.Receipt_Date, i.Vendor_ID, i.Lot_Number, i.Expiration_Date,
       r.Receiving_Status_ID, r.Receiving_Status, r.Description
FROM Incoming_Inventory_Control i
INNER JOIN Receiving_Status r ON i.Incoming_ID = r.Incoming_Inventory_Control_Incoming_ID;

--Security
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
CREATE USER 'analyst'@'localhost' IDENTIFIED BY 'analyst';
CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'app';
SELECT USER, AUTHENTICATION_STRING, HOST FROM MYSQL.USER;
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'admin'@'localhost';
GRANT SELECT ON MEDICAL_DEVICE_STARTUP.* TO 'analyst'@'localhost' ;
SHOW GRANTS FOR 'analyst'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON MEDICAL_DEVICE_STARTUP.incoming_receiving_view TO 'app_user'@'localhost';
SHOW GRANTS FOR 'app_user'@'localhost';
FLUSH PRIVILEGES;

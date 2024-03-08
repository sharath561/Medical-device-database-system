USE medical_device_startup;
SELECT * FROM incoming_inventory_control;
SET @Total_Item_Quantity_Received_Whole = (SELECT SUM(Total_Item_Quantity_Received) FROM Incoming_Inventory_Control);
SELECT @Total_Item_Quantity_Received_Whole;
DELIMITER //
CREATE TRIGGER Total_Quantity BEFORE INSERT ON Incoming_Inventory_Control FOR EACH ROW
SET @Total_Item_Quantity_Received_Whole =  @Total_Item_Quantity_Received_Whole + NEW.Total_Item_Quantity_Received //
DELIMITER ;
SELECT SUM(Total_Item_Quantity_Received) FROM Incoming_Inventory_Control;
INSERT INTO Incoming_Inventory_Control VALUES('1006','1002','2024-03-12','PO-0005','1005','26631','2030-01-01','7344','001','1005');
SELECT SUM(Total_Item_Quantity_Received) FROM Incoming_Inventory_Control;
INSERT INTO Incoming_Inventory_Control VALUES ('1007','1002','2024-03-12','PO-0005','1005','26631','2030-01-01','7344','001','1005');
SELECT SUM(Total_Item_Quantity_Received) FROM Incoming_Inventory_Control;


LOCK TABLES Incoming_Inventory_Control WRITE;
UNLOCK TABLES;

mysqldump -u root -p medical_device_startup > medical_device_startup_backup.sql


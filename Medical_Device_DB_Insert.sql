-- Insert
-- Table: Analyzer_Part_List
INSERT INTO Analyzer_Part_List (Item_Number,Vendor_Part_Number,Description,Vendor_Location,Unit_of_Measurement,Available_Quantity,Total_Inventory,Quantity_Waiting_Inspection,Quantity_On_Receiving_Hold,Quantity_on_Production_Hold,Quantity_On_Order,MRB_Quantity,RMA_Quantity,Scrapped_Quantity,RAD_Issued_Quantity,Vendor_List_Vendor_ID) VALUES
('PN-00200','VP-0001','Shoulder Screw, #4-40, 1/8” x 1-1/2” Shoulder, 18-8 SS','USA','Each','4542','7120','0','0','0','0','0','0','0','0','1001'),
('PN-00201','VP-0002','Locknut, #4-40 Thread, Nylon Insert, 18-8 SS','USA','Each','2144','5650','0','0','0','0','0','0','0','0','1002'),
('PN-00202','VP-0003','Cartridge Interface, Nest Flag','USA','Each','4257','4680','0','0','0','0','0','0','0','0','1003'),
('PN-00203','VP-0004','External Retaining Ring, 12mm','USA','Each','4556','6300','0','0','0','0','0','0','0','0','1004'),
('PN-00204','VP-0005','BHCS, M3 x 0.5mm, 5mm Long, 316 SS','USA','Each','5675','3600','0','0','0','0','0','0','0','0','1005');


-- Table: Cartridge_Part_List
INSERT INTO Cartridge_Part_List (Item_Number,Description,Total_Inventory,Quantity_Waiting_Inspection,Quantity_On_Receiving_Hold,Quantity_on_Production_Quality_Hold,Quantity_On_Order,MRB_Quantity,RMA_Quantity,Scrapped_Quantity,RAD_Issued_Quantity,Vendor_List_Vendor_ID)VALUES
('PN-00500','Top Shroud, PMOS Cartridge','71250','0','0','0','0','0','0','0','0','1001'),
('PN-00501','Bottom Shroud, PMOS Cartridge','56550',	'0','0','0','0','0','0','0','0','1002'),
('PN-00502','Gasket, PMOS Sensor','46880','0','0','0','0','0','0','0','0','1003'),
('PN-00503','Midcard, pmos cartridge','63000','0','0','0','0','0','0','0','0','1004'),
('PN-00504','Top card, pmos cartridge','360000','0','0','0','0','0','0','0','0','1005');


-- Table: Employee
INSERT INTO Employee (Emp_ID,First_Name,Last_Name) VALUES
('1001','Brosina','Hoffman'),
('1002','Andrew','Allen'),
('1003','Irene','Maddox'),
('1004','Alejandro','Grove'),
('1005','Sandra','Flanagan'),
('1006','Tracy','Blumstein');

-- Table: Incoming_Inventory_Control
INSERT INTO Incoming_Inventory_Control (Incoming_ID,Emp_ID,Receipt_Date,Purchase_Order_Number,Vendor_ID,Lot_Number,Expiration_Date,Total_Item_Quantity_Received,Receiving_Status_ID,Vendor_List_Vendor_ID) VALUES
('1001','1005','2024-02-12','PO-0001','1001','33671','2030-01-01','0445','001','1001'),
('1002','1003','2024-02-12','PO-0002','1002','14203','2030-01-01','4242','002','1002'),
('1003','1001','2024-02-12','PO-0003','1003','47895','2030-01-01','2745','003','1003'),
('1004','1001','2024-02-12','PO-0004','1004','90586','2030-01-01','4577','001','1004'),
('1005','1002','2024-02-12','PO-0005','1005','26631','2030-01-01','7344','001','1005');

-- Table: Part_Quantity NO
INSERT INTO Part_Quantity (part_id,Material_description,Item_Number,Analyzer_Part_List_Item_Number,Cartridge_Part_List_Item_Number) VALUES
('PN-00001','Bumper','AS-00006','AP-00001','CP-00001'),
('PN-00002','Front Molding','AS-00016','AP-00002','CP-00002'),
('PN-00003','Heat Set Brass Threaded Insert','AS-00018','AP-00003','CP-00003'),
('PN-00004','Rear Molding','AS-00019','AP-00004','CP-00004'),
('PN-00005','Retainer Molding','AS-00021','AP-00005','CP-00005'),
('PN-00006','Power Button','AS-00022','AP-00006','CP-00006');

-- Table: Production
INSERT INTO Production (Work_Order_Number,Open_Work_Order_Date,Closed_Work_Order_Date,Name,Description,Item_Number,Quantity_Being_Built,Status,Employee_Emp_ID) VALUES
('WO-0001','2024-02-12','2024-02-30','New Order','From New Company','PN-00012','100','Building','10002');


-- Table: Purchase_Order
INSERT INTO Purchase_Order (PO_Number,Date,Vendor_ID,Item_Number,PO_Issue_Date,Quantity_Ordered,Price_per_part,Total_Price_of_Parts,Total_PO_Price,Vendor_List_Vendor_ID)VALUES
('1','2024-02-12','1001','PN-0001','2024-02-01','454','10.00','4540.00','4540.00','1001'),
('2','2024-02-26','1002','PN-0002','2024-02-14','1000','20.25','20250.00','20250.00','1002'),
('3','2024-02-27','1003','PN-0003','2024-02-15','100','4','400.00','400.00','1003');


-- Table: Quality
INSERT INTO Quality (Quality_ID,Date,Emp_ID,Item_number,Quantity_Passed_Inspection,Quantity_Issued_to_Material_Review_Board,Employee_Emp_ID)
('QI-0001','2024-02-12','1001','PN-0001','100','0','1001');

-- Table: Receiving_Status
INSERT INTO Receiving_Status (Receiving_Status_ID,Receiving_Status,Description,Incoming_Inventory_Control_Incoming_ID)VALUES

('1002','MRB','Material review Board', '1002'),
('1003', 'ARR', 'Arrived', '1003'),
('1004', 'HLD', 'On Hold', '1004'),
('1005', 'RCV', 'Received', '1005');
('1006', 'PND', 'Pending', '1006'),
('1007', 'DEL', 'Delayed', '1007');


('1001','WIP','Work In Progress', '1001'),
-- Table: Shipping
INSERT INTO Shipping (shipping_ID,Date,First_Name,Last_Name,Customer,Sales_Order_Number,Packing_List_Number,Item_Number,Quantity_Shipped,Employee_Emp_ID)
('SI-0001','2024-02-12','Mary','Kay','NMSU','SO-0001','PA-0001','PN-0001','1000','10001');

-- Table: Vendor_List
INSERT INTO Vendor_List (Vendor_ID,Vendor_Name,Vendor_Part_Number,Description,Item_Number) VALUES
('1001','Abcad','VP-0001','Hex Nuts','PN-0001'),
('1002','Krogers','VP-0002','Front Molding','PN-0002'),
('1003','Walmart','VP-0003','Heat Set Brass Threaded Insert','PN-0003'),
('1004','Smith','VP-0004','Rear Molding','PN-0004'),
('1005','Target','VP-0005','Retainer Molding','PN-0005');

-- End of file.

INSERT INTO Part_Quantity ('PN-00001','Bumper','AS-00006','AP-00001','CP-00001');
INSERT INTO Production ('WO-0001','2024-02-12','2024-02-30','New Order','From New Company','PN-00012','100','Building','10002');
INSERT INTO Quality ('QI-0001','2024-02-12','1001','PN-0001','100','0','1001');
INSERT INTO Receiving_Status ('RI-0001','WIP','Work In Progress', '0001');
INSERT INTO Shipping ('SI-0001','2024-02-12','Mary','Kay','NMSU','SO-0001','PA-0001','PN-0001','1000','10001');


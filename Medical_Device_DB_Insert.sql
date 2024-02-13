-- Insert
-- Table: Analyzer_Part_List
INSERT INTO Analyzer_Part_List (Item_Number,Vendor_Part_Number,Description,Vendor_Location,Unit_of_Measurement,Available_Quantity,Total_Inventory,Quantity_Waiting_Inspection,Quantity_On_Receiving_Hold,Quantity_on_Production_Hold,Quantity_On_Order,MRB_Quantity,RMA_Quantity,Scrapped_Quantity,RAD_Issued_Quantity,Vendor_List_Vendor_ID,)
VALUES ('PN-00200','VP-111141','Shoulder Screw, #4-40, 1/8” x 1-1/2” Shoulder, 18-8 SS','USA','Each','4542','7120','0','0','0','0','0','0','0','0','1'),
VALUES ('PN-00201','VP-111142','Locknut, #4-40 Thread, Nylon Insert, 18-8 SS','USA','Each','2144','5650','0','0','0','0','0','0','0','0','2'),
VALUES ('PN-00202','VP-111143','Cartridge Interface, Nest Flag','USA','Each','4257','4680','0','0','0','0','0','0','0','0','3'),
VALUES ('PN-00203','VP-111144','External Retaining Ring, 12mm','USA','Each','4556','6300','0','0','0','0','0','0','0','0','4'),
VALUES ('PN-00204','VP-111145','BHCS, M3 x 0.5mm, 5mm Long, 316 SS','USA','Each','5675','3600','0','0','0','0','0','0','0','0','5');

-- Table: Cartridge_Part_List
INSERT INTO Cartridge_Part_List (Item_Number,Description,Total_Inventory,Quantity_Waiting_Inspection,Quantity_On_Receiving_Hold,Quantity_on_Production_Quality_Hold,Quantity_On_Order,MRB_Quantity,RMA_Quantity,Scrapped_Quantity,RAD_Issued_Quantity,Vendor_List_Vendor_ID)
VALUES ('PN-00500','Top Shroud, PMOS Cartridge','71250','0','0','0','0','0','0','0','0','1'),
VALUES ('PN-00501','Bottom Shroud, PMOS Cartridge','56550',	'0','0','0','0','0','0','0','0','2'),
VALUES ('PN-00502','Gasket, PMOS Sensor','46880','0','0','0','0','0','0','0','0','3'),
VALUES ('PN-00503','Midcard, pmos cartridge','63000','0','0','0','0','0','0','0','0','4'),
VALUES ('PN-00504','Top card, pmos cartridge','360000','0','0','0','0','0','0','0','0','5');

-- Table: Employee
INSERT INTO Employee (Emp_ID,First_Name,Last_Name)
VALUES ('1001','Brosina','Hoffman'),
VALUES ('1002','Andrew','Allen'),
VALUES ('1003','Irene','Maddox'),
VALUES ('1004','Alejandro','Grove'),
VALUES ('1005','Sandra','Flanagan'),
VALUES ('1006','Tracy','Blumstein');

-- Table: Incoming_Inventory_Control
INSERT INTO Incoming_Inventory_Control (Incoming_ID,Emp_ID,Receipt_Date,Purchase_Order_Number,Vendor_ID,Lot_Number,Expiration_Date,Total_Item_Quantity_Received,Receiving_Status_ID,Vendor_List_Vendor_ID)
VALUES ('10001','1005','02/12/2024','PO-00001','VI-00001','LOT33671','01/01/2030','0445','001','1'),
VALUES ('10002','1003','02/12/2024','PO-00002','VI-00002','LOT14203','01/01/2030','4242','002','2'),
VALUES ('10003','1001','02/12/2024','PO-00003','VI-00003','LOT47895','01/01/2030','2745','003','3'),
VALUES ('10004','1001','02/12/2024','PO-00004','VI-00004','LOT90586','01/01/2030','4577','001','4'),
VALUES ('10005','1002','02/12/2024','PO-00005','VI-00005','LOT26631','01/01/2030','7344','001','5');

-- Table: Part_Quantity
INSERT INTO Part_Quantity (part_id,Material_description,Item_Number,Analyzer_Part_List_Item_Number,Cartridge_Part_List_Item_Number)
VALUES ('PN-00001','Bumper','AS-00006','AP-00001','CP-00001'),
VALUES ('PN-00002','Front Molding','AS-00016','AP-00002','CP-00002'),
VALUES ('PN-00003','Heat Set Brass Threaded Insert','AS-00018','AP-00003','CP-00003'),
VALUES ('PN-00004','Rear Molding','AS-00019','AP-00004','CP-00004'),
VALUES ('PN-00005','Retainer Molding','AS-00021','AP-00005','CP-00005'),
VALUES ('PN-00006','Power Button','AS-00022','AP-00006','CP-00006');

-- Table: Production
INSERT INTO Production (Work_Order_Number,Open_Work_Order_Date,Closed_Work_Order_Date,Name,Description,Item_Number,Quantity_Being_Built,Status,Employee_Emp_ID)
VALUES ('WO-0001','02/12/2024','02/30/2024','New Order','From New Company','PN-00012','100','Building','10002');


-- Table: Purchase_Order
INSERT INTO Purchase_Order (PO_Number,Date,Vendor_ID,Item_Number,PO_Issue_Date,Quantity_Ordered,Price_per_part,Total_Price_of_Parts,Total_PO_Price,Vendor_List_Vendor_ID)
VALUES ('PO-0001','02/12/2024','VI-0001','PN-0001','02/01/2024','454','10.00','4540.00','4540.00','001');

-- Table: Quality
INSERT INTO Quality (Quality_ID,Date,Emp_ID,Item_number,Quantity_Passed_Inspection,Quantity_Issued_to_Material_Review_Board,Employee_Emp_ID)
VALUES ('QI-0001','02/12/2024','1001','PN-0001','100','0','1001');

-- Table: Receiving_Status
INSERT INTO Receiving_Status (Receiving_Status_ID,Receiving_Status,Description,Incoming_Inventory_Control_Incoming_ID)
VALUES ('RI-0001','WIP','Work In Progress', '0001');

-- Table: Shipping
INSERT INTO Shipping (shipping_ID,Date,First_Name,Last_Name,Customer,Sales_Order_Number,Packing_List_Number,Item_Number,Quantity_Shipped,Employee_Emp_ID)
VALUES ('SI-0001','02/12/2024','Mary','Kay','NMSU','SO-0001','PA-0001','PN-0001','1000','10001');

-- Table: Vendor_List
INSERT INTO Vendor_List (Vendor_ID,Vendor_Name,Vendor_Part_Number,Description,Item_Number)
VALUES ('VI-0001','Abcad','VP-0001','Hex Nuts','PN-0001');

-- End of file.

INSERT INTO Analyzer_Part_List VALUES ('PN-00200','VP-111141','Shoulder Screw, #4-40, 1/8” x 1-1/2” Shoulder, 18-8 SS','USA','Each',4542,7120,0,0,0,0,0,0,0,0,1);
INSERT INTO Cartridge_Part_List VALUES ('PN-00500','Top Shroud, PMOS Cartridge','71250','0','0','0','0','0','0','0','0','1');
INSERT INTO Employee VALUES ('1001','Brosina','Hoffman');
INSERT INTO Incoming_Inventory_Control VALUES ('10001','1005','02/12/2024','PO-00001','VI-00001','LOT33671','01/01/2030','0445','001','1');
INSERT INTO Part_Quantity VALUES ('PN-00001','Bumper','AS-00006','AP-00001','CP-00001');
INSERT INTO Production VALUES ('WO-0001','02/12/2024','02/30/2024','New Order','From New Company','PN-00012','100','Building','10002');
INSERT INTO Purchase_Order VALUES ('PO-0001','02/12/2024','VI-0001','PN-0001','02/01/2024','454','10.00','4540.00','4540.00','001');
INSERT INTO Quality VALUES ('QI-0001','02/12/2024','1001','PN-0001','100','0','1001');
INSERT INTO Receiving_Status VALUES ('RI-0001','WIP','Work In Progress', '0001');
INSERT INTO Shipping VALUES ('SI-0001','02/12/2024','Mary','Kay','NMSU','SO-0001','PA-0001','PN-0001','1000','10001');
INSERT INTO Vendor_List VALUES ('VI-0001','Abcad','VP-0001','Hex Nuts','PN-0001');

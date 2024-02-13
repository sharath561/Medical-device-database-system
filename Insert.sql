-- Insert
INSERT INTO Employee VALUES ('1001','Brosina','Hoffman');
INSERT INTO Quality VALUES ('1001','2024-12-02','1001','PN-0001','100','0','1001');
INSERT INTO Vendor_List VALUES ('1001','Abcad','VP-0001','Hex Nuts','PN-0001');
INSERT INTO Shipping VALUES ('1001','2024-12-02','Mary','Kay','NMSU','SO-0001','PA-0001','PN-0001','1000','1001');
INSERT INTO Incoming_Inventory_Control VALUES ('1001','1001','2024-12-02','PO-0001','VI-00001','33671','2030-12-02','0445','001','1001');
INSERT INTO Analyzer_Part_List VALUES ('PN-00200','VP-111141','Shoulder Screw, #4-40, 1/8” x 1-1/2” Shoulder, 18-8 SS','USA','Each',4542,7120,0,0,0,0,0,0,0,0,'1001');
INSERT INTO Cartridge_Part_List VALUES ('PN-00500','Top Shroud, PMOS Cartridge','71250','0','0','0','0','0','0','0','0','1001');
INSERT INTO Part_Quantity VALUES ('PN-00001','Bumper','AS-00006','PN-00200','PN-00500');
INSERT INTO Production VALUES ('WO-0001','2024-12-02','02/30/2024','New Order','From New Company','PN-00012','100','Building','1001');
INSERT INTO Purchase_Order VALUES ('PO-0001','2024-12-02','VI-0001','PN-0001','02/01/2024','454','10.00','4540.00','4540.00','1001');
INSERT INTO Receiving_Status VALUES ('1001','WIP','Work In Progress', '1001');
-- End of file.

SELECT * FROM analyzer_part_list;
SELECT * FROM cartridge_part_list;
SELECT * FROM employee;
SELECT * FROM incoming_inventory_control;
SELECT * FROM part_quantity;
SELECT * FROM production;
SELECT * FROM purchase_order;
SELECT * FROM quality;
SELECT * FROM receiving_status;
SELECT * FROM shipping;
SELECT * FROM vendor_list;



-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-12 20:34:54.429

-- tables
-- Table: Analyzer_Part_List
CREATE TABLE Analyzer_Part_List (
    Item_Number varchar(8)  NOT NULL,
    Vendor_Part_Number varchar(10)  NOT NULL,
    Description varchar(50)  NOT NULL,
    Vendor_Location varchar(10)  NOT NULL,
    Unit_of_Measurement varchar(8)  NOT NULL,
    Available_Quantity int  NOT NULL,
    Total_Inventory int  NOT NULL,
    Quantity_Waiting_Inspection int  NOT NULL,
    Quantity_On_Receiving_Hold int  NOT NULL,
    Quantity_on_Production_Hold int  NOT NULL,
    Quantity_On_Order int  NOT NULL,
    MRB_Quantity int  NOT NULL,
    RMA_Quantity int  NOT NULL,
    Scrapped_Quantity int  NOT NULL,
    RAD_Issued_Quantity int  NOT NULL,
    Vendor_List_Vendor_ID int  NOT NULL,
    CONSTRAINT Analyzer_Part_List_pk PRIMARY KEY (Item_Number)
);

-- Table: Cartridge_Part_List
CREATE TABLE Cartridge_Part_List (
    Item_Number varchar(8)  NOT NULL,
    Description varchar(50)  NOT NULL,
    Total_Inventory int  NOT NULL,
    Quantity_Waiting_Inspection int  NOT NULL,
    Quantity_On_Receiving_Hold int  NOT NULL,
    Quantity_on_Production_Quality_Hold int  NOT NULL,
    Quantity_On_Order int  NOT NULL,
    MRB_Quantity int  NOT NULL,
    RMA_Quantity int  NOT NULL,
    Scrapped_Quantity int  NOT NULL,
    RAD_Issued_Quantity int  NOT NULL,
    Vendor_List_Vendor_ID int  NOT NULL,
    CONSTRAINT Cartridge_Part_List_pk PRIMARY KEY (Item_Number)
);

-- Table: Employee
CREATE TABLE Employee (
    Emp_ID int  NOT NULL,
    First_Name varchar(15)  NOT NULL,
    Last_Name varchar(15)  NOT NULL,
    CONSTRAINT  Employee_pk PRIMARY KEY (Emp_ID)
);

-- Table: Incoming_Inventory_Control
CREATE TABLE Incoming_Inventory_Control (
    Incoming_ID int  NOT NULL,
    Emp_ID int  NOT NULL,
    Receipt_Date date  NOT NULL,
    Purchase_Order_Number varchar(8)  NOT NULL,
    Vendor_ID varchar(8)  NOT NULL,
    Lot_Number int  NOT NULL,
    Expiration_Date date  NOT NULL,
    Total_Item_Quantity_Received int  NOT NULL,
    Receiving_Status_ID varchar(5)  NOT NULL,
    Vendor_List_Vendor_ID int  NOT NULL,
    CONSTRAINT Incoming_Inventory_Control_pk PRIMARY KEY (Incoming_ID)
);

-- Table: Part_Quantity
CREATE TABLE Part_Quantity (
    part_id int  NOT NULL,
    Material_description varchar(6)  NOT NULL,
    Item_Number varchar(8)  NOT NULL,
    Analyzer_Part_List_Item_Number varchar(8)  NOT NULL,
    Cartridge_Part_List_Item_Number varchar(8)  NOT NULL,
    CONSTRAINT Part_Quantity_pk PRIMARY KEY (part_id)
);

-- Table: Production
CREATE TABLE Production (
    Work_Order_Number int  NOT NULL,
    Open_Work_Order_Date date  NOT NULL,
    Closed_Work_Order_Date date  NOT NULL,
    Name varchar(30)  NOT NULL,
    Description varchar(50)  NOT NULL,
    Item_Number varchar(8)  NOT NULL,
    Quantity_Being_Built int  NOT NULL,
    Status varchar(10)  NOT NULL,
    Employee_Emp_ID int  NOT NULL,
    CONSTRAINT Production_pk PRIMARY KEY (Work_Order_Number)
);

-- Table: Purchase_Order
CREATE TABLE Purchase_Order (
    PO_Number int  NOT NULL,
    Date date  NOT NULL,
    Vendor_ID int  NOT NULL,
    Item_Number varchar(8)  NOT NULL,
    PO_Issue_Date date  NOT NULL,
    Quantity_Ordered int  NOT NULL,
    Price_per_part decimal(8,2)  NOT NULL,
    Total_Price_of_Parts decimal(8,2)  NOT NULL,
    Total_PO_Price decimal(8,2)  NOT NULL,
    Vendor_List_Vendor_ID int  NOT NULL,
    CONSTRAINT Purchase_Order_pk PRIMARY KEY (PO_Number)
);

-- Table: Quality
CREATE TABLE Quality (
    Quality_ID int  NOT NULL,
    Date date  NOT NULL,
    Emp_ID int  NOT NULL,
    Item_number varchar(8)  NOT NULL,
    Quantity_Passed_Inspection int  NOT NULL,
    Quantity_Issued_to_Material_Review_Board int  NOT NULL,
    Employee_Emp_ID int  NOT NULL,
    CONSTRAINT Quality_pk PRIMARY KEY (Quality_ID)
);

-- Table: Receiving_Status
CREATE TABLE Receiving_Status (
    Receiving_Status_ID int  NOT NULL,
    Receiving_Status varchar(30)  NOT NULL,
    Description varchar(30)  NOT NULL,
    Incoming_Inventory_Control_Incoming_ID int  NOT NULL,
    CONSTRAINT Receiving_Status_pk PRIMARY KEY (Receiving_Status_ID)
);

-- Table: Shipping
CREATE TABLE Shipping (
    shipping_ID int  NOT NULL,
    Date date  NOT NULL,
    First_Name varchar(15)  NOT NULL,
    Last_Name varchar(15)  NOT NULL,
    Customer varchar(30)  NOT NULL,
    Sales_Order_Number int  NOT NULL,
    Packing_List_Number int  NOT NULL,
    Item_Number varchar(8)  NOT NULL,
    Quantity_Shipped int  NOT NULL,
    Employee_Emp_ID int  NOT NULL,
    CONSTRAINT Shipping_pk PRIMARY KEY (shipping_ID)
);

-- Table: Vendor_List
CREATE TABLE Vendor_List (
    Vendor_ID int  NOT NULL,
    Vendor_Name varchar(30)  NOT NULL,
    Vendor_Part_Number varchar(10)  NOT NULL,
    Description varchar(30)  NOT NULL,
    Item_Number varchar(8)  NOT NULL,
    CONSTRAINT Vendor_List_pk PRIMARY KEY (Vendor_ID)
);

-- foreign keys
-- Reference: Analyzer_Part_List_Vendor_List (table: Analyzer_Part_List)
ALTER TABLE Analyzer_Part_List ADD CONSTRAINT Analyzer_Part_List_Vendor_List FOREIGN KEY Analyzer_Part_List_Vendor_List (Vendor_List_Vendor_ID)
    REFERENCES Vendor_List (Vendor_ID);

-- Reference: Cartridge_Part_List_Vendor_List (table: Cartridge_Part_List)
ALTER TABLE Cartridge_Part_List ADD CONSTRAINT Cartridge_Part_List_Vendor_List FOREIGN KEY Cartridge_Part_List_Vendor_List (Vendor_List_Vendor_ID)
    REFERENCES Vendor_List (Vendor_ID);

-- Reference: Incoming_Inventory_Control_Vendor_List (table: Incoming_Inventory_Control)
ALTER TABLE Incoming_Inventory_Control ADD CONSTRAINT Incoming_Inventory_Control_Vendor_List FOREIGN KEY Incoming_Inventory_Control_Vendor_List (Vendor_List_Vendor_ID)
    REFERENCES Vendor_List (Vendor_ID);

-- Reference: Part_Quantity_Analyzer_Part_List (table: Part_Quantity)
ALTER TABLE Part_Quantity ADD CONSTRAINT Part_Quantity_Analyzer_Part_List FOREIGN KEY Part_Quantity_Analyzer_Part_List (Analyzer_Part_List_Item_Number)
    REFERENCES Analyzer_Part_List (Item_Number);

-- Reference: Part_Quantity_Cartridge_Part_List (table: Part_Quantity)
ALTER TABLE Part_Quantity ADD CONSTRAINT Part_Quantity_Cartridge_Part_List FOREIGN KEY Part_Quantity_Cartridge_Part_List (Cartridge_Part_List_Item_Number)
    REFERENCES Cartridge_Part_List (Item_Number);

-- Reference: Production_Employee (table: Production)
ALTER TABLE Production ADD CONSTRAINT Production_Employee FOREIGN KEY Production_Employee (Employee_Emp_ID)
    REFERENCES Employee (Emp_ID);

-- Reference: Purchase_Order_Vendor_List (table: Purchase_Order)
ALTER TABLE Purchase_Order ADD CONSTRAINT Purchase_Order_Vendor_List FOREIGN KEY Purchase_Order_Vendor_List (Vendor_List_Vendor_ID)
    REFERENCES Vendor_List (Vendor_ID);

-- Reference: Quality_Employee (table: Quality)
ALTER TABLE Quality ADD CONSTRAINT Quality_Employee FOREIGN KEY Quality_Employee (Employee_Emp_ID)
    REFERENCES Employee (Emp_ID);

-- Reference: Receiving_Status_Incoming_Inventory_Control (table: Receiving_Status)
ALTER TABLE Receiving_Status ADD CONSTRAINT Receiving_Status_Incoming_Inventory_Control FOREIGN KEY Receiving_Status_Incoming_Inventory_Control (Incoming_Inventory_Control_Incoming_ID)
    REFERENCES Incoming_Inventory_Control (Incoming_ID);

-- Reference: Shipping_Employee (table: Shipping)
ALTER TABLE Shipping ADD CONSTRAINT Shipping_Employee FOREIGN KEY Shipping_Employee (Employee_Emp_ID)
    REFERENCES Employee (Emp_ID);

-- End of file.


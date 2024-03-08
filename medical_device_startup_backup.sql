-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: medical_device_startup
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analyzer_part_list`
--

DROP TABLE IF EXISTS `analyzer_part_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analyzer_part_list` (
  `Item_Number` varchar(8) NOT NULL,
  `Vendor_Part_Number` varchar(10) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Vendor_Location` varchar(10) NOT NULL,
  `Unit_of_Measurement` varchar(8) NOT NULL,
  `Available_Quantity` int(11) NOT NULL,
  `Total_Inventory` int(11) NOT NULL,
  `Quantity_Waiting_Inspection` int(11) NOT NULL,
  `Quantity_On_Receiving_Hold` int(11) NOT NULL,
  `Quantity_on_Production_Hold` int(11) NOT NULL,
  `Quantity_On_Order` int(11) NOT NULL,
  `MRB_Quantity` int(11) NOT NULL,
  `RMA_Quantity` int(11) NOT NULL,
  `Scrapped_Quantity` int(11) NOT NULL,
  `RAD_Issued_Quantity` int(11) NOT NULL,
  `Vendor_List_Vendor_ID` int(11) NOT NULL,
  PRIMARY KEY (`Item_Number`),
  KEY `Analyzer_Part_List_Vendor_List` (`Vendor_List_Vendor_ID`),
  CONSTRAINT `Analyzer_Part_List_Vendor_List` FOREIGN KEY (`Vendor_List_Vendor_ID`) REFERENCES `vendor_list` (`Vendor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyzer_part_list`
--

LOCK TABLES `analyzer_part_list` WRITE;
/*!40000 ALTER TABLE `analyzer_part_list` DISABLE KEYS */;
INSERT INTO `analyzer_part_list` VALUES ('PN-00200','VP-0001','Shoulder Screw, #4-40, 1/8\" x 1-1/2\" Shoulder, 18-','USA','Each',4542,7120,0,0,0,0,0,0,0,0,1001),('PN-00201','VP-0002','Locknut, #4-40 Thread, Nylon Insert, 18-8 SS','USA','Each',2144,5650,0,0,0,0,0,0,0,0,1002),('PN-00202','VP-0003','Cartridge Interface, Nest Flag','USA','Each',4257,4680,0,0,0,0,0,0,0,0,1003),('PN-00203','VP-0004','External Retaining Ring, 12mm','USA','Each',4556,6300,0,0,0,0,0,0,0,0,1004),('PN-00204','VP-0005','BHCS, M3 x 0.5mm, 5mm Long, 316 SS','USA','Each',5675,3600,0,0,0,0,0,0,0,0,1005);
/*!40000 ALTER TABLE `analyzer_part_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartridge_part_list`
--

DROP TABLE IF EXISTS `cartridge_part_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartridge_part_list` (
  `Item_Number` varchar(8) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Total_Inventory` int(11) NOT NULL,
  `Quantity_Waiting_Inspection` int(11) NOT NULL,
  `Quantity_On_Receiving_Hold` int(11) NOT NULL,
  `Quantity_on_Production_Quality_Hold` int(11) NOT NULL,
  `Quantity_On_Order` int(11) NOT NULL,
  `MRB_Quantity` int(11) NOT NULL,
  `RMA_Quantity` int(11) NOT NULL,
  `Scrapped_Quantity` int(11) NOT NULL,
  `RAD_Issued_Quantity` int(11) NOT NULL,
  `Vendor_List_Vendor_ID` int(11) NOT NULL,
  PRIMARY KEY (`Item_Number`),
  KEY `Cartridge_Part_List_Vendor_List` (`Vendor_List_Vendor_ID`),
  CONSTRAINT `Cartridge_Part_List_Vendor_List` FOREIGN KEY (`Vendor_List_Vendor_ID`) REFERENCES `vendor_list` (`Vendor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartridge_part_list`
--

LOCK TABLES `cartridge_part_list` WRITE;
/*!40000 ALTER TABLE `cartridge_part_list` DISABLE KEYS */;
INSERT INTO `cartridge_part_list` VALUES ('PN-00500','Top Shroud, PMOS Cartridge',71250,0,0,0,0,0,0,0,0,1001),('PN-00501','Bottom Shroud, PMOS Cartridge',56550,0,0,0,0,0,0,0,0,1002),('PN-00502','Gasket, PMOS Sensor',46880,0,0,0,0,0,0,0,0,1003),('PN-00503','Midcard, pmos cartridge',63000,0,0,0,0,0,0,0,0,1004),('PN-00504','Top card, pmos cartridge',360000,0,0,0,0,0,0,0,0,1005);
/*!40000 ALTER TABLE `cartridge_part_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Emp_ID` int(11) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1001,'Brosina','Hoffman'),(1002,'Mogens','Tangoe'),(1003,'Johnnie','Vigil'),(1004,'Alejandro','Grove'),(1005,'Sandra','Flanagan'),(1007,'Andrew','Allen'),(1008,'Irene','Maddox');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incoming_inventory_control`
--

DROP TABLE IF EXISTS `incoming_inventory_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incoming_inventory_control` (
  `Incoming_ID` int(11) NOT NULL,
  `Emp_ID` int(11) NOT NULL,
  `Receipt_Date` date NOT NULL,
  `Purchase_Order_Number` varchar(8) NOT NULL,
  `Vendor_ID` varchar(8) NOT NULL,
  `Lot_Number` int(11) NOT NULL,
  `Expiration_Date` date NOT NULL,
  `Total_Item_Quantity_Received` int(11) NOT NULL,
  `Receiving_Status_ID` varchar(5) NOT NULL,
  `Vendor_List_Vendor_ID` int(11) NOT NULL,
  PRIMARY KEY (`Incoming_ID`),
  KEY `Incoming_Inventory_Control_Vendor_List` (`Vendor_List_Vendor_ID`),
  KEY `idx_Total_Item_Quantity_Received` (`Total_Item_Quantity_Received`),
  CONSTRAINT `Incoming_Inventory_Control_Vendor_List` FOREIGN KEY (`Vendor_List_Vendor_ID`) REFERENCES `vendor_list` (`Vendor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incoming_inventory_control`
--

LOCK TABLES `incoming_inventory_control` WRITE;
/*!40000 ALTER TABLE `incoming_inventory_control` DISABLE KEYS */;
INSERT INTO `incoming_inventory_control` VALUES (1001,1001,'2024-02-26','PO-0001','1001',33671,'2030-12-02',445,'001',1001),(1002,1003,'2024-02-12','PO-0002','1002',14203,'2030-01-01',4242,'002',1002),(1003,1001,'2024-02-12','PO-0003','1003',47895,'2030-01-01',2745,'003',1003),(1004,1001,'2024-02-12','PO-0004','1004',90586,'2030-01-01',4577,'001',1004),(1005,1002,'2024-02-12','PO-0005','1005',26631,'2030-01-01',7344,'001',1005),(1006,1002,'2024-03-12','PO-0005','1005',26631,'2030-01-01',7344,'001',1005),(1007,1002,'2024-03-12','PO-0005','1005',26631,'2030-01-01',7344,'001',1005);
/*!40000 ALTER TABLE `incoming_inventory_control` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Total_Quantity BEFORE INSERT ON Incoming_Inventory_Control FOR EACH ROW
SET @Total_Item_Quantity_Received_Whole =  @Total_Item_Quantity_Received_Whole + NEW.Total_Item_Quantity_Received */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_vendor_list
AFTER INSERT ON incoming_inventory_control
FOR EACH ROW
BEGIN
  DECLARE new_vendor_id INT;
  SET new_vendor_id = NEW.Vendor_ID;

  -- Check if Vendor_ID from new record exists in Vendor_List
  SELECT 1 FROM Vendor_List WHERE Vendor_ID = new_vendor_id
  INTO @vendor_exists;

  IF @vendor_exists IS NULL THEN
    -- Insert new vendor information (assuming minimal data from incoming_inventory_control)
    INSERT INTO Vendor_List (Vendor_ID) VALUES (new_vendor_id);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `incoming_receiving_view`
--

DROP TABLE IF EXISTS `incoming_receiving_view`;
/*!50001 DROP VIEW IF EXISTS `incoming_receiving_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `incoming_receiving_view` AS SELECT
 1 AS `Incoming_ID`,
  1 AS `Emp_ID`,
  1 AS `Receipt_Date`,
  1 AS `Vendor_ID`,
  1 AS `Lot_Number`,
  1 AS `Expiration_Date`,
  1 AS `Receiving_Status_ID`,
  1 AS `Receiving_Status`,
  1 AS `Description` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `part_quantity`
--

DROP TABLE IF EXISTS `part_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_quantity` (
  `part_id` int(11) NOT NULL,
  `Material_description` varchar(6) NOT NULL,
  `Item_Number` varchar(8) NOT NULL,
  `Analyzer_Part_List_Item_Number` varchar(8) NOT NULL,
  `Cartridge_Part_List_Item_Number` varchar(8) NOT NULL,
  PRIMARY KEY (`part_id`),
  KEY `Part_Quantity_Analyzer_Part_List` (`Analyzer_Part_List_Item_Number`),
  KEY `Part_Quantity_Cartridge_Part_List` (`Cartridge_Part_List_Item_Number`),
  CONSTRAINT `Part_Quantity_Analyzer_Part_List` FOREIGN KEY (`Analyzer_Part_List_Item_Number`) REFERENCES `analyzer_part_list` (`Item_Number`),
  CONSTRAINT `Part_Quantity_Cartridge_Part_List` FOREIGN KEY (`Cartridge_Part_List_Item_Number`) REFERENCES `cartridge_part_list` (`Item_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_quantity`
--

LOCK TABLES `part_quantity` WRITE;
/*!40000 ALTER TABLE `part_quantity` DISABLE KEYS */;
INSERT INTO `part_quantity` VALUES (1001,'Bumper','AS-00006','PN-00200','PN-00500');
/*!40000 ALTER TABLE `part_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production` (
  `Work_Order_Number` int(11) NOT NULL,
  `Open_Work_Order_Date` date NOT NULL,
  `Closed_Work_Order_Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Item_Number` varchar(8) NOT NULL,
  `Quantity_Being_Built` int(11) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Employee_Emp_ID` int(11) NOT NULL,
  PRIMARY KEY (`Work_Order_Number`),
  KEY `Production_Employee` (`Employee_Emp_ID`),
  CONSTRAINT `Production_Employee` FOREIGN KEY (`Employee_Emp_ID`) REFERENCES `employee` (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production`
--

LOCK TABLES `production` WRITE;
/*!40000 ALTER TABLE `production` DISABLE KEYS */;
INSERT INTO `production` VALUES (0,'2024-12-02','0000-00-00','New Order','From New Company','PN-00012',100,'Building',1001);
/*!40000 ALTER TABLE `production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `PO_Number` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Item_Number` varchar(8) NOT NULL,
  `PO_Issue_Date` date NOT NULL,
  `Quantity_Ordered` int(11) NOT NULL,
  `Price_per_part` decimal(8,2) NOT NULL,
  `Total_Price_of_Parts` decimal(8,2) NOT NULL,
  `Total_PO_Price` decimal(8,2) NOT NULL,
  `Vendor_List_Vendor_ID` int(11) NOT NULL,
  PRIMARY KEY (`PO_Number`),
  KEY `Purchase_Order_Vendor_List` (`Vendor_List_Vendor_ID`),
  KEY `idx_Total_Price_of_Parts` (`Total_Price_of_Parts`),
  CONSTRAINT `Purchase_Order_Vendor_List` FOREIGN KEY (`Vendor_List_Vendor_ID`) REFERENCES `vendor_list` (`Vendor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES (1,'2024-02-12',1001,'PN-0001','2024-02-01',454,10.00,4540.00,4540.00,1001),(2,'2024-02-26',1002,'PN-0002','2024-02-14',1000,20.25,20250.00,20250.00,1002),(3,'2024-02-27',1003,'PN-0003','2024-02-15',100,4.00,400.00,400.00,1003);
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality` (
  `Quality_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Emp_ID` int(11) NOT NULL,
  `Item_number` varchar(8) NOT NULL,
  `Quantity_Passed_Inspection` int(11) NOT NULL,
  `Quantity_Issued_to_Material_Review_Board` int(11) NOT NULL,
  `Employee_Emp_ID` int(11) NOT NULL,
  PRIMARY KEY (`Quality_ID`),
  KEY `Quality_Employee` (`Employee_Emp_ID`),
  CONSTRAINT `Quality_Employee` FOREIGN KEY (`Employee_Emp_ID`) REFERENCES `employee` (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality`
--

LOCK TABLES `quality` WRITE;
/*!40000 ALTER TABLE `quality` DISABLE KEYS */;
INSERT INTO `quality` VALUES (0,'0000-00-00',1001,'PN-0001',100,0,1001),(1001,'2024-12-02',1001,'PN-0001',100,0,1001);
/*!40000 ALTER TABLE `quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiving_status`
--

DROP TABLE IF EXISTS `receiving_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiving_status` (
  `Receiving_Status_ID` int(11) NOT NULL,
  `Receiving_Status` varchar(30) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `Incoming_Inventory_Control_Incoming_ID` int(11) NOT NULL,
  PRIMARY KEY (`Receiving_Status_ID`),
  KEY `Receiving_Status_Incoming_Inventory_Control` (`Incoming_Inventory_Control_Incoming_ID`),
  CONSTRAINT `Receiving_Status_Incoming_Inventory_Control` FOREIGN KEY (`Incoming_Inventory_Control_Incoming_ID`) REFERENCES `incoming_inventory_control` (`Incoming_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiving_status`
--

LOCK TABLES `receiving_status` WRITE;
/*!40000 ALTER TABLE `receiving_status` DISABLE KEYS */;
INSERT INTO `receiving_status` VALUES (1001,'WIP','Work In Progress',1001),(1002,'MRB','Material review Board',1002),(1003,'ARR','Arrived',1003),(1004,'HLD','On Hold',1004);
/*!40000 ALTER TABLE `receiving_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping` (
  `shipping_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) NOT NULL,
  `Customer` varchar(30) NOT NULL,
  `Sales_Order_Number` int(11) NOT NULL,
  `Packing_List_Number` int(11) NOT NULL,
  `Item_Number` varchar(8) NOT NULL,
  `Quantity_Shipped` int(11) NOT NULL,
  `Employee_Emp_ID` int(11) NOT NULL,
  PRIMARY KEY (`shipping_ID`),
  KEY `Shipping_Employee` (`Employee_Emp_ID`),
  CONSTRAINT `Shipping_Employee` FOREIGN KEY (`Employee_Emp_ID`) REFERENCES `employee` (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1001,'0000-00-00','Mary','Kay','NMSU',0,0,'PN-0001',1000,1001);
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_list`
--

DROP TABLE IF EXISTS `vendor_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_list` (
  `Vendor_ID` int(11) NOT NULL,
  `Vendor_Name` varchar(30) NOT NULL,
  `Vendor_Part_Number` varchar(10) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `Item_Number` varchar(8) NOT NULL,
  PRIMARY KEY (`Vendor_ID`),
  KEY `idx_Vendor_Name` (`Vendor_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_list`
--

LOCK TABLES `vendor_list` WRITE;
/*!40000 ALTER TABLE `vendor_list` DISABLE KEYS */;
INSERT INTO `vendor_list` VALUES (1001,'Abcad','VP-0001','Hex Nuts','PN-0001'),(1002,'Krogers','VP-0002','Front Molding','PN-0002'),(1003,'Walmart','VP-0003','Heat Set Brass Threaded Insert','PN-0003'),(1004,'Smith','VP-0004','Rear Molding','PN-0004'),(1005,'Target','VP-0005','Retainer Molding','PN-0005');
/*!40000 ALTER TABLE `vendor_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vendor_purchase_view`
--

DROP TABLE IF EXISTS `vendor_purchase_view`;
/*!50001 DROP VIEW IF EXISTS `vendor_purchase_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vendor_purchase_view` AS SELECT
 1 AS `Vendor_ID`,
  1 AS `Vendor_Name`,
  1 AS `Description`,
  1 AS `PO_Number`,
  1 AS `Quantity_Ordered`,
  1 AS `Price_per_part` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `incoming_receiving_view`
--

/*!50001 DROP VIEW IF EXISTS `incoming_receiving_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incoming_receiving_view` AS select `i`.`Incoming_ID` AS `Incoming_ID`,`i`.`Emp_ID` AS `Emp_ID`,`i`.`Receipt_Date` AS `Receipt_Date`,`i`.`Vendor_ID` AS `Vendor_ID`,`i`.`Lot_Number` AS `Lot_Number`,`i`.`Expiration_Date` AS `Expiration_Date`,`r`.`Receiving_Status_ID` AS `Receiving_Status_ID`,`r`.`Receiving_Status` AS `Receiving_Status`,`r`.`Description` AS `Description` from (`incoming_inventory_control` `i` join `receiving_status` `r` on(`i`.`Incoming_ID` = `r`.`Incoming_Inventory_Control_Incoming_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendor_purchase_view`
--

/*!50001 DROP VIEW IF EXISTS `vendor_purchase_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vendor_purchase_view` AS select `v`.`Vendor_ID` AS `Vendor_ID`,`v`.`Vendor_Name` AS `Vendor_Name`,`v`.`Description` AS `Description`,`p`.`PO_Number` AS `PO_Number`,`p`.`Quantity_Ordered` AS `Quantity_Ordered`,`p`.`Price_per_part` AS `Price_per_part` from (`vendor_list` `v` join `purchase_order` `p` on(`v`.`Vendor_ID` = `p`.`Vendor_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-07 18:57:54

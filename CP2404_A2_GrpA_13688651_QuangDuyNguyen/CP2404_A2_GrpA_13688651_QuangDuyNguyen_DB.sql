-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: assignment2_db
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `country_name` varchar(40) NOT NULL,
  `region_name` varchar(25) NOT NULL,
  PRIMARY KEY (`country_name`),
  KEY `COUNTRY_FK` (`region_name`),
  CONSTRAINT `COUNTRY_FK` FOREIGN KEY (`region_name`) REFERENCES `region` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('Argentina','Americas'),('Brazil','Americas'),('Canada','Americas'),('Mexico','Americas'),('United States of America','Americas'),('China','Asia'),('India','Asia'),('Japan','Asia'),('Singapore','Asia'),('Australia','Australia and Oceania'),('Fiji','Australia and Oceania'),('New Zealand','Australia and Oceania'),('Vanuatu','Australia and Oceania'),('Belgium','Europe'),('Denmark','Europe'),('France','Europe'),('Germany','Europe'),('Italy','Europe'),('Latvia','Europe'),('Lithuania','Europe'),('Netherlands','Europe'),('Slovakia','Europe'),('Slovenia','Europe'),('Switzerland','Europe'),('United Kingdom','Europe'),('Egypt','Middle East and Africa'),('Israel','Middle East and Africa'),('Kuwait','Middle East and Africa'),('Nigeria','Middle East and Africa'),('Zambia','Middle East and Africa'),('Zimbabwe','Middle East and Africa');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `department_name` varchar(30) NOT NULL,
  `street_address` varchar(40) NOT NULL,
  `postal_code` varchar(12) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country_name` varchar(40) NOT NULL,
  `manager_id` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`department_name`),
  KEY `DEPARTMENT_FK1` (`street_address`,`postal_code`,`city`,`country_name`),
  KEY `DEPARTMENT_FK2_idx` (`manager_id`),
  CONSTRAINT `DEPARTMENT_FK1` FOREIGN KEY (`street_address`, `postal_code`, `city`, `country_name`) REFERENCES `location` (`street_address`, `postal_code`, `city`, `country_name`),
  CONSTRAINT `DEPARTMENT_FK2` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Accounting','20 Rue des Corps-Saints','1730','Geneva','Switzerland',109),('Administration','12-98 Victoria Street','2901','Sydney','Australia',200),('Benefits','1298 Vileparle (E)','490231','Bombay','India',100),('Construction','40-5-12 Laogianggen','190518','Beijing','China',104),('Contracting','2017 Shinjuku-ku','1689','Tokyo','Japan',105),('Control And Credit','2014 Jabberwocky Rd','26192','Southlake','United States of America',100),('Corporate Tax','2011 Interiors Blvd','99236','South San Francisco','United States of America',100),('Executive','Mariano Escobedo 9991','11932','Mexico City','Mexico',100),('Finance','6092 Boxwood St','YSW 9T2','Whitehorse','Canada',108),('Government Sales','93091 Calle della Testa','10934','Venice','Italy',100),('Human Resources','9450 Kamiya-cho','6823','Hiroshima','Japan',203),('Information Technology','93091 Calle della Testa','10934','Venice','Italy',104),('Manufacturing','40-5-12 Laogianggen','190518','Beijing','China',104),('Marketing','1298 Vileparle (E)','490231','Bombay','India',201),('Operations','8204 Arthur St','AB2 7RT','London','United Kingdom',100),('Payroll','12-98 Victoria Street','2901','Sydney','Australia',112),('Public Relations','93091 Calle della Testa','10934','Venice','Italy',204),('Purchasing','40-5-12 Laogianggen','190518','Beijing','China',114),('Recruiting','198 Clementi North','540198','Singapore','Singapore',100),('Retail Sales','93091 Calle della Testa','10934','Venice','Italy',145),('Sales','20 Rue des Corps-Saints','1730','Geneva','Switzerland',145),('Shareholder Services','Mariano Escobedo 9991','11932','Mexico City','Mexico',100),('Shipping','2011 Interiors Blvd','99236','South San Francisco','United States of America',120),('Treasury','198 Clementi North','540198','Singapore','Singapore',100);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `employee_id` decimal(6,0) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `job_title` varchar(35) NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `commission_pct` decimal(2,2) DEFAULT NULL,
  `supervisor_id` decimal(6,0) DEFAULT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `EMPLOYEE_CK1` (`email`),
  UNIQUE KEY `EMPLOYEE_CK2` (`phone_number`),
  KEY `EMPLOYEE_FK1` (`department_name`),
  KEY `EMPLOYEE_FK2` (`supervisor_id`),
  KEY `EMPLOYEE_FK3` (`job_title`),
  CONSTRAINT `EMPLOYEE_FK1` FOREIGN KEY (`department_name`) REFERENCES `department` (`department_name`),
  CONSTRAINT `EMPLOYEE_FK2` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `EMPLOYEE_FK3` FOREIGN KEY (`job_title`) REFERENCES `job` (`job_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'Steven','King','SKING','515.123.4567','1987-06-17','President',24000.00,0.00,100,'NULL'),(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1998-09-21','Administration Vice President',17000.00,0.00,100,'Executive'),(102,'Lex','De Haan','LDEHAAN','515.123.4569','1999-01-13','Administration Vice President',17000.00,0.00,100,'Executive'),(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03','Programmer',9000.00,0.00,102,'Information Technology'),(104,'Bruce','Ernst','BERNST','590.423.4568','1991-05-21','Programmer',6000.00,0.00,103,'Information Technology'),(105,'David','Austin','DAUSTIN','590.423.4569','1997-06-25','Programmer',4800.00,0.00,103,'Information Technology'),(106,'Valli','Pataballa','VPATABAL','590.423.4560','1998-02-05','Programmer',4800.00,0.00,103,'Information Technology'),(107,'Diana','Lorentz','DLORENTZ','590.423.5567','1999-02-07','Programmer',4200.00,0.00,103,'Information Technology'),(108,'Nancy','Greenberg','NGREENBE','515.124.4569','1994-09-17','Finance Manager',12000.00,0.00,101,'Finance'),(109,'Daniel','Faviet','DFAVIET','515.124.4169','1999-10-16','Accounting Manager',9000.00,0.00,108,'Accounting'),(110,'John','Chen','JCHEN','515.124.4269','2000-01-05','Accounting Manager',8200.00,0.00,108,'Accounting'),(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','1999-12-31','Accounting Manager',7700.00,0.00,108,'Accounting'),(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','1998-03-07','Accounting Manager',7800.00,0.00,108,'Accounting'),(113,'Luis','Popp','LPOPP','515.124.4567','1999-12-07','Accounting Manager',6900.00,0.00,108,'Accounting'),(114,'Den','Raphaely','DRAPHEAL','515.127.4561','2000-01-01','Purchasing Manager',11000.00,0.00,100,'Purchasing'),(115,'Alexander','Khoo','AKHOO','515.127.4562','1995-05-18','Purchasing Clerk',3100.00,0.00,114,'Purchasing'),(116,'Shelli','Baida','SBAIDA','515.127.4563','1997-12-24','Purchasing Clerk',2900.00,0.00,114,'Purchasing'),(117,'Sigal','Tobias','STOBIAS','515.127.4564','1997-07-24','Purchasing Clerk',2800.00,0.00,114,'Purchasing'),(118,'Guy','Himuro','GHIMURO','515.127.4565','1998-11-15','Purchasing Clerk',2600.00,0.00,114,'Purchasing'),(119,'Karen','Colmenares','KCOLMENA','515.127.4566','1999-08-10','Purchasing Clerk',2500.00,0.00,114,'Purchasing'),(120,'Matthew','Weiss','MWEISS','650.123.1234','1996-07-18','Stock Manager',8000.00,0.00,100,'Shipping'),(121,'Adam','Fripp','AFRIPP','650.123.2234','1997-04-10','Stock Manager',8200.00,0.00,100,'Shipping'),(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','1995-05-01','Stock Manager',7900.00,0.00,100,'Shipping'),(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','1997-10-10','Stock Manager',6500.00,0.00,100,'Shipping'),(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','1999-11-16','Stock Manager',5800.00,0.00,100,'Shipping'),(125,'Julia','Nayer','JNAYER','650.124.1214','1997-07-16','Stock Clerk',3200.00,0.00,120,'Shipping'),(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','1998-09-28','Stock Clerk',2700.00,0.00,120,'Shipping'),(127,'James','Landry','JLANDRY','650.124.1334','1999-01-14','Stock Clerk',2400.00,0.00,120,'Shipping'),(128,'Steven','Markle','SMARKLE','650.124.1434','2000-03-08','Stock Clerk',2200.00,0.00,120,'Shipping'),(129,'Laura','Bissot','LBISSOT','650.124.5234','1997-08-20','Stock Clerk',3300.00,0.00,121,'Shipping'),(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','1997-10-30','Stock Clerk',2800.00,0.00,121,'Shipping'),(131,'James','Marlow','JAMRLOW','650.124.7234','1997-02-16','Stock Clerk',2500.00,0.00,121,'Shipping'),(132,'TJ','Olson','TJOLSON','650.124.8234','1999-04-10','Stock Clerk',2100.00,0.00,121,'Shipping'),(133,'Jason','Mallin','JMALLIN','650.127.1934','1996-06-14','Stock Clerk',3300.00,0.00,122,'Shipping'),(134,'Michael','Rogers','MROGERS','650.127.1834','1998-08-26','Stock Clerk',2900.00,0.00,122,'Shipping'),(135,'Ki','Gee','KGEE','650.127.1734','1999-12-12','Stock Clerk',2400.00,0.00,122,'Shipping'),(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','2000-02-06','Stock Clerk',2200.00,0.00,122,'Shipping'),(137,'Renske','Ladwig','RLADWIG','650.121.1234','1995-07-14','Stock Clerk',3600.00,0.00,123,'Shipping'),(138,'Stephen','Stiles','SSTILES','650.121.2034','1997-10-26','Stock Clerk',3200.00,0.00,123,'Shipping'),(139,'John','Seo','JSEO','650.121.2019','1998-02-12','Stock Clerk',2700.00,0.00,123,'Shipping'),(140,'Joshua','Patel','JPATEL','650.121.1834','1998-04-06','Stock Clerk',2500.00,0.00,123,'Shipping'),(141,'Trenna','Rajs','TRAJS','650.121.8009','1995-10-17','Stock Clerk',3500.00,0.00,124,'Shipping'),(142,'Curtis','Davies','CDAVIES','650.121.2994','1997-01-29','Stock Clerk',3100.00,0.00,124,'Shipping'),(143,'Randall','Matos','RMATOS','650.121.2874','1998-03-15','Stock Clerk',2600.00,0.00,124,'Shipping'),(144,'Peter','Vargas','PVARGAS','650.121.2004','1998-07-09','Stock Clerk',2500.00,0.00,124,'Shipping'),(145,'John','Russell','JRUSSEL','011.44.1344.429268','1996-10-01','Sales Manager',14000.00,0.40,100,'Sales'),(146,'Karen','Partners','KPARTNER','011.44.1344.467268','1997-01-05','Sales Manager',13500.00,0.30,100,'Sales'),(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','1997-03-10','Sales Manager',12000.00,0.30,100,'Sales'),(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','1999-10-15','Sales Manager',11000.00,0.30,100,'Sales'),(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2000-01-29','Sales Manager',10500.00,0.20,100,'Sales'),(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','1997-01-30','Sales Representative',10000.00,0.30,145,'Sales'),(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','1997-03-24','Sales Representative',9500.00,0.25,145,'Sales'),(152,'Peter','Hall','PHALL','011.44.1344.478968','1997-08-20','Sales Representative',9000.00,0.25,145,'Sales'),(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','1998-03-30','Sales Representative',8000.00,0.20,145,'Sales'),(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','1998-12-09','Sales Representative',7500.00,0.20,145,'Sales'),(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','1999-11-23','Sales Representative',7000.00,0.15,145,'Sales'),(156,'Janette','King','JKING','011.44.1345.429268','1996-01-30','Sales Representative',10000.00,0.35,146,'Sales'),(157,'Patrick','Sully','PSULLY','011.44.1345.929268','1996-03-04','Sales Representative',9500.00,0.35,146,'Sales'),(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','1996-08-01','Sales Representative',9000.00,0.35,146,'Sales'),(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','1997-03-10','Sales Representative',8000.00,0.30,146,'Sales'),(160,'Louise','Doran','LDORAN','011.44.1345.629268','1998-01-01','Sales Representative',7500.00,0.30,146,'Sales'),(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','1998-12-01','Sales Representative',7000.00,0.25,146,'Sales'),(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','1997-11-11','Sales Representative',10500.00,0.25,147,'Sales'),(163,'Danielle','Greene','DGREENE','011.44.1346.229268','1999-03-19','Sales Representative',9500.00,0.15,147,'Sales'),(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','2000-01-24','Sales Representative',7200.00,0.10,147,'Sales'),(165,'David','Lee','DLEE','011.44.1346.529268','2000-02-23','Sales Representative',6800.00,0.10,147,'Sales'),(166,'Sundar','Ande','SANDE','011.44.1346.629268','2000-03-24','Sales Representative',6400.00,0.10,147,'Sales'),(167,'Amit','Banda','ABANDA','011.44.1346.729268','2000-04-21','Sales Representative',6200.00,0.10,147,'Sales'),(168,'Lisa','Ozer','LOZER','011.44.1343.929268','1997-03-11','Sales Representative',11500.00,0.25,148,'Sales'),(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','1998-03-23','Sales Representative',10000.00,0.20,148,'Sales'),(170,'Tayler','Fox','TFOX','011.44.1343.729268','1998-01-24','Sales Representative',9600.00,0.20,148,'Sales'),(171,'William','Smith','WSMITH','011.44.1343.629268','1999-02-23','Sales Representative',7400.00,0.15,148,'Sales'),(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','1999-03-24','Sales Representative',7300.00,0.15,148,'Sales'),(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','2000-04-21','Sales Representative',6100.00,0.10,148,'Sales'),(174,'Ellen','Abel','EABEL','011.44.1644.429267','1996-05-11','Sales Representative',11000.00,0.30,149,'Sales'),(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','1997-03-19','Sales Representative',8800.00,0.25,149,'Sales'),(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','2000-03-24','Sales Manager',8600.00,0.20,149,'Sales'),(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','1998-04-23','Sales Representative',8400.00,0.20,149,'Sales'),(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','1999-05-24','Sale Representative',7000.00,0.15,149,'NULL'),(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','2000-01-04','Sales Representative',6200.00,0.10,149,'Sales'),(180,'Winston','Taylor','WTAYLOR','650.507.9876','1998-01-24','Shipping Clerk',3200.00,0.00,120,'Shipping'),(181,'Jean','Fleaur','JFLEAUR','650.507.9877','1998-02-23','Shipping Clerk',3100.00,0.00,120,'Shipping'),(182,'Martha','Sullivan','MSULLIVA','650.507.9878','1999-06-21','Shipping Clerk',2500.00,0.00,120,'Shipping'),(183,'Girard','Geoni','GGEONI','650.507.9879','2000-02-03','Shipping Clerk',2800.00,0.00,120,'Shipping'),(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','1996-01-27','Shipping Clerk',4200.00,0.00,121,'Shipping'),(185,'Alexis','Bull','ABULL','650.509.2876','1997-02-20','Shipping Clerk',4100.00,0.00,121,'Shipping'),(186,'Julia','Dellinger','JDELLING','650.509.3876','1998-06-24','Shipping Clerk',3400.00,0.00,121,'Shipping'),(187,'Anthony','Cabrio','ACABRIO','650.509.4876','1999-02-07','Shipping Clerk',3000.00,0.00,121,'Shipping'),(188,'Kelly','Chung','KCHUNG','650.505.1876','1997-06-14','Shipping Clerk',3800.00,0.00,122,'Shipping'),(189,'Jennifer','Dilly','JDILLY','650.505.2876','1997-08-13','Shipping Clerk',3600.00,0.00,122,'Shipping'),(190,'Timothy','Gates','TGATES','650.505.3876','1998-07-11','Shipping Clerk',2900.00,0.00,122,'Shipping'),(191,'Randall','Perkins','RPERKINS','650.505.4876','1999-12-19','Shipping Clerk',2500.00,0.00,122,'Shipping'),(192,'Sarah','Bell','SBELL','650.501.1876','1996-02-04','Shipping Clerk',4000.00,0.00,123,'Shipping'),(193,'Britney','Everett','BEVERETT','650.501.2876','1997-03-03','Shipping Clerk',3900.00,0.00,123,'Shipping'),(194,'Samuel','McCain','SMCCAIN','650.501.3876','1998-07-01','Shipping Clerk',3200.00,0.00,123,'Shipping'),(195,'Vance','Jones','VJONES','650.501.4876','1999-03-17','Shipping Clerk',2800.00,0.00,123,'Shipping'),(196,'Alana','Walsh','AWALSH','650.507.9811','1998-04-24','Shipping Clerk',3100.00,0.00,124,'Shipping'),(197,'Kevin','Feeney','KFEENEY','650.507.9822','1998-05-23','Shipping Clerk',3000.00,0.00,124,'Shipping'),(198,'Donald','OConnell','DOCONNEL','650.507.9833','1999-06-21','Shipping Clerk',2600.00,0.00,124,'Shipping'),(199,'Douglas','Grant','DGRANT','650.507.9844','2000-01-13','Shipping Clerk',2600.00,0.00,124,'Shipping'),(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1999-01-01','Administration Assistant',4400.00,0.00,101,'Administration'),(201,'Michael','Hartstein','MHARTSTE','515.123.5555','1999-12-20','Marketing Manager',13000.00,0.00,100,'Marketing'),(202,'Pat','Fay','PFAY','603.123.6666','1997-08-17','Marketing Representative',6000.00,0.00,201,'Marketing'),(203,'Susan','Mavris','SMAVRIS','515.123.7777','1994-06-07','Human Resources Representative',6500.00,0.00,101,'Human Resources'),(204,'Hermann','Baer','HBAER','515.123.8888','1994-06-07','Public Relations Representative',10000.00,0.00,101,'Public Relations'),(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1999-01-01','Accounting Manager',12000.00,0.00,101,'Accounting'),(206,'William','Gietz','WGIETZ','515.123.8181','1994-06-07','Accountant',8300.00,0.00,105,'Accounting');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job` (
  `job_title` varchar(35) NOT NULL,
  `min_salary` decimal(6,0) DEFAULT NULL,
  `max_salary` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`job_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES ('Accountant',4200,9000),('Accounting Manager',8200,16000),('Administration Assistant',3000,6000),('Administration Vice President',15000,30000),('Finance Manager',8200,16000),('Human Resources Representative',4000,9000),('Marketing Manager',9000,15000),('Marketing Representative',4000,9000),('President',20000,40000),('Programmer',4000,10000),('Public Accountant',4200,9000),('Public Relations Representative',4500,10500),('Purchasing Clerk',2500,5500),('Purchasing Manager',8000,15000),('Sales Manager',10000,20000),('Sales Representative',6000,12000),('Shipping Clerk',2500,5500),('Stock Clerk',2000,5000),('Stock Manager',5500,8500);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobhistory`
--

DROP TABLE IF EXISTS `jobhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobhistory` (
  `employee_id` decimal(6,0) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `job_title` varchar(35) NOT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`start_date`),
  KEY `JOBHISTORY_FK1` (`job_title`),
  KEY `JOBHISTORY_FK3` (`department_name`),
  CONSTRAINT `JOBHISTORY_FK1` FOREIGN KEY (`job_title`) REFERENCES `job` (`job_title`),
  CONSTRAINT `JOBHISTORY_FK2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `JOBHISTORY_FK3` FOREIGN KEY (`department_name`) REFERENCES `department` (`department_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobhistory`
--

LOCK TABLES `jobhistory` WRITE;
/*!40000 ALTER TABLE `jobhistory` DISABLE KEYS */;
INSERT INTO `jobhistory` VALUES (101,'1989-09-21','1993-10-27','Accountant','Accounting'),(101,'1993-10-28','1997-03-15','Accounting Manager','Accounting'),(102,'1993-01-13','1998-07-24','Programmer','Information Technology'),(108,'1991-07-10','1994-08-16','Shipping Clerk','Shipping'),(109,'1992-01-01','1994-08-15','Accountant','Accounting'),(110,'1996-01-01','1997-09-27','Accountant','Accounting'),(114,'1998-03-24','1999-12-31','Stock Clerk','Purchasing'),(160,'1994-12-01','1997-11-10','Shipping Clerk','Shipping'),(161,'1997-11-03','1998-11-02','Stock Clerk','Shipping'),(162,'1990-11-11','1996-11-11','Stock Clerk','Shipping'),(163,'1997-03-19','1998-11-11','Stock Clerk','Shipping'),(164,'1999-01-24','1999-11-11','Stock Clerk','Shipping'),(165,'1998-02-23','1999-02-23','Stock Clerk','Shipping'),(166,'1996-03-24','1999-02-23','Stock Clerk','Shipping'),(167,'1999-04-21','1999-12-23','Stock Clerk','Shipping'),(168,'1995-03-11','1998-02-23','Stock Clerk','Shipping'),(169,'1997-03-23','1998-01-01','Stock Clerk','Shipping'),(170,'1997-01-24','1998-01-01','Stock Clerk','Shipping'),(171,'1998-02-23','1999-02-22','Stock Clerk','Shipping'),(172,'1997-03-24','1999-03-23','Sales Representative','Sales'),(173,'1999-01-01','2000-04-20','Sales Representative','Sales'),(174,'1995-05-11','1996-05-10','Stock Clerk','Shipping'),(175,'1995-03-19','1996-03-19','Stock Clerk','Shipping'),(176,'1998-03-24','1998-12-31','Programmer','Information Technology'),(176,'1999-01-01','1999-12-31','Sales Representative','Sales'),(177,'1996-04-23','1998-04-22','Stock Clerk','Shipping'),(178,'1998-05-24','1999-01-01','Stock Clerk','Shipping'),(179,'1997-01-01','2000-01-02','Stock Clerk','Shipping'),(180,'1994-01-24','1997-12-12','Stock Clerk','Shipping'),(200,'1987-09-17','1993-06-17','Shipping Clerk','Shipping'),(200,'1993-06-18','1998-12-31','Accounting Manager','Accounting'),(201,'1996-02-17','1999-12-19','Programmer','Information Technology'),(205,'1994-07-01','1998-12-31','Programmer','Information Technology');
/*!40000 ALTER TABLE `jobhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `street_address` varchar(40) NOT NULL,
  `postal_code` varchar(12) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state_province` varchar(25) DEFAULT NULL,
  `country_name` varchar(40) NOT NULL,
  PRIMARY KEY (`street_address`,`postal_code`,`city`,`country_name`),
  UNIQUE KEY `LOCATION_CK` (`street_address`,`city`,`state_province`,`country_name`),
  KEY `LOCATION_FK` (`country_name`),
  CONSTRAINT `LOCATION_FK` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('12-98 Victoria Street','2901','Sydney','New South Wales','Australia'),('1297 Via Cola di Rie','00989','Roma','','Italy'),('1298 Vileparle (E)','490231','Bombay','Maharashtra','India'),('147 Spadina Ave','M5V 2L7','Toronto','Ontario','Canada'),('198 Clementi North','540198','Singapore','Clementi','Singapore'),('20 Rue des Corps-Saints','1730','Geneva','','Switzerland'),('2004 Charade Rd','98199','Seattle','Washington','United States of America'),('2007 Zagora St','50090','South Brunswick','New Jersey','United States of America'),('2011 Interiors Blvd','99236','South San Francisco','California','United States of America'),('2014 Jabberwocky Rd','26192','Southlake','Texas','United States of America'),('2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','Japan'),('40-5-12 Laogianggen','190518','Beijing','','China'),('6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','Canada'),('8204 Arthur St','AB2 7RT','London','','United Kingdom'),('93091 Calle della Testa','10934','Venice','','Italy'),('9450 Kamiya-cho','6823','Hiroshima','','Japan'),('9702 Chester Road','09629850293','Stretford','Manchester','United Kingdom'),('Magdalen Centre The Oxford Science Park','OX9 9ZB','Oxford','Oxford','United Kingdom'),('Mariano Escobedo 9991','11932','Mexico City','Distrito Federal','Mexico'),('Murtenstrasse 921','3095','Bern','BE','Switzerland'),('Pieter Breughelstraat 837','3029SK','Utrecht','','Netherlands'),('Rua Frei Caneca 1360 ','01307-002','Sao Paulo','','Brazil'),('Schwanthalerstr. 7031','80925','Munich','Bavaria','Germany');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `region` (
  `region_name` varchar(25) NOT NULL,
  PRIMARY KEY (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Americas'),('Asia'),('Australia and Oceania'),('Europe'),('Middle East and Africa'),('region_name');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 12:05:58

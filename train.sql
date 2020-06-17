-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: train
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `c_orders`
--

DROP TABLE IF EXISTS `c_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_orders` (
  `c_order_id` varchar(20) DEFAULT NULL,
  `passenger_id` varchar(20) DEFAULT NULL,
  `carriage` varchar(20) DEFAULT NULL,
  `seat` varchar(20) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_orders`
--

LOCK TABLES `c_orders` WRITE;
/*!40000 ALTER TABLE `c_orders` DISABLE KEYS */;
INSERT INTO `c_orders` VALUES ('12020517203252','123456','carriage','seat','一等座',35.80),('12020517203252','147258','carriage','seat','二等座',22.40),('12020517203252','654321','carriage','seat','商务座',62.00),('1202051720353','114514','carriage','seat','商务座',80.00),('1202051720353','147258','carriage','seat','二等座',30.00),('1202051720353','123456','carriage','seat','一等座',50.00),('120205180118','114514','carriage','seat','一等座',35.80),('120205180118','123456','carriage','seat','二等座',22.40),('1202051812247','654321','4','b5','商务座',80.00),('1202051812247','147258','4','b5','一等座',50.00),('1202051812425','123456','7','a8','一等座',35.80),('1202051812425','114514','12','d13','二等座',22.40),('1202051813230','222222200000000000','11','a9','一等座',35.80),('1202051813230','333333300000000000','11','a11','二等座',22.40),('1202051813230','555555500000000000','2','d9','商务座',62.00),('1202051813230','666666600000000000','13','d13','一等座',35.80),('1202051813438','333333300000000000','10','d1','一等座',35.80),('1202051813438','222222200000000000','5','a5','二等座',22.40),('120206115750','222222200000000000','13','d7','一等座',50.00),('120206115750','333333300000000000','12','b8','商务座',80.00),('120206115750','555555500000000000','9','b1','二等座',30.00),('120206115754','222222200000000000','1','d2','一等座',50.00),('120206115754','333333300000000000','8','c9','商务座',80.00),('120206115754','555555500000000000','13','b8','二等座',30.00);
/*!40000 ALTER TABLE `c_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` varchar(20) NOT NULL,
  `c_order_id` varchar(20) DEFAULT NULL,
  `train_number` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `total_price` float(10,2) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('02020517203252','12020517203252','G114','123456789012345678',120.20,'2020-05-17','1'),('0202051720353','1202051720353','G667','123456789012345678',160.00,'2020-05-17','1'),('020205180118','120205180118','G114','123456789012345678',58.20,'2020-05-18','1'),('0202051812247','1202051812247','G667','123456789012345678',130.00,'2020-05-18','0'),('0202051812425','1202051812425','G114','123456789012345678',58.20,'2020-05-18','0'),('0202051813230','1202051813230','G981','111111100000000000',156.00,'2020-05-18','1'),('0202051813438','1202051813438','G114','111111100000000000',58.20,'2020-05-18','0'),('020206115750','120206115750','G667','111111100000000000',160.00,'2020-06-01','0'),('020206115754','120206115754','G667','111111100000000000',160.00,'2020-06-01','0');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `user_id` varchar(20) DEFAULT NULL,
  `passenger_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES ('1','2','sahdu','123456'),('123456789012345678','123456','郑文杰','123456789'),('123456789012345678','654321','李文欣','987654321'),('123456789012345678','147258','邵琦','963852741'),('123456789012345678','114514','张跃','1919810'),('111111100000000000','222222200000000000','郑某','17777777777'),('111111100000000000','333333300000000000','许某','17888888888'),('111111100000000000','555555500000000000','李某','17999999999'),('111111100000000000','666666600000000000','邵某','18000000000');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_tickets`
--

DROP TABLE IF EXISTS `train_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train_tickets` (
  `train_number` varchar(10) NOT NULL,
  `departure_station` varchar(30) DEFAULT NULL,
  `destination_station` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `destination_time` time DEFAULT NULL,
  `business_ticket` int(10) DEFAULT NULL,
  `business_price` float(10,2) DEFAULT NULL,
  `lev1_ticket` int(10) DEFAULT NULL,
  `lev1_price` float(10,2) DEFAULT NULL,
  `lev2_ticket` int(10) DEFAULT NULL,
  `lev2_price` float(10,2) DEFAULT NULL,
  `noSeat_ticket` int(10) DEFAULT NULL,
  `noSeat_price` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`train_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_tickets`
--

LOCK TABLES `train_tickets` WRITE;
/*!40000 ALTER TABLE `train_tickets` DISABLE KEYS */;
INSERT INTO `train_tickets` VALUES ('G114','北京','上海','2020-05-10','08:50:00','09:48:00',150,62.00,120,35.80,100,22.45,50,22.45),('G191','嘉兴','北京','2020-05-10','08:30:00','15:30:00',150,62.00,120,35.80,100,22.45,50,22.45),('G553','上海','嘉兴','2020-04-29','08:50:00','09:48:00',150,62.00,120,35.80,100,22.45,50,22.45),('G667','北京','上海','2020-05-10','17:50:00','20:50:00',150,80.00,120,50.00,100,30.00,50,30.00),('G810','上海','北京','2020-05-10','15:30:00','17:30:00',150,62.00,120,35.80,100,22.45,50,22.45),('G981','嘉兴','上海','2020-05-10','10:30:00','11:30:00',150,62.00,120,35.80,100,22.45,50,22.45);
/*!40000 ALTER TABLE `train_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','1','1','1'),('111111100000000000','帅哥','17666666666','Aa123456'),('123456789012345678','许天弘','12345678910','12345678A');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-17 22:22:38

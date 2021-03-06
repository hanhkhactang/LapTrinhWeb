-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: qlvlxd
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `loaivatlieu`
--

DROP TABLE IF EXISTS `loaivatlieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaivatlieu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenloaivatlieu` varchar(45) DEFAULT NULL,
  `mota` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaivatlieu`
--

LOCK TABLES `loaivatlieu` WRITE;
/*!40000 ALTER TABLE `loaivatlieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaivatlieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_khachhang` int NOT NULL,
  `ngaymua` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `tongtien` int DEFAULT '200000',
  PRIMARY KEY (`id`),
  KEY `fk_idbacsy_iduser_idx1` (`id_khachhang`),
  CONSTRAINT `fk_prse_doctor` FOREIGN KEY (`id_khachhang`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,13,NULL,_binary '\0',200000),(5,13,'2021-11-12 00:00:00',_binary '\0',200000),(6,13,'2021-11-12 00:00:00',_binary '\0',200000),(7,14,'2021-11-12 00:00:00',_binary '\0',200000),(8,14,'2021-11-12 00:00:00',_binary '\0',200000),(42,15,'2021-11-14 00:00:00',_binary '',200000),(43,15,'2021-11-14 00:00:00',_binary '\0',200000),(45,15,'2021-11-14 00:00:00',_binary '\0',200000),(46,15,'2021-11-14 00:00:00',_binary '\0',200000);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptiondetails`
--

DROP TABLE IF EXISTS `prescriptiondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptiondetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idhoadon` int DEFAULT NULL,
  `idvatlieu` int DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detail_pres_idx` (`idhoadon`),
  KEY `fk_detail_medicine_idx` (`idvatlieu`),
  CONSTRAINT `fk_detail_medicine` FOREIGN KEY (`idvatlieu`) REFERENCES `vatlieuxaydung` (`id`),
  CONSTRAINT `fk_detail_pres` FOREIGN KEY (`idhoadon`) REFERENCES `prescription` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptiondetails`
--

LOCK TABLES `prescriptiondetails` WRITE;
/*!40000 ALTER TABLE `prescriptiondetails` DISABLE KEYS */;
INSERT INTO `prescriptiondetails` VALUES (1,1,1,1),(2,5,1,2),(3,7,1,2),(4,6,1,2),(5,8,1,2),(6,1,2,2),(7,5,2,2),(8,6,2,1),(9,7,2,1),(10,8,2,1),(11,1,3,4),(12,5,3,3),(13,6,3,1),(14,7,3,1),(15,8,3,1),(16,1,4,2),(17,5,4,1),(18,6,4,1),(19,7,4,1),(20,8,5,2),(21,1,5,2),(22,42,1,2),(23,42,2,2),(24,42,3,2),(25,42,4,2),(26,42,5,2);
/*!40000 ALTER TABLE `prescriptiondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cmnd` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `diachi` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'Th??nh','Duong','thanh.d@gmail.com',NULL,'admin','$2a$10$6p2W8LRBt2a.h5HDJk074.UpCBwrycs165xZLRxUYx0m/nw0XacTO',_binary '\0','ROLE_ADMIN',NULL,NULL,'https://res.cloudinary.com/conglap123/image/upload/v1635405108/lfg6612mpa9qt7ivaaqm.png'),(7,'L???p','nguyen tran','conglap.nt@gmail.com',NULL,'doctor1','$2a$10$0tgygn0yG6lE0J4.cJvBLu6x9/YSGaSO8ChtA3nTRgpOQbwrEioFy',_binary '\0','ROLE_DOCTOR','215496969','binh dinh ',NULL),(8,'Khoa','nguyen tran','chomamkhung@gmail.com',NULL,'doctor2','$2a$10$4Ltylob61O0XNzAXdwExcuv1M5Omri7zO7/eaSmlsTYJ3JinsusJm',_binary '\0','ROLE_DOCTOR',NULL,NULL,NULL),(9,'Nguy??n','Tran Thi','acd@gmail.com',NULL,'doctor3','$2a$10$fFWbox6PyPc2CoLoIghtOO.RS0Hl0tp/JKlsY5xaT06RHeZMgRwdK',_binary '\0','ROLE_DOCTOR','12','',NULL),(10,'Y???n','aa','conglap.nt@gmail.com',NULL,'nurse1','$2a$10$goRTWcYO/3L2SUwY0GNFeODnXmYVHU3Fv1zfZ4nOWsMBhqRtAQqCW',_binary '','ROLE_NURSE','1111111111','1',NULL),(11,'Uy??n','aa','conglap.nt@gmail.com',NULL,'nurse2','$2a$10$CW.8Ig2h2QvaeokRhjzx4unt.NVyl9sigeEtqctjwB/0TN90ETWk6',_binary '','ROLE_NURSE','1111111111','1',NULL),(12,'B??nh','aa','conglap.nt@gmail.com',NULL,'nurse3','$2a$10$.jwmjqqjf6vXmS9w/n0xbewmiis1aIeiH/CM5AM9cB7ZaQVje2OCa',_binary '','ROLE_NURSE','1111111111','1',NULL),(13,'H???ng','123','nguyen@gmail.com','1111111111','user1','$2a$10$.jwmjqqjf6vXmS9w/n0xbewmiis1aIeiH/CM5AM9cB7ZaQVje2OCa',_binary '\0','ROLE_USER','11111111','123','https://res.cloudinary.com/conglap123/image/upload/v1635405108/lfg6612mpa9qt7ivaaqm.png'),(14,'minh','123','nguyen@gmail.com',NULL,'user2','$2a$10$.jwmjqqjf6vXmS9w/n0xbewmiis1aIeiH/CM5AM9cB7ZaQVje2OCa',_binary '','ROLE_USER',NULL,NULL,NULL),(15,'C???m','1123','nguyen@gmail.com',NULL,'user3','$2a$10$.jwmjqqjf6vXmS9w/n0xbewmiis1aIeiH/CM5AM9cB7ZaQVje2OCa',_binary '','ROLE_USER',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vatlieuxaydung`
--

DROP TABLE IF EXISTS `vatlieuxaydung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vatlieuxaydung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `chuc_nang` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `dongia` int DEFAULT NULL,
  `conlai` int DEFAULT NULL,
  `loaivatlieu` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vatlieu_loaivatlieu_idx` (`loaivatlieu`),
  CONSTRAINT `fk_vatlieu_loaivatlieu` FOREIGN KEY (`loaivatlieu`) REFERENCES `loaivatlieu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vatlieuxaydung`
--

LOCK TABLES `vatlieuxaydung` WRITE;
/*!40000 ALTER TABLE `vatlieuxaydung` DISABLE KEYS */;
INSERT INTO `vatlieuxaydung` VALUES (1,'Paracetamol','Thu???c gi???m ??au ?????u hay h??? s???t','Li???u t???ng c???ng cao c?? th??? d???n ?????n ng??? ?????c.',NULL,NULL,NULL),(2,'Aspirin','D??ng ch???a ??au nh???c x????ng kh???p ','Ng?????i c?? b???nh th???n m???n t??nh hay lo??t bao t??? n??n h???i ?? ki???n b??c s?? tr?????c khi d??ng.',NULL,NULL,NULL),(3,'Diphenhydramine','Gi???m tri???u ch???ng ng???a v?? d??? ???ng','T???t c??? c??c thu???c n??y ?????u c?? th??? g??y nh???c ?????u, m???t m???i, v?? kh?? ch???u bao t???.',NULL,NULL,NULL),(4,'Omeprazole','Thu???c gi???m ??au bao t???, kh??ng acid','B???n c?? th??? mua c??c thu???c gi???m acid hay kh??ng acid ??? nh?? thu???c ????? d??ng t???m, u???ng v??o v??i gi??? sau m???i b???t ?????u c?? t??c d???ng.',NULL,NULL,NULL),(5,'Bismuth subsalicylate.','Thu???c ng???','L??u ?? n???u b??? m???t ng??? l??u d??i, c??n g???p b??c s?? ngay v?? nh???ng nguy hi???m x???y ra bi???n ch???ng nh?? ?????t qu???, tr???y tim, tr???m c???m, hay c??c b???nh ti??u h??a kh??c.',NULL,NULL,NULL);
/*!40000 ALTER TABLE `vatlieuxaydung` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11 20:46:56

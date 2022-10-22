-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: vendas_sucos
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRIPTOR` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANHO` varchar(50) DEFAULT NULL,
  `EMBALAGEM` varchar(50) DEFAULT NULL,
  `PRECO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES ('1000889','Sabor da Montanha - 1 Litro - Uva','Uva','1 Litro','PET',5),('1002334','Linha Citros - 1 Litro - Lima/Limão','Lima/Limão','1 Litro','PET',7.004),('1002767','Videira do Campo - 700 ml - Cereja/Maça','Cereja/Maça','700 ml','Garrafa',8.41),('1004327','Videira do Campo - 1,5 Litros - Melância','Melância','1,5 Litros','PET',19.51),('1013793','Videira do Campo - 2 Litros - Cereja/Maça','Cereja/Maça','2 Litros','PET',24.01),('1022450','Festival de Sabores - 2 Litros - Açai','Açai','2 Litros','PET',38.012),('1037797','Clean - 2 Litros - Laranja','Laranja','2 Litros','PET',16.008),('1040107','Light - 350 ml - Melância','Melância','350 ml','Lata',4.56),('1041119','Linha Citros - 700 ml - Lima/Limão','Lima/Limão','700 ml','Garrafa',4.904),('1078680','Frescor do Verão - 470 ml - Manga','Manga','470 ml','Garrafa',5.1795),('1086543','Linha Refrescante - 1 Litro - Manga','Manga','1 Litro','PET',11.0105),('1096818','Linha Refrescante - 700 ml - Manga','Manga','700 ml','Garrafa',7.7105),('1101035','Linha Refrescante - 1 Litro - Morango/Limão','Morango/Limão','1 Litro','PET',9.0105),('229900','Pedaços de Frutas - 350 ml - Maça','Maça','350 ml','Lata',4.211),('231776','Festival de Sabores - 700 ml - Açai','Açai','700 ml','Garrafa',13.312),('235653','Frescor do Verão - 350 ml - Manga','Manga','350 ml','Lata',3.8595),('243083','Festival de Sabores - 1,5 Litros - Maracujá','Maracujá','1,5 Litros','PET',11.5632),('290478','Videira do Campo - 350 ml - Melância','Melância','350 ml','Lata',4.56),('326779','Linha Refrescante - 1,5 Litros - Manga','Manga','1,5 Litros','PET',16.5105),('394479','Sabor da Montanha - 700 ml - Cereja','Cereja','700 ml','Garrafa',8.409),('479745','Clean - 470 ml - Laranja','Laranja','470 ml','Garrafa',3.768),('520380','Pedaços de Frutas - 1 Litro - Maça','Maça','1 Litro','PET',12.011),('695594','Festival de Sabores - 1,5 Litros - Açai','Açai','1,5 Litros','PET',28.512),('723457','Festival de Sabores - 700 ml - Maracujá','Maracujá','700 ml','Garrafa',5.4032),('746596','Light - 1,5 Litros - Melância','Melância','1,5 Litros','PET',19.505),('773912','Clean - 1 Litro - Laranja','Laranja','1 Litro','PET',8.008),('783663','Sabor da Montanha - 700 ml - Morango','Morango','700 ml','Garrafa',7.709),('788975','Pedaços de Frutas - 1,5 Litros - Maça','Maça','1,5 Litros','PET',18.011),('812829','Clean - 350 ml - Laranja','Laranja','350 ml','Lata',2.808),('826490','Linha Refrescante - 700 ml - Morango/Limão','Morango/Limão','700 ml','Garrafa',6.3105),('838819','Clean - 1,5 Litros - Laranja','Laranja','1,5 Litros','PET',12.008);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-15 13:43:46

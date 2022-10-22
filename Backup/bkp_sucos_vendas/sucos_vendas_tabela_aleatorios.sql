-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: sucos_vendas
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
-- Table structure for table `tabela_aleatorios`
--

DROP TABLE IF EXISTS `tabela_aleatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_aleatorios` (
  `NUMERO` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_aleatorios`
--

LOCK TABLES `tabela_aleatorios` WRITE;
/*!40000 ALTER TABLE `tabela_aleatorios` DISABLE KEYS */;
INSERT INTO `tabela_aleatorios` VALUES (74),(621),(882),(546),(84),(784),(664),(971),(861),(391),(374),(699),(369),(748),(634),(927),(733),(882),(211),(409),(414),(842),(968),(312),(657),(350),(778),(838),(857),(771),(283),(106),(679),(74),(337),(463),(303),(128),(732),(274),(174),(48),(722),(463),(150),(364),(366),(739),(598),(771),(62),(999),(805),(27),(723),(533),(494),(875),(889),(821),(436),(720),(289),(285),(561),(949),(60),(456),(98),(122),(317),(218),(139),(44),(802),(875),(968),(215),(174),(225),(605),(347),(922),(566),(66),(634),(969),(944),(810),(220),(669),(687),(426),(69),(67),(132),(456),(887),(62),(652);
/*!40000 ALTER TABLE `tabela_aleatorios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-15 13:43:41

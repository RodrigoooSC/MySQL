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
-- Table structure for table `itens_notas`
--

DROP TABLE IF EXISTS `itens_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_notas` (
  `NUMERO` varchar(5) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `QUANTIDADE` int DEFAULT NULL,
  `PRECO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`,`CODIGO`),
  KEY `FK_PRODUTOS` (`CODIGO`),
  CONSTRAINT `FK_NOTAS` FOREIGN KEY (`NUMERO`) REFERENCES `notas` (`NUMERO`),
  CONSTRAINT `FK_PRODUTOS` FOREIGN KEY (`CODIGO`) REFERENCES `produtos` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_notas`
--

LOCK TABLES `itens_notas` WRITE;
/*!40000 ALTER TABLE `itens_notas` DISABLE KEYS */;
INSERT INTO `itens_notas` VALUES ('0100','1000889',100,10),('0100','1002334',100,10),('0101','1000889',100,10),('0101','1002334',100,10),('0102','1000889',100,10),('0102','1002334',100,10),('0103','1000889',100,10),('0103','1002334',100,10),('0104','1000889',100,10),('0105','1000889',100,10),('0105','1002334',100,10),('0106','1000889',100,10);
/*!40000 ALTER TABLE `itens_notas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TG_CALCULA_FATURAMENTO_INSERT` AFTER INSERT ON `itens_notas` FOR EACH ROW begin  
	  delete from tb_faturamento;   
	  insert into tb_faturamento
	  select N.DATA_VENDA, sum(ITN.QUANTIDADE * ITN.PRECO) AS TOTAL_VENDA
	  from  notas as N
	  inner join itens_notas as ITN on N.NUMERO = ITN.NUMERO
	  group by N.DATA_VENDA;  
  end */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TG_CALCULA_FATURAMENTO_UPDATE` AFTER UPDATE ON `itens_notas` FOR EACH ROW begin  
	  delete from tb_faturamento;   
	  insert into tb_faturamento
	  select N.DATA_VENDA, sum(ITN.QUANTIDADE * ITN.PRECO) AS TOTAL_VENDA
	  from  notas as N
	  inner join itens_notas as ITN on N.NUMERO = ITN.NUMERO
	  group by N.DATA_VENDA;  
  end */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TG_CALCULA_FATURAMENTO_DELETE` AFTER DELETE ON `itens_notas` FOR EACH ROW begin  
	  delete from tb_faturamento;   
	  insert into tb_faturamento
	  select N.DATA_VENDA, sum(ITN.QUANTIDADE * ITN.PRECO) AS TOTAL_VENDA
	  from  notas as N
	  inner join itens_notas as ITN on N.NUMERO = ITN.NUMERO
	  group by N.DATA_VENDA;  
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-15 13:43:46

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
-- Temporary view structure for view `vw_maiores_embalagens`
--

DROP TABLE IF EXISTS `vw_maiores_embalagens`;
/*!50001 DROP VIEW IF EXISTS `vw_maiores_embalagens`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_maiores_embalagens` AS SELECT 
 1 AS `EMBALAGEM`,
 1 AS `MAIOR_PRECO`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_maiores_embalagens`
--

/*!50001 DROP VIEW IF EXISTS `vw_maiores_embalagens`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_maiores_embalagens` AS select `tabela_de_produtos`.`EMBALAGEM` AS `EMBALAGEM`,max(`tabela_de_produtos`.`PRECO_DE_LISTA`) AS `MAIOR_PRECO` from `tabela_de_produtos` group by `tabela_de_produtos`.`EMBALAGEM` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'sucos_vendas'
--

--
-- Dumping routines for database 'sucos_vendas'
--
/*!50003 DROP FUNCTION IF EXISTS `F_Acha_Tipo_Sabor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_Acha_Tipo_Sabor`(vSabor varchar(50)) RETURNS varchar(20) CHARSET utf8mb4
BEGIN
declare vRetorno varchar(20) default "";

	case vSabor
		when 'Lima/Limão' then set vRetorno =  'Cítrico';
		when 'Laranja' then set vRetorno ='Cítrico';
		when 'Morango/Limão' then set vRetorno ='Cítrico';
		when 'Uva' then set vRetorno ='Neutro';
		when 'Morango' then set vRetorno ='Neutro';
		else set vRetorno = 'Acidos';
	end case;

RETURN vRetorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `F_Cliente_Aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_Cliente_Aleatorio`() RETURNS varchar(11) CHARSET utf8mb4
BEGIN
declare vRetorno varchar(11);
declare vNumero_Max_CLiente int;
declare vNumeroAleatorio int;

select count(*) into vNumero_Max_CLiente from tabela_de_clientes;
set vNumeroAleatorio = F_Numero_ALeatorio(1, vNumero_Max_CLiente);
set vNumeroAleatorio =vNumeroAleatorio -1;
select CPF into vRetorno from tabela_de_clientes limit vNumeroAleatorio, 1;

RETURN vRetorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `F_Numero_Aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_Numero_Aleatorio`(vMin int, vMax int) RETURNS int
BEGIN
declare vRetorno int;
select floor((rand() * (vMax - vMin + 1)) + vMin) into vRetorno;
RETURN vRetorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `F_Numero_Notas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_Numero_Notas`(vData date) RETURNS int
BEGIN
declare vNumeroNotas int;
select count(*) into vNumeroNotas from notas_fiscais where DATA_VENDA = vData;
RETURN vNumeroNotas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `F_Produto_Aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_Produto_Aleatorio`() RETURNS varchar(100) CHARSET utf8mb4
BEGIN
declare vRetorno varchar(100);
declare vNumero_Max_Produto int;
declare vNumeroAleatorio int;

select count(*) into vNumero_Max_Produto from tabela_de_produtos;
set vNumeroAleatorio = F_Numero_ALeatorio(1, vNumero_Max_Produto);
set vNumeroAleatorio =vNumeroAleatorio -1;
select concat(CODIGO_DO_PRODUTO)  into vRetorno from tabela_de_produtos limit vNumeroAleatorio, 1;

RETURN vRetorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `F_Vendedor_Aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_Vendedor_Aleatorio`() RETURNS varchar(50) CHARSET utf8mb4
BEGIN
declare vRetorno varchar(50);
declare vNumero_Max_Vendedor int;
declare vNumeroAleatorio int;

select count(*) into vNumero_Max_Vendedor from tabela_de_vendedores;
set vNumeroAleatorio = F_Numero_ALeatorio(1, vNumero_Max_Vendedor);
set vNumeroAleatorio = vNumeroAleatorio -1;
select concat(MATRICULA) into vRetorno from tabela_de_vendedores limit vNumeroAleatorio, 1;

RETURN vRetorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Acha_sabor_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Acha_sabor_produto`(vProduto varchar(50))
BEGIN
declare vSabor varchar(50);
select SABOR into vSabor from tabela_de_produtos where CODIGO_DO_PRODUTO = vProduto;
select vSabor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Acha_status_preco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Acha_status_preco`(vProduto varchar(50))
BEGIN

declare vPreco float;
declare vMensagem varchar(30);

select PRECO_DE_LISTA into vPreco from tabela_de_produtos where CODIGO_DO_PRODUTO = vProduto;

if vPreco >= 12 then
	set vMensagem = 'Produto caro!';
elseif vPreco >=7 and  vPreco < 12 then
	set vMensagem = 'Produto em conta!';
else
	set vMensagem = 'Produto barato!';    
end if;

select vMensagem as Resultado, vPreco as 'Preço do Produto';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Acha_status_preco_case` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Acha_status_preco_case`(vProduto varchar(50))
BEGIN

declare vPreco float;
declare vMensagem varchar(30);

select PRECO_DE_LISTA into vPreco from tabela_de_produtos where CODIGO_DO_PRODUTO = vProduto;

case
	when vPreco >= 12 then set vMensagem = 'Produto caro!';
    when vPreco >=7 and  vPreco < 12 then set vMensagem = 'Produto em conta!';
    when vPreco < 7 then set vMensagem = 'Produto barato!';    
end case;

select vMensagem as Resultado, vPreco as 'Preço do Produto';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Acha_tipo_sabor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Acha_tipo_sabor`(vProduto varchar(50))
BEGIN
declare vSabor varchar(50);

select SABOR into vSabor from tabela_de_produtos where CODIGO_DO_PRODUTO = vProduto;
	case vSabor
		when 'Lima/Limão' then select vSabor as Sabor, 'Cítrico' as Tipo;
		when 'Laranja' then select vSabor as Sabor, 'Cítrico' as Tipo;
		when 'Morango/Limão' then select vSabor as Sabor, 'Cítrico' as Tipo;
		when 'Uva' then select vSabor as Sabor, 'Neutro' as Tipo;
		when 'Morango' then select vSabor as Sabor, 'Neutro' as Tipo;
		else select vSabor as Sabor, 'Acidos' as Tipo;
	end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Acha_tipo_sabor_erro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Acha_tipo_sabor_erro`(vProduto varchar(50))
BEGIN
declare vSabor varchar(50);
declare msgErro varchar(30);
declare continue handler for 1339 set msgErro = 'O case não está completo';
select SABOR into vSabor from tabela_de_produtos where CODIGO_DO_PRODUTO = vProduto;
	case vSabor
		when 'Lima/Limão' then select vSabor as Sabor, 'Cítrico' as Tipo;
		when 'Laranja' then select vSabor as Sabor, 'Cítrico' as Tipo;
		when 'Morango/Limão' then select vSabor as Sabor, 'Cítrico' as Tipo;
		when 'Uva' then select vSabor as Sabor, 'Neutro' as Tipo;
		when 'Morango' then select vSabor as Sabor, 'Neutro' as Tipo;		
	end case;
    select msgErro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Calcula_Idade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Calcula_Idade`()
BEGIN
UPDATE tabela_de_clientes set idade =  TIMESTAMPDIFF(YEAR, data_de_nascimento, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Calculo_Faturamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Calculo_Faturamento`()
BEGIN
DELETE FROM TAB_FATURAMENTO;
  INSERT INTO TAB_FATURAMENTO
  SELECT A.DATA_VENDA, SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM
  NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.DATA_VENDA;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_novo_velho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cliente_novo_velho`(vCPF varchar(20))
BEGIN
declare vResultado varchar(20);
declare vDataNascimento date;
select DATA_DE_NASCIMENTO into vDataNascimento from tabela_de_clientes where CPF = vCPF;
if vDataNascimento < '20000101' then
	set vResultado = 'Cliente Velho!';
else
	set vResultado = 'Cliente Novo!';
end if;

select vResultado as Resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Comparativo_vendas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Comparativo_vendas`(vData_1 date, vData_2 date)
BEGIN
declare vResultado float;
declare vVariacao_1 float;
declare vVariacao_2 float;
declare vMensagem varchar(30);

SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA into vVariacao_1 FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = vData_1;

SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA into vVariacao_2 FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = vData_2;

set vResultado = ((vVariacao_1  / vVariacao_2) - 1) * 100;

if vResultado > 10 then
	set vMensagem = 'Verde';
elseif vResultado >= -10 and vResultado <= 10 then
	set vMensagem = 'Amarela';
else
	set vMensagem = 'Vermelho';
end if;

select vMensagem as Status, vResultado as Resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Comparativo_vendas_case` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Comparativo_vendas_case`(vData_1 date, vData_2 date)
BEGIN
declare vResultado float;
declare vVariacao_1 float;
declare vVariacao_2 float;
declare vMensagem varchar(30);

SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA into vVariacao_1 FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = vData_1;

SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA into vVariacao_2 FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = vData_2;

set vResultado = ((vVariacao_1  / vVariacao_2) - 1) * 100;

case
	when vResultado >10 then set vMensagem = 'Verde';
    when vResultado >= -10 and vResultado <= 10 then set vMensagem = 'Amarela';
    when vResultado < -10 then set vMensagem = 'Vermelho';
end case;

select vMensagem as Status, vResultado as Resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cursor`()
BEGIN
declare vNome varchar(50);
declare c cursor for select nome from tabela_de_clientes limit 4;
open c;
fetch c into vNome;
select vNome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cursor_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cursor_1`()
BEGIN
declare vNome varchar(50);
declare c cursor for select nome from tabela_de_clientes limit 4;
open c;
fetch c into vNome;
select vNome;
fetch c into vNome;
select vNome;
fetch c into vNome;
select vNome;
fetch c into vNome;
select vNome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cursor_Looping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cursor_Looping`()
BEGIN
declare vNome varchar(50);
declare fim_do_cursor int default 0;
declare c cursor for select NOME from tabela_de_clientes;
declare continue handler for not found set fim_do_cursor = 1; -- Definimos o tipo de erro que não queremos que para a PROC.
open c;
	while fim_do_cursor = 0
	do
    
	fetch c into vNome;
    if fim_do_cursor = 0 then
	select vNome;
    end if;
    
	end while;
close c;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inclui_novo_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inclui_novo_produto`()
BEGIN
declare vCodigo varchar(50) default '3000001';
declare vNome varchar(50) default 'Sabor do mar 700ml - Manga';
declare vSabor varchar(50) default 'Manga';
declare vTamanho varchar(50) default '700 ml';
declare vEmbalagem varchar(50) default 'Garrafa';
declare vPreco decimal(10,2) default 9.25;

insert into tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
values (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inclui_novo_produto_parametro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inclui_novo_produto_parametro`(
vCodigo varchar(50),
vNome varchar(50),
vSabor varchar(50),
vTamanho varchar(50),
vEmbalagem varchar(50),
vPreco decimal(10,2))
BEGIN
declare Mensagem varchar(50);
declare exit handler for 1062 -- Comando para tratar erro
begin
	set Mensagem = 'Erro - Chave primária duplicada!';
	select Mensagem;
end;
insert into tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
values (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);

set Mensagem = 'Produto incluído com sucesso!';
select Mensagem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inserir_Venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserir_Venda`(vData date, vNumMaxItens int, vQntdMax int)
BEGIN
declare vCliente varchar(11);
declare vProduto varchar(10);
declare vVendedor varchar(5);

declare vQntdItem int;
declare vPrecoItem float;
declare vItens int;
declare vNumNota int;

declare vContador int default 1;

declare vNumItensNota int;

-- Proxima nota fiscal
select max(NUMERO) + 1 into vNumNota from notas_fiscais;

-- Cliente e vendedor aleatórios
set vCliente = F_Cliente_Aleatorio();
set vVendedor = F_Vendedor_Aleatorio();

-- Inseri os dados da nota

insert into notas_fiscais (CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO)
values(vCliente, vVendedor, vData, vNumNota, 0.18);

-- Inseri os itens da nota
set vItens = F_Numero_Aleatorio(1, vNumMaxItens);




while vContador <= vItens
do 
set vProduto = F_Produto_Aleatorio();
-- verifica se o item ja esta cadastrado
select count(*)  into vNumItensNota from itens_notas_fiscais where NUMERO = vNumNota
and CODIGO_DO_PRODUTO = vProduto;

if vNumItensNota = 0 then

	set vQntdItem = F_Numero_Aleatorio(10, vQntdMax); 
	select PRECO_DE_LISTA into vPrecoItem from tabela_de_produtos where CODIGO_DO_PRODUTO = vProduto;
	insert into itens_notas_fiscais (NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO)
	values(vNumNota, vProduto, vQntdItem, vPrecoItem);
end if;

set vContador = vContador + 1;    
end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Limite_creditos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Limite_creditos`()
BEGIN
declare Limite_Credito float;
declare Limite_Credito_Total float;
declare fim_do_cursor int;
declare c cursor for select LIMITE_DE_CREDITO from Tabela_de_Clientes;
declare continue handler for not found set fim_do_cursor = 1;
set fim_do_cursor = 0;
set Limite_Credito_Total = 0;
set Limite_Credito = 0;
open c;
while fim_do_cursor = 0
do
fetch c into Limite_Credito;
    if fim_do_cursor = 0 then
        set Limite_Credito_Total = Limite_Credito_Total + Limite_Credito;
    end if;
end while;
select Limite_Credito_Total;
close c;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Looping_cursor_multiplas_colunas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Looping_cursor_multiplas_colunas`()
BEGIN
declare fim_do_cursor int default 0;
declare vCidade, vEstado, vCep varchar(50);
declare vNome, vEndereco varchar(150);
declare c cursor for
select NOME, ENDERECO_1, CIDADE, ESTADO, CEP from tabela_de_clientes;
declare continue handler for not found set fim_do_cursor = 1;
open c;
while fim_do_cursor = 0
do
	fetch c into vNome, vEndereco, vCidade, vEstado, vCep;
    if fim_do_cursor = 0 then
    select concat(vNome, ' / Endereço: ', vEndereco,', ', vCidade,' - ', vEstado,', CEP: ', vCep) as 'Nome/Endereço';
    end if;
end while;
close c;








END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Looping_while` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Looping_while`(vNumInicial int, vNumFinal int)
BEGIN
declare vContador int;
delete from tab_looping;
set vContador = vNumInicial;

while vContador <= vNumFinal
do
	insert into tab_looping (id) values (vContador);
	set vContador = vContador + 1;
end while;

select * from tab_looping;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Mais_Um_Campo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mais_Um_Campo`()
BEGIN
declare fim_do_cursor int default 0;
declare vQuantidade float;
declare vPreco float;
declare vFaturamento float;
declare c cursor for
select INF.QUANTIDADE, INF.PRECO from itens_notas_fiscais as INF
inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
where month(NF.DATA_VENDA) = 1 and year(NF.DATA_VENDA) = 2017;
declare continue handler for not found set fim_do_cursor = 1;
open c;
set fim_do_cursor = 0;
set vFaturamento = 0;
while fim_do_cursor = 0
do
	fetch c into vQuantidade, vPreco;
    if fim_do_cursor = 0 then    
    set vFaturamento = vFaturamento + (vQuantidade * vPreco);        
    end if;
end while;
close c;

select vFaturamento as FATURAMENTO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manipulacao_dados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manipulacao_dados`()
BEGIN
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Quantidade_notas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Quantidade_notas`()
BEGIN
DECLARE NUMNOTAS INT;
SELECT COUNT(*) INTO NUMNOTAS  FROM NOTAS_FISCAIS WHERE DATA_VENDA = '20170101';
SELECT NUMNOTAS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Reajuste_comissao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Reajuste_comissao`(vReajuste float)
BEGIN
update tabela_de_vendedores set PERCENTUAL_COMISSAO = PERCENTUAL_COMISSAO * (1 + vReajuste);
select * from tabela_de_vendedores;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Soma_Dias_Notas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Soma_Dias_Notas`()
BEGIN
DECLARE DATAINICIAL DATE;
DECLARE DATAFINAL DATE;
DECLARE NUMNOTAS INT;
SET DATAINICIAL = '20170101';
SET DATAFINAL = '20170110';
WHILE DATAINICIAL <= DATAFINAL
DO
SELECT COUNT(*) INTO NUMNOTAS  FROM notas_fiscais WHERE DATA_VENDA = DATAINICIAL;
SELECT concat(DATE_FORMAT(DATAINICIAL, '%d/%m/%Y'), '-' , CAST(NUMNOTAS as CHAR(50)));
SELECT ADDDATE(DATAINICIAL, INTERVAL 1 DAY) INTO DATAINICIAL;
END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Tabela_Numeros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Tabela_Numeros`()
BEGIN
declare vContador int;
declare vContadorMax int;
set vContador = 1;
set vContadorMax = 100;
delete from tabela_aleatorios;

while vContador <= vContadorMax
do    
	insert into tabela_aleatorios (NUMERO) values (F_Numero_Aleatorio(0,1000));
	set vContador = vContador + 1;
end while;

select * from tabela_aleatorios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Testa_numero_notas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Testa_numero_notas`(vData date)
BEGIN
declare vResultado varchar(20);
declare vNumNotas integer;

SELECT COUNT(*) INTO vNumNotas FROM NOTAS_FISCAIS WHERE DATA_VENDA = vData;

if vNumNotas >= 70 then
	set vResultado = 'Muita Nota!';
else
	set vResultado = 'Pouca Nota!';
end if;

select vResultado as Resultado, vNumNotas as 'Numero de Notas';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Teste_select_into` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Teste_select_into`()
BEGIN

declare vNome varchar(50);
select nome into vNome from tabel_de_clientes;
select vNome;

END ;;
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

-- Dump completed on 2022-10-15 13:43:44

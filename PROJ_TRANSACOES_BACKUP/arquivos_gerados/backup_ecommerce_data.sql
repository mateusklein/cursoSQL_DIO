-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,'Mariana Lima','3198765432','Comum'),(4,'Pedro Henrique','4198765432','VIP'),(5,'Juliana Costa','5198765432','Comum'),(6,'Roberto Almeida','6198765432','Comum');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_del_cli` BEFORE DELETE ON `cliente` FOR EACH ROW insert into old_clientes (nome, contato, perfil) values (old.Nome_completo, old.contato, old.perfil) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Depósito Central',500),(2,'Filial Zona Sul',200),(3,'Filial Zona Norte',300),(4,'Filial Centro',250),(5,'Depósito Externo',150),(6,'Armazém Virtual',100);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Tech Distribuidora','12345678000199','1133224455'),(2,'Global Eletrônicos','22345678000288','2133224455'),(3,'Digital Solutions','32345678000377','3133224455'),(4,'PC Hardware Ltda','42345678000466','4133224455'),(5,'Soft Tech Brasil','52345678000555','5133224455'),(6,'Mega Informática','62345678000644','6133224455');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `old_clientes`
--

LOCK TABLES `old_clientes` WRITE;
/*!40000 ALTER TABLE `old_clientes` DISABLE KEYS */;
INSERT INTO `old_clientes` VALUES (1,'Ana Souza','2198765432','VIP');
/*!40000 ALTER TABLE `old_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ordem_de_servico`
--

LOCK TABLES `ordem_de_servico` WRITE;
/*!40000 ALTER TABLE `ordem_de_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_de_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (3,3,'Atualização do sistema','Upgrade','Software','Baixa'),(4,4,'Tela quebrada','Substituir display','Hardware','Alta'),(5,5,'Instalação de programa','Novo software','Software','Média'),(6,6,'Placa-mãe com defeito','Troca completa','Hardware','Alta');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_prioridade_pedido` BEFORE UPDATE ON `pedido` FOR EACH ROW BEGIN
    IF (NEW.Prioridade = 'Baixa' AND (OLD.Prioridade = 'Alta' OR OLD.Prioridade = 'Média')) 
       OR (NEW.Prioridade = 'Média' AND OLD.Prioridade = 'Alta') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Não é permitido reduzir a prioridade de um pedido.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `pedido_gerado`
--

LOCK TABLES `pedido_gerado` WRITE;
/*!40000 ALTER TABLE `pedido_gerado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_gerado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Computador','Notebook Dell',5300.00),(2,'Celular','iPhone 13',7000.00),(3,'Acessório','Mouse sem fio',150.00),(4,'Hardware','Placa de vídeo RTX 3060',2800.00),(5,'Software','Licença Windows 10',600.00),(7,'Computador','PC Gamer',6100.00),(8,'Computador','PC Gamer',6100.00),(9,'Computador','PC Gamer',6100.00),(10,'EXEMPLO_PROC','EXEMPLO PROC',6100.00),(11,'EXEMPLO_PROC','EXEMPLO PROC',6100.00),(12,'EXEMPLO_PROC','EXEMPLO PROC',6100.56),(13,'EXEMPLO_PROC','EXEMPLO PROC',6100.56),(14,'CELULAR','Iphone 16',8200.50),(15,'CELULAR','Iphone 16',8200.50),(16,'CELULAR','Xiaomi',3200.50),(17,'CELULAR','Xiaomi',3200.50),(18,'CELULAR','Redmi',3200.50),(19,'Exemplo','Exemplo procedure',3200.50),(20,'Exemplo','My_ex',3200.50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto_em_estoque`
--

LOCK TABLES `produto_em_estoque` WRITE;
/*!40000 ALTER TABLE `produto_em_estoque` DISABLE KEYS */;
INSERT INTO `produto_em_estoque` VALUES (1,1,10),(2,2,20),(3,3,30),(4,4,40),(5,5,50);
/*!40000 ALTER TABLE `produto_em_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
INSERT INTO `produto_fornecedor` VALUES (1,1,50),(2,2,30),(3,3,100),(4,4,20),(5,5,60);
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto_pedido`
--

LOCK TABLES `produto_pedido` WRITE;
/*!40000 ALTER TABLE `produto_pedido` DISABLE KEYS */;
INSERT INTO `produto_pedido` VALUES (3,3,'5','disponível'),(4,4,'3','disponível'),(4,5,'12','disponível'),(5,5,'4','sem estoque');
/*!40000 ALTER TABLE `produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produtos_vendedor`
--

LOCK TABLES `produtos_vendedor` WRITE;
/*!40000 ALTER TABLE `produtos_vendedor` DISABLE KEYS */;
INSERT INTO `produtos_vendedor` VALUES (1,1,5),(2,2,10),(3,3,15),(4,4,20),(5,5,25);
/*!40000 ALTER TABLE `produtos_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `terceiro_vendedor`
--

LOCK TABLES `terceiro_vendedor` WRITE;
/*!40000 ALTER TABLE `terceiro_vendedor` DISABLE KEYS */;
INSERT INTO `terceiro_vendedor` VALUES (1,'Vendedor 1 Ltda','São Paulo','Tech Store','78945612000155','123456789'),(2,'Vendedor 2 Ltda','Rio de Janeiro','Eletrônicos RJ','78945612000244','223456789'),(3,'Vendedor 3 Ltda','Belo Horizonte','BH Tech','78945612000333','323456789'),(4,'Vendedor 4 Ltda','Curitiba','Curitiba Cell','78945612000422','423456789'),(5,'Vendedor 5 Ltda','Salvador','Bahia Eletrônicos','78945612000511','523456789'),(6,'Vendedor 6 Ltda','Porto Alegre','RS Informática','78945612000600','623456789');
/*!40000 ALTER TABLE `terceiro_vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 12:15:11

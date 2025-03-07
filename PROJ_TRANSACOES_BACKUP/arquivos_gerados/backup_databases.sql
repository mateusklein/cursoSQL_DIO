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
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nome_completo` varchar(45) DEFAULT NULL,
  `contato` char(10) DEFAULT NULL,
  `perfil` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `Nome_completo_UNIQUE` (`Nome_completo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `Local` varchar(45) NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Depósito Central',500),(2,'Filial Zona Sul',200),(3,'Filial Zona Norte',300),(4,'Filial Centro',250),(5,'Depósito Externo',150),(6,'Armazém Virtual',100);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `Razao_Social` varchar(45) DEFAULT NULL,
  `CNPJ` char(15) NOT NULL,
  `contato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Tech Distribuidora','12345678000199','1133224455'),(2,'Global Eletrônicos','22345678000288','2133224455'),(3,'Digital Solutions','32345678000377','3133224455'),(4,'PC Hardware Ltda','42345678000466','4133224455'),(5,'Soft Tech Brasil','52345678000555','5133224455'),(6,'Mega Informática','62345678000644','6133224455');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_clientes`
--

DROP TABLE IF EXISTS `old_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `old_clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `contato` varchar(20) DEFAULT NULL,
  `perfil` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_clientes`
--

LOCK TABLES `old_clientes` WRITE;
/*!40000 ALTER TABLE `old_clientes` DISABLE KEYS */;
INSERT INTO `old_clientes` VALUES (1,'Ana Souza','2198765432','VIP');
/*!40000 ALTER TABLE `old_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_de_servico`
--

DROP TABLE IF EXISTS `ordem_de_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_de_servico` (
  `idOrdem_de_Servico` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) DEFAULT NULL,
  `Prioridade` varchar(45) DEFAULT NULL,
  `Pedido_has_Responsavel_Pedido_idPedido` int NOT NULL,
  `Pedido_has_Responsavel_Responsavel_idResponsavel` int NOT NULL,
  PRIMARY KEY (`idOrdem_de_Servico`),
  KEY `fk_OS_PedidoGerado` (`Pedido_has_Responsavel_Pedido_idPedido`,`Pedido_has_Responsavel_Responsavel_idResponsavel`),
  CONSTRAINT `fk_OS_PedidoGerado` FOREIGN KEY (`Pedido_has_Responsavel_Pedido_idPedido`, `Pedido_has_Responsavel_Responsavel_idResponsavel`) REFERENCES `pedido_gerado` (`Pedido_idPedido`, `Responsavel_idResponsavel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_de_servico`
--

LOCK TABLES `ordem_de_servico` WRITE;
/*!40000 ALTER TABLE `ordem_de_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_de_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` int NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Titulo_pedido` varchar(45) DEFAULT NULL,
  `Tipo_problema` enum('Software','Hardware') DEFAULT NULL,
  `Prioridade` enum('Baixa','Média','Alta') DEFAULT 'Baixa',
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Cliente_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Pedido_Cliente` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `pedido_gerado`
--

DROP TABLE IF EXISTS `pedido_gerado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_gerado` (
  `Pedido_idPedido` int NOT NULL,
  `Responsavel_idResponsavel` int NOT NULL,
  `Setor_responsavel` varchar(45) DEFAULT 'Help desk',
  `Comentarios` varchar(45) DEFAULT NULL,
  `Setor_encaminhado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Pedido_idPedido`,`Responsavel_idResponsavel`),
  KEY `fk_PedidoGerado_Responsavel` (`Responsavel_idResponsavel`),
  CONSTRAINT `fk_PedidoGerado_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PedidoGerado_Responsavel` FOREIGN KEY (`Responsavel_idResponsavel`) REFERENCES `responsavel` (`idResponsavel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_gerado`
--

LOCK TABLES `pedido_gerado` WRITE;
/*!40000 ALTER TABLE `pedido_gerado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_gerado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(45) NOT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `Valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Computador','Notebook Dell',5300.00),(2,'Celular','iPhone 13',7000.00),(3,'Acessório','Mouse sem fio',150.00),(4,'Hardware','Placa de vídeo RTX 3060',2800.00),(5,'Software','Licença Windows 10',600.00),(7,'Computador','PC Gamer',6100.00),(8,'Computador','PC Gamer',6100.00),(9,'Computador','PC Gamer',6100.00),(10,'EXEMPLO_PROC','EXEMPLO PROC',6100.00),(11,'EXEMPLO_PROC','EXEMPLO PROC',6100.00),(12,'EXEMPLO_PROC','EXEMPLO PROC',6100.56),(13,'EXEMPLO_PROC','EXEMPLO PROC',6100.56),(14,'CELULAR','Iphone 16',8200.50),(15,'CELULAR','Iphone 16',8200.50),(16,'CELULAR','Xiaomi',3200.50),(17,'CELULAR','Xiaomi',3200.50),(18,'CELULAR','Redmi',3200.50),(19,'Exemplo','Exemplo procedure',3200.50),(20,'Exemplo','My_ex',3200.50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_em_estoque`
--

DROP TABLE IF EXISTS `produto_em_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_em_estoque` (
  `Produto_idProduto` int NOT NULL,
  `Estoque_idEstoque` int NOT NULL,
  `Localizacao` int DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Estoque_idEstoque`),
  KEY `fk_ProdutoEstoque_Estoque` (`Estoque_idEstoque`),
  CONSTRAINT `fk_ProdutoEstoque_Estoque` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ProdutoEstoque_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_em_estoque`
--

LOCK TABLES `produto_em_estoque` WRITE;
/*!40000 ALTER TABLE `produto_em_estoque` DISABLE KEYS */;
INSERT INTO `produto_em_estoque` VALUES (1,1,10),(2,2,20),(3,3,30),(4,4,40),(5,5,50);
/*!40000 ALTER TABLE `produto_em_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedor`
--

DROP TABLE IF EXISTS `produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_fornecedor` (
  `Fornecedor_idFornecedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`,`Produto_idProduto`),
  KEY `fk_ProdutoFornecedor_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_ProdutoFornecedor_Fornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ProdutoFornecedor_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
INSERT INTO `produto_fornecedor` VALUES (1,1,50),(2,2,30),(3,3,100),(4,4,20),(5,5,60);
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_pedido`
--

DROP TABLE IF EXISTS `produto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_pedido` (
  `Produto_idProduto` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  `Quantidade` varchar(45) NOT NULL,
  `Status` enum('disponível','sem estoque') DEFAULT 'disponível',
  PRIMARY KEY (`Produto_idProduto`,`Pedido_idPedido`),
  KEY `fk_ProdutoPedido_Pedido` (`Pedido_idPedido`),
  CONSTRAINT `fk_ProdutoPedido_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ProdutoPedido_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_pedido`
--

LOCK TABLES `produto_pedido` WRITE;
/*!40000 ALTER TABLE `produto_pedido` DISABLE KEYS */;
INSERT INTO `produto_pedido` VALUES (3,3,'5','disponível'),(4,4,'3','disponível'),(4,5,'12','disponível'),(5,5,'4','sem estoque');
/*!40000 ALTER TABLE `produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_vendedor`
--

DROP TABLE IF EXISTS `produtos_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_vendedor` (
  `idPseller` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  PRIMARY KEY (`idPseller`,`Produto_idProduto`),
  KEY `fk_ProdutosVendedor_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_ProdutosVendedor_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ProdutosVendedor_Vendedor` FOREIGN KEY (`idPseller`) REFERENCES `terceiro_vendedor` (`idTerceiro_Vendedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_vendedor`
--

LOCK TABLES `produtos_vendedor` WRITE;
/*!40000 ALTER TABLE `produtos_vendedor` DISABLE KEYS */;
INSERT INTO `produtos_vendedor` VALUES (1,1,5),(2,2,10),(3,3,15),(4,4,20),(5,5,25);
/*!40000 ALTER TABLE `produtos_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel` (
  `idResponsavel` int NOT NULL AUTO_INCREMENT,
  `Setor` varchar(45) DEFAULT NULL,
  `Matricula` varchar(45) DEFAULT NULL,
  `Cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idResponsavel`),
  UNIQUE KEY `Matricula_UNIQUE` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceiro_vendedor`
--

DROP TABLE IF EXISTS `terceiro_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceiro_vendedor` (
  `idTerceiro_Vendedor` int NOT NULL AUTO_INCREMENT,
  `Razao_Social` varchar(45) NOT NULL,
  `Local` varchar(45) DEFAULT NULL,
  `Nome_Fantasia` varchar(45) DEFAULT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(9) DEFAULT NULL,
  PRIMARY KEY (`idTerceiro_Vendedor`),
  UNIQUE KEY `Razao_Social_UNIQUE` (`Razao_Social`),
  UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceiro_vendedor`
--

LOCK TABLES `terceiro_vendedor` WRITE;
/*!40000 ALTER TABLE `terceiro_vendedor` DISABLE KEYS */;
INSERT INTO `terceiro_vendedor` VALUES (1,'Vendedor 1 Ltda','São Paulo','Tech Store','78945612000155','123456789'),(2,'Vendedor 2 Ltda','Rio de Janeiro','Eletrônicos RJ','78945612000244','223456789'),(3,'Vendedor 3 Ltda','Belo Horizonte','BH Tech','78945612000333','323456789'),(4,'Vendedor 4 Ltda','Curitiba','Curitiba Cell','78945612000422','423456789'),(5,'Vendedor 5 Ltda','Salvador','Bahia Eletrônicos','78945612000511','523456789'),(6,'Vendedor 6 Ltda','Porto Alegre','RS Informática','78945612000600','623456789');
/*!40000 ALTER TABLE `terceiro_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `transactionexample`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `transactionexample` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `transactionexample`;

--
-- Table structure for table `engine_ex`
--

DROP TABLE IF EXISTS `engine_ex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_ex` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_ex`
--

LOCK TABLES `engine_ex` WRITE;
/*!40000 ALTER TABLE `engine_ex` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine_ex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderNumbers` int NOT NULL AUTO_INCREMENT,
  `orderDate` date DEFAULT NULL,
  `requiredDate` date DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `orderStatus` enum('DESPACHADO','EM PROGRESSO','ENTREGUE') DEFAULT NULL,
  `customerNumber` int DEFAULT NULL,
  PRIMARY KEY (`orderNumbers`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-02-01','2024-02-05','2024-02-03','DESPACHADO',101),(2,'2024-02-02','2024-02-06','2024-02-04','ENTREGUE',102),(3,'2024-02-03','2024-02-07','2024-02-05','DESPACHADO',101),(4,'2024-02-04','2024-02-08','2024-02-06','EM PROGRESSO',104),(5,'2024-02-05','2024-02-09','2024-02-07','ENTREGUE',105),(9,'2005-05-31','2005-06-10','2005-06-11','EM PROGRESSO',103);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersdetails`
--

DROP TABLE IF EXISTS `ordersdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersdetails` (
  `orderNumbers` int NOT NULL AUTO_INCREMENT,
  `productCode` varchar(255) NOT NULL,
  `quantityOrder` int DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderNumbers`,`productCode`),
  CONSTRAINT `fk_orderdetails` FOREIGN KEY (`orderNumbers`) REFERENCES `orders` (`orderNumbers`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdetails`
--

LOCK TABLES `ordersdetails` WRITE;
/*!40000 ALTER TABLE `ordersdetails` DISABLE KEYS */;
INSERT INTO `ordersdetails` VALUES (1,'P001',2,'102'),(1,'P002',1,'52'),(2,'P003',3,'77'),(3,'P001',1,'102'),(4,'P004',2,'202'),(9,'18_1749',30,'138'),(9,'18_2248',50,'57.09');
/*!40000 ALTER TABLE `ordersdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `universidade`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `universidade` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `universidade`;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `idAluno` int NOT NULL,
  `name` varchar(30) DEFAULT 'NOME',
  PRIMARY KEY (`idAluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Joao'),(2,'Maria'),(3,'Carlos'),(4,'Ana'),(5,'Pedro'),(6,'Luana');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idCurso` int NOT NULL,
  `Departamento_idDepartamento` int NOT NULL,
  `name` varchar(30) DEFAULT 'NOME',
  PRIMARY KEY (`idCurso`,`Departamento_idDepartamento`),
  KEY `fk_Curso_Departamento1` (`Departamento_idDepartamento`),
  CONSTRAINT `fk_Curso_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,1,'Curso de Ciências'),(2,2,'Curso de Matemática'),(3,3,'Curso de História'),(4,4,'Curso de Engenharia'),(5,5,'Curso de Física'),(6,6,'Curso de Química');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `idDepartamento` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Campus` varchar(45) NOT NULL,
  `idProfessor_coordenador` int NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `fk_Departamento_Professor1` (`idProfessor_coordenador`),
  CONSTRAINT `fk_Departamento_Professor1` FOREIGN KEY (`idProfessor_coordenador`) REFERENCES `professor` (`idProfessor`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Ciências','Campus A',1),(2,'Departamento de Matemática','Campus B',2),(3,'Departamento de História','Campus C',3),(4,'Departamento de Engenharia','Campus D',4),(5,'Departamento de Física','Campus E',5),(6,'Departamento de Química','Campus F',6);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `idDisciplina` int NOT NULL,
  `name` varchar(30) DEFAULT 'NOME',
  `Professor_idProfessor` int NOT NULL,
  PRIMARY KEY (`idDisciplina`,`Professor_idProfessor`),
  KEY `fk_Disciplina_Professor1` (`Professor_idProfessor`),
  CONSTRAINT `fk_Disciplina_Professor1` FOREIGN KEY (`Professor_idProfessor`) REFERENCES `professor` (`idProfessor`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Matemática I',1),(2,'Física I',2),(3,'História Antiga',3),(4,'Química Orgânica',4),(5,'Cálculo III',5),(6,'Física Quântica',6);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina_curso`
--

DROP TABLE IF EXISTS `disciplina_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina_curso` (
  `Disciplina_idDisciplina` int NOT NULL,
  `Curso_idCurso` int NOT NULL,
  PRIMARY KEY (`Disciplina_idDisciplina`,`Curso_idCurso`),
  KEY `fk_Disciplina_has_Curso_Curso1` (`Curso_idCurso`),
  CONSTRAINT `fk_Disciplina_has_Curso_Curso1` FOREIGN KEY (`Curso_idCurso`) REFERENCES `curso` (`idCurso`) ON DELETE CASCADE,
  CONSTRAINT `fk_Disciplina_has_Curso_Disciplina1` FOREIGN KEY (`Disciplina_idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina_curso`
--

LOCK TABLES `disciplina_curso` WRITE;
/*!40000 ALTER TABLE `disciplina_curso` DISABLE KEYS */;
INSERT INTO `disciplina_curso` VALUES (1,1),(2,2),(3,3),(2,4),(5,5),(6,6);
/*!40000 ALTER TABLE `disciplina_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculado`
--

DROP TABLE IF EXISTS `matriculado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculado` (
  `Aluno_idAluno` int NOT NULL,
  `Disciplina_idDisciplina` int NOT NULL,
  PRIMARY KEY (`Aluno_idAluno`,`Disciplina_idDisciplina`),
  KEY `fk_Aluno_has_Disciplina_Disciplina1` (`Disciplina_idDisciplina`),
  CONSTRAINT `fk_Aluno_has_Disciplina_Aluno` FOREIGN KEY (`Aluno_idAluno`) REFERENCES `aluno` (`idAluno`) ON DELETE CASCADE,
  CONSTRAINT `fk_Aluno_has_Disciplina_Disciplina1` FOREIGN KEY (`Disciplina_idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculado`
--

LOCK TABLES `matriculado` WRITE;
/*!40000 ALTER TABLE `matriculado` DISABLE KEYS */;
INSERT INTO `matriculado` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `matriculado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_requisitos`
--

DROP TABLE IF EXISTS `pre_requisitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_requisitos` (
  `idPre_requisitos` int NOT NULL,
  PRIMARY KEY (`idPre_requisitos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_requisitos`
--

LOCK TABLES `pre_requisitos` WRITE;
/*!40000 ALTER TABLE `pre_requisitos` DISABLE KEYS */;
INSERT INTO `pre_requisitos` VALUES (1),(3),(4),(5),(6),(8);
/*!40000 ALTER TABLE `pre_requisitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_requisitos_das_disciplinas`
--

DROP TABLE IF EXISTS `pre_requisitos_das_disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_requisitos_das_disciplinas` (
  `Disciplina_idDisciplina` int NOT NULL,
  `Pre_requisitos_idPre_requisitos` int NOT NULL,
  PRIMARY KEY (`Disciplina_idDisciplina`,`Pre_requisitos_idPre_requisitos`),
  KEY `fk_Disciplina_has_Pre_requisitos_Pre_requisitos1` (`Pre_requisitos_idPre_requisitos`),
  CONSTRAINT `fk_Disciplina_has_Pre_requisitos_Disciplina1` FOREIGN KEY (`Disciplina_idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE CASCADE,
  CONSTRAINT `fk_Disciplina_has_Pre_requisitos_Pre_requisitos1` FOREIGN KEY (`Pre_requisitos_idPre_requisitos`) REFERENCES `pre_requisitos` (`idPre_requisitos`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_requisitos_das_disciplinas`
--

LOCK TABLES `pre_requisitos_das_disciplinas` WRITE;
/*!40000 ALTER TABLE `pre_requisitos_das_disciplinas` DISABLE KEYS */;
INSERT INTO `pre_requisitos_das_disciplinas` VALUES (1,1),(3,3),(4,4),(2,5),(5,5),(6,6);
/*!40000 ALTER TABLE `pre_requisitos_das_disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `idProfessor` int NOT NULL,
  `Departamento_idDepartamento` int NOT NULL,
  `name` varchar(30) DEFAULT 'NOME',
  PRIMARY KEY (`idProfessor`,`Departamento_idDepartamento`),
  KEY `fk_Professor_Departamento1` (`Departamento_idDepartamento`),
  CONSTRAINT `fk_Professor_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,1,'Professor Carlos'),(2,2,'Professor Maria'),(3,3,'Professor João'),(4,4,'Professor Ana'),(5,5,'Professor Exemplo agoraaa'),(6,6,'Professor Luana');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 12:11:21

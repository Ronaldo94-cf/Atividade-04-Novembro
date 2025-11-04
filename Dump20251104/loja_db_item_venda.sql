-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: loja_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item_venda` int NOT NULL AUTO_INCREMENT,
  `id_venda` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS ((`quantidade` * `preco_unitario`)) STORED,
  PRIMARY KEY (`id_item_venda`),
  KEY `fk_itemvenda_venda` (`id_venda`),
  KEY `fk_itemvenda_produto` (`id_produto`),
  CONSTRAINT `fk_itemvenda_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_itemvenda_venda` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` (`id_item_venda`, `id_venda`, `id_produto`, `quantidade`, `preco_unitario`) VALUES (1,1,1,2,150.00),(2,1,2,1,300.00),(3,2,3,1,950.00),(4,2,4,2,1200.00),(5,1,1,2,150.00),(6,1,2,1,300.00),(7,2,3,1,950.00),(8,2,4,2,1200.00),(9,1,1,2,150.00),(10,1,2,1,300.00),(11,2,3,1,950.00),(12,2,4,2,1200.00),(13,1,1,2,150.00),(14,1,2,1,300.00),(15,2,3,1,950.00),(16,2,4,2,1200.00),(17,1,1,2,150.00),(18,1,2,1,300.00),(19,2,3,1,950.00),(20,2,4,2,1200.00),(21,1,1,2,150.00),(22,1,2,1,300.00),(23,2,3,1,950.00),(24,2,4,2,1200.00),(25,1,1,2,150.00),(26,1,2,1,300.00),(27,2,3,1,950.00),(28,2,4,2,1200.00),(29,1,1,2,150.00),(30,1,2,1,300.00),(31,2,3,1,950.00),(32,2,4,2,1200.00),(33,1,1,2,150.00),(34,1,2,1,300.00),(35,2,3,1,950.00),(36,2,4,2,1200.00),(37,1,1,2,150.00),(38,1,2,1,300.00),(39,2,3,1,950.00),(40,2,4,2,1200.00),(41,1,1,2,150.00),(42,1,2,1,300.00),(43,2,3,1,950.00),(44,2,4,2,1200.00),(45,1,1,2,150.00),(46,1,2,1,300.00),(47,2,3,1,950.00),(48,2,4,2,1200.00),(49,1,1,2,150.00),(50,1,2,1,300.00),(51,2,3,1,950.00),(52,2,4,2,1200.00);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 14:30:47

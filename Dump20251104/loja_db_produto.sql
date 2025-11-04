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
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int DEFAULT '0',
  `id_fornecedor` int NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_produto_fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(2,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(3,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(4,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(5,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(6,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(7,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(8,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(9,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(10,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(11,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(12,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(13,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(14,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(15,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(16,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(17,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(18,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(19,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(20,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(21,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(22,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(23,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(24,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(25,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(26,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(27,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(28,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(29,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(30,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(31,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(32,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(33,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(34,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(35,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(36,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(37,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(38,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(39,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(40,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(41,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(42,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(43,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(44,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(45,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(46,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(47,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(48,'Monitor 24\"','Full HD 144Hz',1200.00,20,1),(49,'Mouse Gamer','Mouse óptico RGB 16000 DPI',150.00,50,1),(50,'Teclado Mecânico','Switch Blue - Iluminação RGB',300.00,30,1),(51,'Cadeira Ergonômica','Cadeira com apoio lombar e regulagem de altura',950.00,10,2),(52,'Monitor 24\"','Full HD 144Hz',1200.00,20,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
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

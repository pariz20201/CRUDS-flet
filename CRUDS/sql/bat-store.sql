-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bat-store
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `apartado`
--

DROP TABLE IF EXISTS `apartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartado` (
  `idApartado` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `total` float NOT NULL,
  `Estado(cancelado,activo,completado)` varchar(45) NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` char(10) NOT NULL,
  `caja_idcaja` int NOT NULL,
  PRIMARY KEY (`idApartado`),
  KEY `fk_Apartado_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_Apartado_caja1_idx` (`caja_idcaja`),
  CONSTRAINT `fk_Apartado_caja1` FOREIGN KEY (`caja_idcaja`) REFERENCES `caja` (`idcaja`),
  CONSTRAINT `fk_Apartado_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartado`
--

LOCK TABLES `apartado` WRITE;
/*!40000 ALTER TABLE `apartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `codigo_barras` char(13) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Precio` float NOT NULL,
  `reorden` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_barras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES ('1234567890123','Funko Pop Naruto Uzumaki',350,'10 unidades'),('2345678901234','Póster Attack on Titan',120,'15 unidades'),('3456789012345','Figura Goku Super Saiyan',450,'5 unidades'),('4567890123456','Camiseta My Hero Academia',200,'20 unidades'),('5678901234567','Llavero Sailor Moon',50,'30 unidades');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `idcaja` int NOT NULL,
  `Empleado_idEmpleado` int NOT NULL,
  `dinero_en_caja` float NOT NULL,
  PRIMARY KEY (`idcaja`),
  KEY `fk_caja_Empleado1_idx` (`Empleado_idEmpleado`),
  CONSTRAINT `fk_caja_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `telefono` char(10) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Carlos Martínez','5511223344'),(2,'Lucía Gómez','5599887766'),(3,'Juan Pérez','5533445566'),(4,'Ana Torres','5577993311'),(5,'Miguel Sánchez','5544332211');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente general`
--

DROP TABLE IF EXISTS `cliente general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente general` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente general`
--

LOCK TABLES `cliente general` WRITE;
/*!40000 ALTER TABLE `cliente general` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle proveedor`
--

DROP TABLE IF EXISTS `detalle proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle proveedor` (
  `Proveedor_idProveedor` int NOT NULL,
  `Cantidad` int NOT NULL,
  `costo_compra` float NOT NULL,
  `fecha_compra` date NOT NULL,
  `Articulo_codigo_barras` char(13) NOT NULL,
  PRIMARY KEY (`Proveedor_idProveedor`),
  KEY `fk_Proveedor_has_Producto_Proveedor1_idx` (`Proveedor_idProveedor`),
  KEY `fk_Detalle proveedor_Articulo1_idx` (`Articulo_codigo_barras`),
  CONSTRAINT `fk_Detalle proveedor_Articulo1` FOREIGN KEY (`Articulo_codigo_barras`) REFERENCES `articulo` (`codigo_barras`),
  CONSTRAINT `fk_Proveedor_has_Producto_Proveedor1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle proveedor`
--

LOCK TABLES `detalle proveedor` WRITE;
/*!40000 ALTER TABLE `detalle proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle venta`
--

DROP TABLE IF EXISTS `detalle venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle venta` (
  `Venta_idVenta` int NOT NULL,
  `Articulo_codigo_barras` char(13) NOT NULL,
  PRIMARY KEY (`Venta_idVenta`,`Articulo_codigo_barras`),
  KEY `fk_Venta_has_Articulo_Venta1_idx` (`Venta_idVenta`),
  KEY `fk_Detalle venta_Articulo1_idx` (`Articulo_codigo_barras`),
  CONSTRAINT `fk_Detalle venta_Articulo1` FOREIGN KEY (`Articulo_codigo_barras`) REFERENCES `articulo` (`codigo_barras`),
  CONSTRAINT `fk_Venta_has_Articulo_Venta1` FOREIGN KEY (`Venta_idVenta`) REFERENCES `venta` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle venta`
--

LOCK TABLES `detalle venta` WRITE;
/*!40000 ALTER TABLE `detalle venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_apartado`
--

DROP TABLE IF EXISTS `detalle_apartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_apartado` (
  `Detalle_apartadocol` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `total` float NOT NULL,
  `Articulo_idArticulo` int NOT NULL,
  `Apartado_idApartado` int NOT NULL,
  `Articulo_codigo_barras` char(13) NOT NULL,
  PRIMARY KEY (`Detalle_apartadocol`),
  KEY `fk_Detalle_apartado_Apartado1_idx` (`Apartado_idApartado`),
  KEY `fk_Detalle_apartado_Articulo1_idx` (`Articulo_codigo_barras`),
  CONSTRAINT `fk_Detalle_apartado_Apartado1` FOREIGN KEY (`Apartado_idApartado`) REFERENCES `apartado` (`idApartado`),
  CONSTRAINT `fk_Detalle_apartado_Articulo1` FOREIGN KEY (`Articulo_codigo_barras`) REFERENCES `articulo` (`codigo_barras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_apartado`
--

LOCK TABLES `detalle_apartado` WRITE;
/*!40000 ALTER TABLE `detalle_apartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_apartado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Numero` varchar(45) NOT NULL,
  `Puesto` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Paris','9611991265','Empleado General');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo de pago`
--

DROP TABLE IF EXISTS `metodo de pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo de pago` (
  `idMetodo de pago` int NOT NULL,
  `(efectivo,tarjeta,transferencia)` varchar(45) NOT NULL,
  PRIMARY KEY (`idMetodo de pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo de pago`
--

LOCK TABLES `metodo de pago` WRITE;
/*!40000 ALTER TABLE `metodo de pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodo de pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos apartado`
--

DROP TABLE IF EXISTS `pagos apartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos apartado` (
  `idPagos apartado` int NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `Apartado_idApartado` int NOT NULL,
  PRIMARY KEY (`idPagos apartado`),
  KEY `fk_Pagos apartado_Apartado1_idx` (`Apartado_idApartado`),
  CONSTRAINT `fk_Pagos apartado_Apartado1` FOREIGN KEY (`Apartado_idApartado`) REFERENCES `apartado` (`idApartado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos apartado`
--

LOCK TABLES `pagos apartado` WRITE;
/*!40000 ALTER TABLE `pagos apartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos apartado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idPedidos` int NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  `Fecha_pedido` date NOT NULL,
  `Fecha_llegada` date NOT NULL,
  `Costo` float NOT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `fk_Pedidos_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Pedidos_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_detalles`
--

DROP TABLE IF EXISTS `pedidos_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_detalles` (
  `Pedidos_idPedidos` int NOT NULL,
  `Cantidad_articulo` int NOT NULL,
  `Articulo_codigo_barras` char(13) NOT NULL,
  PRIMARY KEY (`Pedidos_idPedidos`,`Articulo_codigo_barras`),
  KEY `fk_Pedidos_has_Articulo_Pedidos1_idx` (`Pedidos_idPedidos`),
  KEY `fk_Pedidos_Detalles_Articulo1_idx` (`Articulo_codigo_barras`),
  CONSTRAINT `fk_Pedidos_Detalles_Articulo1` FOREIGN KEY (`Articulo_codigo_barras`) REFERENCES `articulo` (`codigo_barras`),
  CONSTRAINT `fk_Pedidos_has_Articulo_Pedidos1` FOREIGN KEY (`Pedidos_idPedidos`) REFERENCES `pedidos` (`idPedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_detalles`
--

LOCK TABLES `pedidos_detalles` WRITE;
/*!40000 ALTER TABLE `pedidos_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Telefono` char(10) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Anime Supplies S.A.','5512345678','Calle Otaku 123'),(2,'Funko Distribuciones','5598765432','Av. Pop Culture 45'),(3,'Posters & Co.','5533221100','Boulevard Manga 78'),(4,'Kawaii Import','5544556677','Calle Cosplay 10'),(5,'Geek Stuff MX','5566778899','Av. Anime Fans 56');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idStock` int NOT NULL AUTO_INCREMENT,
  `cantidad_actual` int NOT NULL,
  `Fecha_act` date NOT NULL,
  `Articulo_codigo_barras` char(13) NOT NULL,
  PRIMARY KEY (`idStock`),
  KEY `fk_Stock_Articulo1_idx` (`Articulo_codigo_barras`),
  CONSTRAINT `fk_Stock_Articulo1` FOREIGN KEY (`Articulo_codigo_barras`) REFERENCES `articulo` (`codigo_barras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `total` float NOT NULL,
  `cliente general_idCliente` int NOT NULL,
  `Metodo de pago_idMetodo de pago` int NOT NULL,
  `caja_idcaja` int NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_Venta_cliente general1_idx` (`cliente general_idCliente`),
  KEY `fk_Venta_Metodo de pago1_idx` (`Metodo de pago_idMetodo de pago`),
  KEY `fk_Venta_caja1_idx` (`caja_idcaja`),
  CONSTRAINT `fk_Venta_caja1` FOREIGN KEY (`caja_idcaja`) REFERENCES `caja` (`idcaja`),
  CONSTRAINT `fk_Venta_cliente general1` FOREIGN KEY (`cliente general_idCliente`) REFERENCES `cliente general` (`idCliente`),
  CONSTRAINT `fk_Venta_Metodo de pago1` FOREIGN KEY (`Metodo de pago_idMetodo de pago`) REFERENCES `metodo de pago` (`idMetodo de pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-16 20:19:50

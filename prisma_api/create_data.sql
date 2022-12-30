DROP TABLE IF EXISTS "user_db"."User";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `password` varchar(100) NOT NULL,
  `roleId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `idLanguage` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `NombreUsuario` (`NombreUsuario`),
  UNIQUE KEY `NombreUsuario_2` (`NombreUsuario`),
  UNIQUE KEY `NombreUsuario_3` (`NombreUsuario`),
  UNIQUE KEY `NombreUsuario_4` (`NombreUsuario`),
  UNIQUE KEY `IDX_50aa9d7c5cee4854d6dd1197c8` (`NombreUsuario`),
  KEY `idRol` (`idRol`),
  KEY `idLenguaje` (`idLenguaje`),
  CONSTRAINT `FK_67ebe767e105c968d0edfe05541` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`),
  CONSTRAINT `FK_76b81064156852aad8a91dc3ef2` FOREIGN KEY (`idLenguaje`) REFERENCES `lenguaje` (`idLenguaje`)
) ENGINE=InnoDB AUTO_INCREMENT=758 DEFAULT CHARSET=latin1;



INSERT INTO "user_db"."Rol" VALUES (1,'Administator'),(2,'Player'),(3,'Teacher');
-- SELECT * FROM "user_db"."Post";
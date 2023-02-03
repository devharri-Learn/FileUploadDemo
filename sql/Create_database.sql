CREATE DATABASE `FileUploadDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCustomer_Insert`(
	Id int,
    FirstName varchar(50),
    LastName varchar(50),
    FileName varchar(500),
    UserName varchar(50)
)
BEGIN
	insert into Customer(FirstName, LastName, FileName, UserName)
    values(FirstName, LastName, FileName, UserName);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCustomer_GetAll`()
BEGIN
	SELECT *
    FROM Customer;
END$$
DELIMITER ;

CREATE TABLE `Customer` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FileName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `UserName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

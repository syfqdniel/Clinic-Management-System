-- Adminer 4.8.1 MySQL 5.5.5-10.6.7-MariaDB-log dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `employee_IC` varchar(12) NOT NULL,
  `employee_Name` varchar(25) NOT NULL,
  `employee_Gender` varchar(9) NOT NULL,
  `employee_PhoneNumber` varchar(10) NOT NULL,
  `employee_DateOfBirth` date NOT NULL,
  `employee_Address` varchar(100) NOT NULL,
  `employee_Position` varchar(1) NOT NULL,
  `employee_loginID` varchar(20) NOT NULL,
  PRIMARY KEY (`employee_IC`),
  KEY `employee_loginID` (`employee_loginID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`employee_loginID`) REFERENCES `Login` (`login_loginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Employee` (`employee_IC`, `employee_Name`, `employee_Gender`, `employee_PhoneNumber`, `employee_DateOfBirth`, `employee_Address`, `employee_Position`, `employee_loginID`) VALUES
('001203075612',	'Yong Chin',	'Female',	'0133920141',	'2000-12-03',	'No.9 Jalan Unggu 2/1 Bandar Putri',	'p',	'Yong'),
('031009100561',	'Sarah Arif',	'Female',	'0116397297',	'2003-10-09',	'No.3 Jalan Kemboja Kampung Renek',	'c',	'Sarah'),
('990203014568',	'Danish Arifin',	'Male',	'0133573437',	'1999-02-03',	'No.15 Jalan Seroja Saujana Utama',	'd',	'Danish');

-- 2024-07-15 14:55:54

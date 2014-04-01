-- phpMyAdmin SQL Dump
-- version 4.1.0-beta1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 19, 2014 at 08:59 AM
-- Server version: 5.5.35-0ubuntu0.12.04.2
-- PHP Version: 5.3.10-1ubuntu3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `Storage`
--
CREATE TABLE IF NOT EXISTS `Storage` (
`Location` varchar(20)
,`Computers` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `centralComputers`
--
CREATE TABLE IF NOT EXISTS `centralComputers` (
`building` varchar(20)
,`common_name` varchar(255)
,`room` varchar(20)
,`assigned_pc` enum('0','1')
,`Serial Number` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `computer`
--

CREATE TABLE IF NOT EXISTS `computer` (
  `computer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `computer_model_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `inventory_id` int(10) unsigned NOT NULL DEFAULT '0',
  `assigned_pc` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`computer_id`),
  KEY `inventory_id` (`inventory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2278 ;

-- --------------------------------------------------------

--
-- Table structure for table `computer_model`
--

CREATE TABLE IF NOT EXISTS `computer_model` (
  `computer_model_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manuf` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '',
  `processor` varchar(50) DEFAULT NULL,
  `processor_speed` varchar(50) DEFAULT NULL,
  `memory` varchar(50) DEFAULT NULL,
  `HD_size` varchar(50) DEFAULT NULL,
  `original_OS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`computer_model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=122 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `highSchoolComputers`
--
CREATE TABLE IF NOT EXISTS `highSchoolComputers` (
`building` varchar(20)
,`common_name` varchar(255)
,`room` varchar(20)
,`assigned_pc` enum('0','1')
,`Serial Number` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hw_type` varchar(20) NOT NULL DEFAULT '',
  `common_name` varchar(255) NOT NULL DEFAULT '',
  `SN` varchar(255) NOT NULL DEFAULT '',
  `building` varchar(20) NOT NULL DEFAULT '',
  `room` varchar(20) NOT NULL DEFAULT '',
  `purchase_date` date DEFAULT NULL,
  `warranty_expire` date DEFAULT NULL,
  `mac_address` varchar(255) NOT NULL,
  PRIMARY KEY (`inventory_id`) USING BTREE,
  KEY `idx_id` (`inventory_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3874 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `middleSchoolComputers`
--
CREATE TABLE IF NOT EXISTS `middleSchoolComputers` (
`building` varchar(20)
,`common_name` varchar(255)
,`room` varchar(20)
,`assigned_pc` enum('0','1')
,`Serial Number` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `monitor`
--

CREATE TABLE IF NOT EXISTS `monitor` (
  `monitor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_model_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `inventory_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`monitor_id`),
  KEY `inventory_id` (`inventory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1267 ;

-- --------------------------------------------------------

--
-- Table structure for table `monitor_model`
--

CREATE TABLE IF NOT EXISTS `monitor_model` (
  `monitor_model_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manuf` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`monitor_model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE IF NOT EXISTS `phone` (
  `phone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_model_id` int(10) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(20) DEFAULT NULL,
  `notes` text,
  `inventory_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`phone_id`),
  KEY `inventory_id` (`inventory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `phone_model`
--

CREATE TABLE IF NOT EXISTS `phone_model` (
  `phone_model_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manuf` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`phone_model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `primaryComputers`
--
CREATE TABLE IF NOT EXISTS `primaryComputers` (
`building` varchar(20)
,`common_name` varchar(255)
,`room` varchar(20)
,`assigned_pc` enum('0','1')
,`Serial Number` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE IF NOT EXISTS `printer` (
  `printer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `printer_model_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `inventory_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`printer_id`),
  KEY `inventory_id` (`inventory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

-- --------------------------------------------------------

--
-- Table structure for table `printer_model`
--

CREATE TABLE IF NOT EXISTS `printer_model` (
  `printer_model_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manuf` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '',
  `toner_cartridge_number` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`printer_model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `projector`
--

CREATE TABLE IF NOT EXISTS `projector` (
  `projector_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projector_model_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `inventory_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`projector_id`),
  KEY `inventory_id` (`inventory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=220 ;

-- --------------------------------------------------------

--
-- Table structure for table `projector_model`
--

CREATE TABLE IF NOT EXISTS `projector_model` (
  `projector_model_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manuf` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`projector_model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `scanner`
--

CREATE TABLE IF NOT EXISTS `scanner` (
  `scanner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scanner_model_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `inventory_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`scanner_id`),
  KEY `inventory_id` (`inventory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Table structure for table `scanner_model`
--

CREATE TABLE IF NOT EXISTS `scanner_model` (
  `scanner_model_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manuf` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`scanner_model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `selectComputerModel`
--
CREATE TABLE IF NOT EXISTS `selectComputerModel` (
`common_name` varchar(255)
,`building` varchar(20)
,`room` varchar(20)
,`assigned_pc` enum('0','1')
,`purchase_date` date
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `selectMonitorModel`
--
CREATE TABLE IF NOT EXISTS `selectMonitorModel` (
`Serial Number` varchar(255)
,`building` varchar(20)
,`room` varchar(20)
,`purchase_date` date
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `upperComputers`
--
CREATE TABLE IF NOT EXISTS `upperComputers` (
`building` varchar(20)
,`common_name` varchar(255)
,`room` varchar(20)
,`assigned_pc` enum('0','1')
,`Serial Number` varchar(255)
);
-- --------------------------------------------------------

--
-- Structure for view `Storage`
--
DROP TABLE IF EXISTS `Storage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `Storage` AS select `building` AS `Location`,count(`building`) AS `Computers` from `inventory` where (`room` like 'storage') group by `building`;

-- --------------------------------------------------------

--
-- Structure for view `centralComputers`
--
DROP TABLE IF EXISTS `centralComputers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `centralComputers` AS select `building` AS `building`,`common_name` AS `common_name`,`room` AS `room`,`computer`.`assigned_pc` AS `assigned_pc`,`SN` AS `Serial Number` from (`inventory` join `computer`) where ((`inventory_id` = `computer`.`inventory_id`) and (`building` like 'central')) order by `room`,`common_name`;

-- --------------------------------------------------------

--
-- Structure for view `highSchoolComputers`
--
DROP TABLE IF EXISTS `highSchoolComputers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `highSchoolComputers` AS select `building` AS `building`,`common_name` AS `common_name`,`room` AS `room`,`computer`.`assigned_pc` AS `assigned_pc`,`SN` AS `Serial Number` from (`inventory` join `computer`) where ((`inventory_id` = `computer`.`inventory_id`) and (`building` like 'high')) order by `room`,`common_name`;

-- --------------------------------------------------------

--
-- Structure for view `middleSchoolComputers`
--
DROP TABLE IF EXISTS `middleSchoolComputers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `middleSchoolComputers` AS select `building` AS `building`,`common_name` AS `common_name`,`room` AS `room`,`computer`.`assigned_pc` AS `assigned_pc`,`SN` AS `Serial Number` from (`inventory` join `computer`) where ((`inventory_id` = `computer`.`inventory_id`) and (`building` like 'middle')) order by `room`,`common_name`;

-- --------------------------------------------------------

--
-- Structure for view `primaryComputers`
--
DROP TABLE IF EXISTS `primaryComputers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `primaryComputers` AS select `building` AS `building`,`common_name` AS `common_name`,`room` AS `room`,`computer`.`assigned_pc` AS `assigned_pc`,`SN` AS `Serial Number` from (`inventory` join `computer`) where ((`inventory_id` = `computer`.`inventory_id`) and (`building` like 'primary')) order by `room`,`common_name`;

-- --------------------------------------------------------

--
-- Structure for view `selectComputerModel`
--
DROP TABLE IF EXISTS `selectComputerModel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `selectComputerModel` AS select `common_name` AS `common_name`,`building` AS `building`,`room` AS `room`,`computer`.`assigned_pc` AS `assigned_pc`,`purchase_date` AS `purchase_date` from (`inventory` join `computer`) where ((`inventory_id` = `computer`.`inventory_id`) and (`computer`.`computer_model_id` = 34)) order by `building`,`common_name`;

-- --------------------------------------------------------

--
-- Structure for view `selectMonitorModel`
--
DROP TABLE IF EXISTS `selectMonitorModel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `selectMonitorModel` AS select `SN` AS `Serial Number`,`building` AS `building`,`room` AS `room`,`purchase_date` AS `purchase_date` from (`inventory` join `monitor`) where ((`inventory_id` = `monitor`.`inventory_id`) and (`monitor`.`monitor_model_id` = 9)) order by `building`,`common_name`;

-- --------------------------------------------------------

--
-- Structure for view `upperComputers`
--
DROP TABLE IF EXISTS `upperComputers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `upperComputers` AS select `building` AS `building`,`common_name` AS `common_name`,`room` AS `room`,`computer`.`assigned_pc` AS `assigned_pc`,`SN` AS `Serial Number` from (`inventory` join `computer`) where ((`inventory_id` = `computer`.`inventory_id`) and (`building` like 'upper')) order by `room`,`common_name`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

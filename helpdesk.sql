-- phpMyAdmin SQL Dump
-- version 4.1.0-beta1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 19, 2014 at 09:00 AM
-- Server version: 5.5.35-0ubuntu0.12.04.2
-- PHP Version: 5.3.10-1ubuntu3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE IF NOT EXISTS `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` date NOT NULL,
  `requestedby` varchar(255) NOT NULL,
  `building` varchar(50) NOT NULL,
  `room` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ccemail` varchar(100) NOT NULL,
  `item` varchar(50) NOT NULL,
  `item2` varchar(100) NOT NULL,
  `item3` varchar(100) NOT NULL,
  `item4` varchar(100) NOT NULL,
  `item5` varchar(100) NOT NULL,
  `device_type` varchar(100) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_developer` varchar(255) NOT NULL,
  `app_cost` double NOT NULL,
  `approved_by` varchar(255) NOT NULL,
  `status` varchar(25) NOT NULL,
  `assignedto` varchar(100) NOT NULL,
  `budget_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `highWorkOrders`
--
CREATE TABLE IF NOT EXISTS `highWorkOrders` (
`room` varchar(255)
,`problem` text
,`assignedto` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `it_data`
--

CREATE TABLE IF NOT EXISTS `it_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` date NOT NULL,
  `requestedby` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `building` varchar(255) NOT NULL DEFAULT '',
  `room` varchar(255) NOT NULL DEFAULT '',
  `item` varchar(255) DEFAULT NULL,
  `stamp` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'New',
  `problem` text NOT NULL,
  `assignedto` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '3',
  `solution` text,
  `timeworked` int(11) DEFAULT '0',
  `completed` date DEFAULT NULL,
  `completedStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inventory_id` int(11) DEFAULT NULL,
  `neededBy` date NOT NULL,
  `ccemail` varchar(255) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  `item2` varchar(100) NOT NULL,
  `item3` varchar(100) NOT NULL,
  `item4` varchar(100) NOT NULL,
  `item5` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `Foreign Key` (`inventory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12891 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `jayWorkOrders`
--
CREATE TABLE IF NOT EXISTS `jayWorkOrders` (
`requestedby` varchar(255)
,`building` varchar(255)
,`item` varchar(255)
,`room` varchar(255)
,`problem` text
,`assignedto` varchar(255)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `middleWorkOrders`
--
CREATE TABLE IF NOT EXISTS `middleWorkOrders` (
`room` varchar(255)
,`problem` text
,`assignedto` varchar(255)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `primaryWorkOrders`
--
CREATE TABLE IF NOT EXISTS `primaryWorkOrders` (
`room` varchar(255)
,`problem` text
,`assignedto` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL,
  `size` int(11) NOT NULL,
  `content` mediumblob NOT NULL,
  `workorder_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `upperWorkOrders`
--
CREATE TABLE IF NOT EXISTS `upperWorkOrders` (
`room` varchar(255)
,`problem` text
,`assignedto` varchar(255)
);
-- --------------------------------------------------------

--
-- Structure for view `highWorkOrders`
--
DROP TABLE IF EXISTS `highWorkOrders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `highWorkOrders` AS select `it_data`.`room` AS `room`,`it_data`.`problem` AS `problem`,`it_data`.`assignedto` AS `assignedto` from `it_data` where ((`it_data`.`building` like 'high') and (not((`it_data`.`status` like 'completed'))));

-- --------------------------------------------------------

--
-- Structure for view `jayWorkOrders`
--
DROP TABLE IF EXISTS `jayWorkOrders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `jayWorkOrders` AS select `it_data`.`requestedby` AS `requestedby`,`it_data`.`building` AS `building`,`it_data`.`item` AS `item`,`it_data`.`room` AS `room`,`it_data`.`problem` AS `problem`,`it_data`.`assignedto` AS `assignedto` from `it_data` where ((`it_data`.`assignedto` like 'jay fude') and (not((`it_data`.`status` like 'completed')))) order by `it_data`.`building`;

-- --------------------------------------------------------

--
-- Structure for view `middleWorkOrders`
--
DROP TABLE IF EXISTS `middleWorkOrders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `middleWorkOrders` AS select `it_data`.`room` AS `room`,`it_data`.`problem` AS `problem`,`it_data`.`assignedto` AS `assignedto` from `it_data` where ((`it_data`.`building` like 'middle') and (not((`it_data`.`status` like 'completed'))));

-- --------------------------------------------------------

--
-- Structure for view `primaryWorkOrders`
--
DROP TABLE IF EXISTS `primaryWorkOrders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `primaryWorkOrders` AS select `it_data`.`room` AS `room`,`it_data`.`problem` AS `problem`,`it_data`.`assignedto` AS `assignedto` from `it_data` where ((`it_data`.`building` like 'primary') and (not((`it_data`.`status` like 'completed'))));

-- --------------------------------------------------------

--
-- Structure for view `upperWorkOrders`
--
DROP TABLE IF EXISTS `upperWorkOrders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jay`@`localhost` SQL SECURITY DEFINER VIEW `upperWorkOrders` AS select `it_data`.`room` AS `room`,`it_data`.`problem` AS `problem`,`it_data`.`assignedto` AS `assignedto` from `it_data` where ((`it_data`.`building` like 'upper') and (not((`it_data`.`status` like 'completed'))));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

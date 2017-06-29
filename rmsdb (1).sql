-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2017 at 03:46 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `available`
--

CREATE TABLE `available` (
  `fID` int(11) NOT NULL,
  `rID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `available`
--

INSERT INTO `available` (`fID`, `rID`) VALUES
(101, 1),
(102, 1),
(101, 1),
(102, 1),
(103, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `cID` int(11) NOT NULL,
  `fID` int(11) NOT NULL,
  `oQuantaty` int(11) NOT NULL,
  `subTotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cID` int(11) NOT NULL,
  `cName` varchar(50) NOT NULL,
  `cPhone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fooditem`
--

CREATE TABLE `fooditem` (
  `fID` int(11) NOT NULL,
  `rID` int(11) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `fQuantaty` int(11) NOT NULL,
  `fCost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooditem`
--

INSERT INTO `fooditem` (`fID`, `rID`, `fName`, `fQuantaty`, `fCost`) VALUES
(101, 1, 'Burger', 100, 80),
(102, 1, 'Pizza', 100, 120),
(103, 1, 'Fried Rice', 90, 70);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paidAmount` float NOT NULL,
  `tax` float NOT NULL,
  `discount` float NOT NULL,
  `cID` int(11) NOT NULL,
  `fID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `providefood`
--

CREATE TABLE `providefood` (
  `cID` int(11) NOT NULL,
  `rID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restuarant`
--

CREATE TABLE `restuarant` (
  `rID` int(11) NOT NULL,
  `rName` varchar(150) NOT NULL,
  `rAddress` text NOT NULL,
  `rPhone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restuarant`
--

INSERT INTO `restuarant` (`rID`, `rName`, `rAddress`, `rPhone`) VALUES
(1, 'Well Food', '10/A,GEC,Chittagong,Bangladesh', '+990123456');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sname` varchar(20) DEFAULT NULL,
  `sid` int(8) NOT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `session` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sname`, `sid`, `dept`, `session`) VALUES
('abc', 10, 'cde', 'efg'),
('Joy Roy', 14701012, 'CSE', '2013-2014'),
('Nurul Huda', 14701017, 'CSE', '2013-2014'),
('Shahjahan Ali', 14701033, 'CSE', '2013-2014'),
('Morshed Rana', 14701050, 'CSE', '2013-2014'),
('Maksuder Rahman', 14701060, 'CSE', '2013-2014');

-- --------------------------------------------------------

--
-- Table structure for table `stuff`
--

CREATE TABLE `stuff` (
  `sID` int(11) NOT NULL,
  `sName` varchar(150) NOT NULL,
  `sPhone` varchar(14) NOT NULL,
  `sPost` varchar(100) NOT NULL,
  `sSalary` varchar(100) NOT NULL,
  `rID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `rID` int(11) NOT NULL,
  `sId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `available`
--
ALTER TABLE `available`
  ADD KEY `fID` (`fID`),
  ADD KEY `rID` (`rID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD KEY `cID` (`cID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD PRIMARY KEY (`fID`),
  ADD KEY `rID` (`rID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `cID` (`cID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `providefood`
--
ALTER TABLE `providefood`
  ADD KEY `cID` (`cID`),
  ADD KEY `rID` (`rID`);

--
-- Indexes for table `restuarant`
--
ALTER TABLE `restuarant`
  ADD PRIMARY KEY (`rID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `stuff`
--
ALTER TABLE `stuff`
  ADD PRIMARY KEY (`sID`),
  ADD KEY `rID` (`rID`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD KEY `rID` (`rID`),
  ADD KEY `sId` (`sId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `available`
--
ALTER TABLE `available`
  ADD CONSTRAINT `available_ibfk_1` FOREIGN KEY (`fID`) REFERENCES `fooditem` (`fID`),
  ADD CONSTRAINT `available_ibfk_2` FOREIGN KEY (`rID`) REFERENCES `restuarant` (`rID`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`fID`) REFERENCES `fooditem` (`fID`);

--
-- Constraints for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD CONSTRAINT `fooditem_ibfk_1` FOREIGN KEY (`rID`) REFERENCES `restuarant` (`rID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fID`) REFERENCES `fooditem` (`fID`);

--
-- Constraints for table `providefood`
--
ALTER TABLE `providefood`
  ADD CONSTRAINT `providefood_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`),
  ADD CONSTRAINT `providefood_ibfk_2` FOREIGN KEY (`rID`) REFERENCES `restuarant` (`rID`);

--
-- Constraints for table `stuff`
--
ALTER TABLE `stuff`
  ADD CONSTRAINT `stuff_ibfk_1` FOREIGN KEY (`rID`) REFERENCES `restuarant` (`rID`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`rID`) REFERENCES `restuarant` (`rID`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`sId`) REFERENCES `stuff` (`sID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

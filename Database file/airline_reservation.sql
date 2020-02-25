-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2019 at 06:56 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline_reservation`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`Harry`@`localhost` PROCEDURE `GetFlightStatistics` (IN `j_date` DATE)  BEGIN
 select flight_no,departure_date,IFNULL(no_of_passengers, 0) as no_of_passengers,total_capacity from (
select f.flight_no,f.departure_date,sum(t.no_of_passengers) as no_of_passengers,j.total_capacity 
from flight_details f left join ticket_details t 
on t.booking_status='CONFIRMED' 
and t.flight_no=f.flight_no 
and f.departure_date=t.journey_date 
inner join jet_details j on j.jet_id=f.jet_id
group by flight_no,journey_date) k where departure_date=j_date;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `gettick` (IN `pn` INT)  SELECT * FROM passengers where pnr = pn$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `pwd`, `staff_id`, `name`, `email`) VALUES
('falcon', 'falcon', '101', 'falcon', 'falcon46@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `pwd`, `name`, `email`, `phone_no`, `address`) VALUES
('abi', 'abi123', 'Abilesh', '123@gmail.com', '9123456789', 'Bangalore'),
('blah', 'blah blah', 'blah', 'blah@gmail.com', '993498570', 'blah'),
('charles', 'charles_pass', 'Charles', 'charles@gmail.com', '9090909090', 'Bangalore'),
('harryroshan', 'passpasshello', 'Harry Roshan', 'harryroshan1997@gmai', '9845713736', '#381, 1st E Main,'),
('nbm', 'nbm', 'bnm', 'bnm@gmail.com', '4521378', 'bnm'),
('sk46', 'sk46', 'sk46', 'sk46@gmail.com', '9876542211', 'sk_address'),
('Tarun', 'Tarun12345', 'Gunda', 'Tarun@gmail.com', '7894561320', 'Uppinkayi');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `inslog` AFTER INSERT ON `customer` FOR EACH ROW INSERT into logs values(null,new.customer_id,now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updat` AFTER INSERT ON `customer` FOR EACH ROW INSERT into frequent_flier_details VALUES (FLOOR(rand()*(10000-1000+1))+1000,new.customer_id,FLOOR(rand()*(999-10+1))+10)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flight_details`
--

CREATE TABLE `flight_details` (
  `flight_no` varchar(10) NOT NULL,
  `from_city` varchar(20) DEFAULT NULL,
  `to_city` varchar(20) DEFAULT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `seats_economy` int(5) DEFAULT NULL,
  `seats_business` int(5) DEFAULT NULL,
  `price_economy` int(10) DEFAULT NULL,
  `price_business` int(10) DEFAULT NULL,
  `jet_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_details`
--

INSERT INTO `flight_details` (`flight_no`, `from_city`, `to_city`, `departure_date`, `arrival_date`, `departure_time`, `arrival_time`, `seats_economy`, `seats_business`, `price_economy`, `price_business`, `jet_id`) VALUES
('AA101', 'Bangalore', 'Mumbai', '2019-12-06', '2019-12-07', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('AA102', 'Bangalore', 'Mumbai', '2019-12-07', '2019-12-08', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('AA103', 'Bangalore', 'Chennai', '2019-12-08', '2019-12-09', '17:00:00', '17:45:00', 150, 75, 1200, 1500, '10004'),
('AA104', 'Bangalore', 'Mysore', '2019-12-08', '2019-12-09', '09:00:00', '09:17:00', 37, 4, 500, 750, '10003'),
('AA106', 'Bangalore', 'Hyderabad', '2019-12-07', '2019-12-08', '13:00:00', '14:00:00', 150, 75, 3000, 3750, '10004'),
('AA107', 'Bangalore', 'Mysore', '2019-12-08', '2019-12-09', '06:00:00', '09:00:00', 100, 50, 500, 1000, '10003'),
('AA108', 'Bangalore', 'Chennai', '2019-12-10', '2019-12-11', '13:00:00', '15:00:00', 200, 190, 3000, 5410, '10002'),
('AA109', 'Bangalore', 'Mumbai', '2019-12-11', '2019-12-12', '06:40:00', '11:00:00', 150, 20, 1500, 3000, '10002'),
('AA110', 'Bangalore', 'Hyderabad', '2019-12-07', '2019-12-08', '20:00:00', '03:00:00', 110, 88, 4890, 7500, '10001'),
('AA111', 'Bangalore', 'Mumbai', '2019-12-06', '2019-12-06', '10:00:00', '13:00:00', 110, 88, 5890, 7500, '10002'),
('AA112', 'Bangalore', 'Hyderabad', '2019-12-07', '2019-12-08', '19:14:10', '22:00:00', 150, 108, 1590, 2700, '10003'),
('AA113', 'Bangalore', 'Chennai', '2019-12-06', '2019-12-07', '23:45:00', '01:00:00', 100, 58, 890, 1500, '10001'),
('AA114', 'Bangalore', 'Hyderabad', '2019-12-06', '2019-12-06', '10:00:00', '12:00:00', 160, 98, 1490, 2500, '10003'),
('AA115', 'Bangalore', 'Hyderabad', '2019-12-07', '2019-12-07', '18:00:00', '22:30:00', 90, 78, 1890, 3500, '10001'),
('AA116', 'Bangalore', 'Chennai', '2019-12-09', '2019-12-09', '10:00:00', '12:00:00', 160, 98, 1490, 2500, '10003'),
('AA117', 'Bangalore', 'Chennai', '2019-12-06', '2019-12-07', '18:00:00', '22:30:00', 150, 108, 1590, 2700, '10001'),
('AA118', 'Bangalore', 'Chennai', '2019-12-06', '2019-12-06', '06:00:00', '08:00:00', 160, 98, 1490, 2500, '10003'),
('AA119', 'Bangalore', 'Chennai', '2019-12-07', '2019-12-07', '05:00:00', '07:30:15', 90, 78, 1890, 3500, '10001'),
('AA120', 'Bangalore', 'Mumbai', '2019-12-09', '2019-12-10', '22:45:00', '01:45:00', 160, 98, 1490, 2500, '10003'),
('AA121', 'Bangalore', 'Mumbai', '2019-12-09', '2019-12-09', '17:30:00', '22:30:00', 150, 108, 1590, 2700, '10001'),
('AA122', 'Bangalore', 'Mumbai', '2019-12-08', '2019-12-08', '05:15:00', '08:00:00', 159, 98, 1490, 2500, '10003'),
('AA123', 'Bangalore', 'Mumbai', '2019-12-08', '2019-12-08', '20:15:00', '24:30:15', 89, 78, 1890, 3500, '10001'),
('AA124', 'Bangalore', 'Mumbai', '2019-12-07', '2019-12-07', '11:25:00', '13:00:00', 160, 98, 1490, 2500, '10003'),
('AA125', 'Bangalore', 'Mumbai', '2019-12-06', '2019-12-07', '09:00:00', '00:30:15', 90, 78, 1890, 3500, '10001'),
('AA126', 'Bangalore', 'Mysore', '2019-12-09', '2019-12-10', '22:45:00', '01:45:00', 160, 98, 500, 700, '10004'),
('AA127', 'Bangalore', 'Mysore', '2019-12-09', '2019-12-09', '17:30:00', '22:30:00', 150, 108, 800, 1100, '10002'),
('AA128', 'Bangalore', 'Mysore', '2019-12-07', '2019-12-07', '05:15:00', '08:00:00', 160, 98, 590, 720, '10003'),
('AA129', 'Bangalore', 'Mysore', '2019-12-06', '2019-12-06', '20:15:00', '24:30:15', 90, 78, 650, 899, '10003'),
('AA130', 'Bangalore', 'Mysore', '2019-12-07', '2019-12-07', '11:25:00', '13:00:00', 160, 98, 545, 1000, '10004'),
('AA131', 'Bangalore', 'Mysore', '2019-12-06', '2019-12-07', '09:00:00', '00:30:15', 90, 78, 500, 900, '10002'),
('AA132', 'Bangalore', 'Mysore', '2019-12-07', '2019-12-08', '22:45:00', '01:45:00', 200, 100, 550, 750, '10004'),
('AA133', 'Bangalore', 'Hyderabad', '2019-12-09', '2019-12-09', '06:45:00', '08:45:00', 160, 98, 500, 700, '10004'),
('AA134', 'Bangalore', 'Hyderabad', '2019-12-09', '2019-12-09', '19:30:00', '21:30:00', 150, 108, 800, 1100, '10002'),
('AA135', 'Bangalore', 'Hyderabad', '2019-12-08', '2019-12-08', '04:15:00', '06:00:00', 160, 98, 590, 720, '10003'),
('AA136', 'Bangalore', 'Hyderabad', '2019-12-08', '2019-12-09', '23:15:00', '01:30:15', 90, 78, 650, 899, '10003'),
('AA137', 'Bangalore', 'Hyderabad', '2019-12-06', '2019-12-07', '22:25:00', '00:30:00', 160, 98, 545, 1000, '10004'),
('AA138', 'Bangalore', 'Hyderabad', '2019-12-06', '2019-12-06', '10:30:00', '13:40:15', 90, 78, 500, 900, '10002'),
('AA139', 'Bangalore', 'hyderabad', '2019-12-08', '2019-12-09', '23:45:00', '01:00:00', 100, 58, 890, 1500, '10001'),
('AA140', 'Bangalore', 'Chennai', '2019-12-08', '2019-12-08', '10:00:00', '12:00:00', 160, 98, 1490, 2500, '10003'),
('AA141', 'Bangalore', 'Chennai', '2019-12-08', '2019-12-08', '18:00:00', '22:30:00', 150, 108, 1590, 2700, '10001'),
('AA142', 'Bangalore', 'Chennai', '2019-12-06', '2019-12-06', '06:00:00', '08:00:00', 160, 98, 1390, 1900, '10002'),
('AA143', 'Bangalore', 'Chennai', '2019-12-07', '2019-12-07', '05:00:00', '07:30:15', 90, 78, 1590, 2500, '10004');

-- --------------------------------------------------------

--
-- Table structure for table `frequent_flier_details`
--

CREATE TABLE `frequent_flier_details` (
  `frequent_flier_no` varchar(20) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `mileage` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `frequent_flier_details`
--

INSERT INTO `frequent_flier_details` (`frequent_flier_no`, `customer_id`, `mileage`) VALUES
('456', 'harryroshan', 150),
('7799', 'nbm', 860),
('789', 'sk46', 375);

-- --------------------------------------------------------

--
-- Table structure for table `jet_details`
--

CREATE TABLE `jet_details` (
  `jet_id` varchar(10) NOT NULL,
  `jet_type` varchar(20) DEFAULT NULL,
  `total_capacity` int(5) DEFAULT NULL,
  `active` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jet_details`
--

INSERT INTO `jet_details` (`jet_id`, `jet_type`, `total_capacity`, `active`) VALUES
('10001', 'Dreamliner', 300, 'Yes'),
('10002', 'Airbus A380', 275, 'Yes'),
('10003', 'ATR', 50, 'Yes'),
('10004', 'Boeing 737', 225, 'Yes'),
('10007', 'Test_Model', 250, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `Id` int(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`Id`, `Username`, `time`) VALUES
(1, 'qwe', '2019-12-05 22:01:09'),
(2, 'Tarun', '2019-12-05 22:28:15'),
(3, 'Venk', '2019-12-05 22:54:30'),
(4, 'bnm', '2019-12-05 22:58:19'),
(6, 'la', '2019-12-05 23:08:01'),
(7, 'nbm', '2019-12-05 23:13:23'),
(11, 'nbm', '2019-12-05 23:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(10) NOT NULL,
  `pnr` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `meal_choice` varchar(5) DEFAULT NULL,
  `frequent_flier_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `pnr`, `name`, `age`, `gender`, `meal_choice`, `frequent_flier_no`) VALUES
(1, '1669050', 'Harry Roshan', 20, 'male', 'yes', '456'),
(1, '2369143', 'blah', 20, 'male', 'yes', NULL),
(1, '3773951', 'harry', 51, 'male', 'yes', NULL),
(1, '4797983', 'pass1', 34, 'male', 'yes', NULL),
(1, '5421865', 'pass1', 10, 'male', 'yes', NULL),
(1, '6210568', 'Srikrishna', 21, 'male', 'yes', NULL),
(1, '6980157', 'roshan', 20, 'male', 'yes', NULL),
(1, '8503285', 'aadith_name', 10, 'male', 'yes', '789'),
(1, '9025935', 'Geetha', 50, 'male', 'yes', NULL),
(1, '9831998', 'akiii', 20, 'male', 'yes', NULL),
(2, '1669050', 'berti harry', 45, 'female', 'yes', NULL),
(2, '2369143', 'blah', 51, 'male', 'yes', NULL),
(2, '3027167', 'roshan', 20, 'male', 'yes', NULL),
(2, '3773951', 'berti', 42, 'female', 'yes', NULL),
(2, '4797983', 'Harry Roshan', 20, 'male', 'yes', '456'),
(2, '5421865', 'pass2', 20, 'female', 'yes', NULL),
(2, '6980157', 'aadith', 9, 'male', 'yes', NULL),
(2, '8503285', 'roshan_name', 20, 'male', 'yes', NULL),
(3, '1669050', 'aadith_name', 10, 'male', 'yes', NULL),
(3, '2369143', 'blah', 10, 'male', 'yes', NULL),
(3, '3773951', 'aadith', 11, 'male', 'yes', '789'),
(3, '4797983', 'aadith_name', 10, 'male', 'yes', '789'),
(3, '5421865', 'pass3', 30, 'male', 'yes', NULL),
(4, '2369143', 'blah', 42, 'female', 'yes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_id` varchar(20) NOT NULL,
  `pnr` varchar(15) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` int(6) DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_id`, `pnr`, `payment_date`, `payment_amount`, `payment_mode`) VALUES
('258057622', '6210568', '2019-12-05', 2640, NULL),
('738240888', '9831998', '2019-12-03', 5850, NULL),
('972299894', '9025935', '2019-12-05', 2240, NULL);

--
-- Triggers `payment_details`
--
DELIMITER $$
CREATE TRIGGER `update_ticket_after_payment` AFTER INSERT ON `payment_details` FOR EACH ROW UPDATE ticket_details
     SET booking_status='CONFIRMED', payment_id= NEW.payment_id
   WHERE pnr = NEW.pnr
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `pnr` varchar(15) NOT NULL,
  `date_of_reservation` date DEFAULT NULL,
  `flight_no` varchar(10) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `booking_status` varchar(20) DEFAULT NULL,
  `no_of_passengers` int(5) DEFAULT NULL,
  `lounge_access` varchar(5) DEFAULT NULL,
  `priority_checkin` varchar(5) DEFAULT NULL,
  `insurance` varchar(5) DEFAULT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`pnr`, `date_of_reservation`, `flight_no`, `journey_date`, `class`, `booking_status`, `no_of_passengers`, `lounge_access`, `priority_checkin`, `insurance`, `payment_id`, `customer_id`) VALUES
('1669050', '2017-11-25', 'AA104', '2019-12-08', 'business', 'CONFIRMED', 3, 'yes', 'yes', 'yes', '620041544', 'harryroshan'),
('2369143', '2017-11-26', 'AA101', '2019-12-06', 'business', 'CONFIRMED', 4, 'yes', 'yes', 'yes', '467972527', 'blah'),
('3027167', '2017-11-25', 'AA101', '2019-12-06', 'economy', 'CONFIRMED', 2, 'no', 'no', 'yes', '862686553', 'sk46'),
('3773951', '2017-11-25', 'AA104', '2019-12-08', 'economy', 'CONFIRMED', 3, 'yes', 'yes', 'yes', '142539461', 'sk46'),
('4797983', '2017-11-25', 'AA104', '2019-12-08', 'business', 'CONFIRMED', 3, 'yes', 'no', 'yes', '120000248', 'harryroshan'),
('5421865', '2017-11-28', 'AA101', '2019-12-06', 'economy', 'CONFIRMED', 3, 'no', 'no', 'no', '665360715', 'harryroshan'),
('6210568', '2019-12-05', 'AA123', '2019-12-08', 'economy', 'CONFIRMED', 1, 'yes', 'yes', 'yes', '258057622', 'sk46'),
('6980157', '2017-11-26', 'AA101', '2019-12-06', 'economy', 'CANCELED', 2, 'yes', 'yes', 'yes', '557778944', 'sk46'),
('8503285', '2017-11-25', 'AA102', '2019-12-07', 'business', 'CONFIRMED', 2, 'yes', 'yes', 'no', '165125569', 'sk46'),
('9025935', '2019-12-05', 'AA122', '2019-12-08', 'economy', 'CONFIRMED', 1, 'yes', 'yes', 'yes', '972299894', 'sk46'),
('9831998', '2019-12-03', 'AA101', '2019-12-06', 'economy', 'CANCELED', 1, 'yes', 'yes', 'yes', '738240888', 'blah');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD PRIMARY KEY (`flight_no`,`departure_date`),
  ADD KEY `jet_id` (`jet_id`);

--
-- Indexes for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD PRIMARY KEY (`frequent_flier_no`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `jet_details`
--
ALTER TABLE `jet_details`
  ADD PRIMARY KEY (`jet_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`,`pnr`),
  ADD KEY `pnr` (`pnr`),
  ADD KEY `frequent_flier_no` (`frequent_flier_no`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `pnr` (`pnr`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`pnr`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `journey_date` (`journey_date`),
  ADD KEY `flight_no` (`flight_no`),
  ADD KEY `flight_no_2` (`flight_no`,`journey_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD CONSTRAINT `flight_details_ibfk_1` FOREIGN KEY (`jet_id`) REFERENCES `jet_details` (`jet_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD CONSTRAINT `frequent_flier_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`frequent_flier_no`) REFERENCES `frequent_flier_details` (`frequent_flier_no`) ON UPDATE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON UPDATE CASCADE;

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_details_ibfk_3` FOREIGN KEY (`flight_no`,`journey_date`) REFERENCES `flight_details` (`flight_no`, `departure_date`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

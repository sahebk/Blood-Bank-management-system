-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2024 at 03:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blooddonation1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodbag`
--

CREATE TABLE `bloodbag` (
  `Bag_id` int(11) NOT NULL,
  `Donor_id` int(11) NOT NULL,
  `Donor_Blood_type` varchar(10) NOT NULL,
  `Donation_date` date NOT NULL,
  `Expiray_Date` date NOT NULL,
  `Location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bloodbag`
--

INSERT INTO `bloodbag` (`Bag_id`, `Donor_id`, `Donor_Blood_type`, `Donation_date`, `Expiray_Date`, `Location`) VALUES
(100, 1, 'A+', '2024-01-14', '2024-04-14', 'Mysuru'),
(101, 2, 'B+', '2023-12-05', '2024-03-05', 'Bengaluru'),
(102, 3, 'AB+', '2024-02-20', '2024-05-20', 'Tumkuru'),
(103, 8, 'AB-', '2023-11-04', '2024-02-04', 'Hyderabad'),
(104, 10, 'O+', '2024-01-22', '2024-04-22', 'Bengaluru'),
(105, 7, 'O-', '2024-01-14', '2024-04-14', 'Bengaluru');

-- --------------------------------------------------------

--
-- Table structure for table `blood_availability`
--

CREATE TABLE `blood_availability` (
  `Center_name` varchar(255) NOT NULL,
  `Center_location` varchar(255) NOT NULL,
  `Donor_Blood_type` varchar(25) NOT NULL,
  `Blood_Bag_Count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_availability`
--

INSERT INTO `blood_availability` (`Center_name`, `Center_location`, `Donor_Blood_type`, `Blood_Bag_Count`) VALUES
('City Blood Bank', 'Jaynagar', 'A+', 18),
('City Blood Bank', 'Jaynagar', 'AB+', 25),
('City Blood Bank', 'Jaynagar', 'A-', 28),
('City Blood Bank', 'Jaynagar', 'O+', 33),
('Town Blood Center', 'K R Puram', 'AB-', 31),
('Town Blood Center', 'K R puram', 'O-', 15),
('Village Blood Drive', 'Banashankari', 'A+', 22),
('Village Blood Drive', 'Banashankari', 'O+', 12);

-- --------------------------------------------------------

--
-- Table structure for table `blood_donation_center`
--

CREATE TABLE `blood_donation_center` (
  `Center_id` int(11) NOT NULL,
  `Center_name` varchar(30) NOT NULL,
  `Center_location` varchar(25) NOT NULL,
  `Center_phone_no` bigint(20) NOT NULL,
  `Staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_donation_center`
--

INSERT INTO `blood_donation_center` (`Center_id`, `Center_name`, `Center_location`, `Center_phone_no`, `Staff_id`) VALUES
(1, 'City Blood Bank', 'jayanagar', 6234567890, 1000),
(2, 'Town Blood Center', 'k r puram', 9988654321, 1002),
(3, 'Village Blood Drive', 'banashankari', 7555098765, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `blood_transfusion`
--

CREATE TABLE `blood_transfusion` (
  `Transfusion_id` int(11) NOT NULL,
  `Bag_id` int(11) NOT NULL,
  `Recipient_id` int(11) NOT NULL,
  `Transfusion_date` date NOT NULL,
  `Doctor_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_transfusion`
--

INSERT INTO `blood_transfusion` (`Transfusion_id`, `Bag_id`, `Recipient_id`, `Transfusion_date`, `Doctor_name`) VALUES
(10, 100, 1000, '2024-01-12', 'Shekhar'),
(11, 101, 1003, '2024-01-15', 'Latha'),
(12, 102, 1001, '2024-02-12', 'Shekhar'),
(13, 103, 1005, '2024-01-20', 'Shekhar'),
(14, 104, 1006, '2024-02-27', 'Latha');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `Donor_id` int(11) NOT NULL,
  `Donor_Name` varchar(30) NOT NULL,
  `Donor_Gender` char(1) NOT NULL,
  `Donor_Date_of_Birth` date NOT NULL,
  `Donor_Blood_type` char(5) NOT NULL,
  `Donor_Phone_No` bigint(10) NOT NULL,
  `Donor_Email` varchar(50) NOT NULL,
  `Donor_Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`Donor_id`, `Donor_Name`, `Donor_Gender`, `Donor_Date_of_Birth`, `Donor_Blood_type`, `Donor_Phone_No`, `Donor_Email`, `Donor_Address`) VALUES
(1, 'Rahul', 'M', '2003-03-04', 'A+', 6365123456, 'rahuls@gmail.com', 'Bengaluru'),
(2, 'Kishore', 'M', '2001-03-09', 'B+', 7676523456, 'kishorehr@gmail.com', 'Bengaluru'),
(3, 'Pradeep', 'M', '2002-03-04', 'AB+', 7172223456, 'pradeepps@gmail.com', 'Hyderabad'),
(4, 'Ramya', 'F', '1995-03-24', 'O+', 9965223456, 'ramyas@gmail.com', 'Bengaluru'),
(5, 'Rachitha', 'F', '1997-06-04', 'A-', 6365199087, 'rachithay@gmail.com', 'Mysore'),
(6, 'Abhishek', 'M', '2001-10-14', 'B-', 6365100991, 'abhipp@gmail.com', 'Tumkur'),
(7, 'Balaji', 'M', '1991-03-04', 'O-', 9916223456, 'balajikk@gmail.com', 'Mysuru'),
(8, 'Chandana', 'F', '2001-03-12', 'AB-', 7978023456, 'chandanar@gmail.com', 'Manglore'),
(9, 'Anjali', 'F', '2003-06-25', 'AB-', 6365199162, 'anjalilr@gmail.com', 'Chennai'),
(10, 'Rakshitha', 'F', '1991-12-04', 'O+', 6365199028, 'rakshithah@gmail.com', 'Bengaluru');

-- --------------------------------------------------------

--
-- Table structure for table `recepient`
--

CREATE TABLE `recepient` (
  `Recepient_id` int(11) NOT NULL,
  `Recepient_name` varchar(30) NOT NULL,
  `Recip_Gender` char(1) NOT NULL,
  `Recip_Date_of_Birth` date NOT NULL,
  `Recip_Blood_type` char(5) NOT NULL,
  `Recip_PhoneNo` bigint(10) NOT NULL,
  `Recip_Email` varchar(50) NOT NULL,
  `Recip_Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recepient`
--

INSERT INTO `recepient` (`Recepient_id`, `Recepient_name`, `Recip_Gender`, `Recip_Date_of_Birth`, `Recip_Blood_type`, `Recip_PhoneNo`, `Recip_Email`, `Recip_Address`) VALUES
(1000, 'John', 'M', '2003-05-08', 'A+', 990899162, 'johncum@gmail.com', 'Bengaluru'),
(1001, 'Smith', 'M', '2005-08-08', 'AB+', 9012391622, 'johncum@gmail.com', 'Bengaluru'),
(1002, 'David', 'M', '2008-05-08', 'A-', 9908912345, 'davidgg@gmail.com', 'Hyderabad'),
(1003, 'Akshay', 'M', '2002-05-08', 'B+', 62344291234, 'akshayp@gmail.com', 'Dharwad'),
(1004, 'Aradhana', 'F', '2003-12-12', 'O-', 6234499880, 'aradhanag@gmail.com', 'Mysuru'),
(1005, 'Arjun', 'M', '2000-05-18', 'AB-', 6234412340, 'arjunk@gmail.com', 'Bengaluru'),
(1006, 'Ganga', 'F', '2006-09-08', 'O+', 6234429162, 'gangag@gmail.com', 'Karwar'),
(1007, 'Shwetha', 'F', '2004-05-28', 'B+', 6234474753, 'shwetha@gmail.com', 'Manglore'),
(1008, 'Karan', 'M', '2007-12-18', 'B-', 9916229162, 'karank@gmail.com', 'Mysuru'),
(1009, 'Karthik', 'M', '2001-02-22', 'A+', 6234476761, 'karthikk@gmail.com', 'Bengaluru');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `Register_id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`Register_id`, `Username`, `Email`, `Password`) VALUES
(1, 'sss', 'ss@gmail.com', '123456'),
(4, 'srini_0912', 'srinivasnagraj1209@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_id` int(11) NOT NULL,
  `Staff_name` varchar(255) NOT NULL,
  `Position` varchar(25) NOT NULL,
  `Staff_phone_no` bigint(20) NOT NULL,
  `Staff_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_id`, `Staff_name`, `Position`, `Staff_phone_no`, `Staff_email`) VALUES
(1000, 'Rahul', 'Manager', 9901123345, 'rahulss@gmail.com'),
(1001, 'Girish', 'Lab Technician', 9901163666, 'girishkk@gmail.com'),
(1002, 'Rajesh', 'Medical Technologist', 8765423345, 'rajeshyy@gmail.com'),
(1003, 'Reshma', 'Receptionist', 6543299162, 'reshmar@gmail.com'),
(1004, 'Karthik', 'Phlebotomist', 7654319807, 'karthikjj@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodbag`
--
ALTER TABLE `bloodbag`
  ADD PRIMARY KEY (`Bag_id`);

--
-- Indexes for table `blood_transfusion`
--
ALTER TABLE `blood_transfusion`
  ADD PRIMARY KEY (`Transfusion_id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`Donor_id`),
  ADD UNIQUE KEY `Donor_Phone_No` (`Donor_Phone_No`);

--
-- Indexes for table `recepient`
--
ALTER TABLE `recepient`
  ADD PRIMARY KEY (`Recepient_id`),
  ADD UNIQUE KEY `Recip_PhoneNo` (`Recip_PhoneNo`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`Register_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloodbag`
--
ALTER TABLE `bloodbag`
  MODIFY `Bag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `blood_transfusion`
--
ALTER TABLE `blood_transfusion`
  MODIFY `Transfusion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `Donor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recepient`
--
ALTER TABLE `recepient`
  MODIFY `Recepient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `Register_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

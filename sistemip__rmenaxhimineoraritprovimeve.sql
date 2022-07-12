-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: May 31, 2022 at 03:16 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemipërmenaxhimineoraritprovimeve`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresa`
--

CREATE TABLE `adresa` (
  `AdresaID` int(11) NOT NULL,
  `Shteti` varchar(255) NOT NULL,
  `ZipKodi` int(11) NOT NULL,
  `Qyteti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adresa`
--

INSERT INTO `adresa` (`AdresaID`, `Shteti`, `ZipKodi`, `Qyteti`) VALUES
(1, 'Kosove', 10000, 'Prishtine'),
(2, 'Kosove', 12000, 'Prizren');

-- --------------------------------------------------------

--
-- Table structure for table `afati`
--

CREATE TABLE `afati` (
  `AfatiID` int(11) NOT NULL,
  `AfatiEmri` varchar(255) NOT NULL,
  `DataFillimit` date NOT NULL,
  `DataMbarimit` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `afati`
--

INSERT INTO `afati` (`AfatiID`, `AfatiEmri`, `DataFillimit`, `DataMbarimit`) VALUES
(1, 'Janar', '2022-01-15', '2022-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `departamenti`
--

CREATE TABLE `departamenti` (
  `DepartamentiID` int(11) NOT NULL,
  `EmriDepartamentit` varchar(255) NOT NULL,
  `FakultetiID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departamenti`
--

INSERT INTO `departamenti` (`DepartamentiID`, `EmriDepartamentit`, `FakultetiID`) VALUES
(1, 'Inxhinieri Kompjuterike', 1),
(2, 'Telekom', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fakulteti`
--

CREATE TABLE `fakulteti` (
  `FakultetiID` int(11) NOT NULL,
  `FakultetiEmri` varchar(255) NOT NULL,
  `UniversitetiID` int(11) NOT NULL,
  `AdresaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fakulteti`
--

INSERT INTO `fakulteti` (`FakultetiID`, `FakultetiEmri`, `UniversitetiID`, `AdresaID`) VALUES
(1, 'Fakulteti i Inxhinierise Elektrike dhe Kompjuterike', 1, 1),
(2, 'Fakulteti i Edukimit', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lënda`
--

CREATE TABLE `lënda` (
  `LëndaID` int(11) NOT NULL,
  `ProfesoriID` int(11) NOT NULL,
  `DepartamentiID` int(11) NOT NULL,
  `EmriLëndes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lënda`
--

INSERT INTO `lënda` (`LëndaID`, `ProfesoriID`, `DepartamentiID`, `EmriLëndes`) VALUES
(1, 1, 1, 'Qarqe Elektrike'),
(2, 1, 1, 'Sinjale dhe Sisteme');

-- --------------------------------------------------------

--
-- Table structure for table `orariprovimeve`
--

CREATE TABLE `orariprovimeve` (
  `OrariID` int(11) NOT NULL,
  `LëndaID` int(11) NOT NULL,
  `ProfesoriID` int(11) NOT NULL,
  `AfatiID` int(11) NOT NULL,
  `DataProvimit` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orariprovimeve`
--

INSERT INTO `orariprovimeve` (`OrariID`, `LëndaID`, `ProfesoriID`, `AfatiID`, `DataProvimit`) VALUES
(1, 1, 1, 1, '2022-05-01'),
(2, 2, 2, 1, '2022-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `profesori`
--

CREATE TABLE `profesori` (
  `ProfesoriID` int(11) NOT NULL,
  `pEmri` varchar(255) NOT NULL,
  `pMbiemri` varchar(255) NOT NULL,
  `pEmail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profesori`
--

INSERT INTO `profesori` (`ProfesoriID`, `pEmri`, `pMbiemri`, `pEmail`) VALUES
(1, 'Luan', 'Ahma', 'luan.ahma@uni-pr.edu'),
(2, 'Vjosa', 'Shatri', 'vjosa.shatri@uni-pr.edu');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`, `Description`) VALUES
(1, 'Admin', 'Ka prioritete'),
(2, 'User', 'Ska prioritete');

-- --------------------------------------------------------

--
-- Table structure for table `universiteti`
--

CREATE TABLE `universiteti` (
  `UniversitetiID` int(11) NOT NULL,
  `EmriUniversiteti` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `universiteti`
--

INSERT INTO `universiteti` (`UniversitetiID`, `EmriUniversiteti`) VALUES
(1, 'Universiteti i Prishtines - \"Hasan Prishtina\"');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `UserName`, `Password`) VALUES
(1, 'Edi', 'edi'),
(2, 'Andi', 'andi'),
(3, 'Biona', 'biona'),
(4, 'Altin', 'altin'),
(5, 'Albiona', 'albiona');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `FakultetiID` int(11) NOT NULL,
  `DepartamentiID` int(11) NOT NULL,
  `uName` varchar(255) NOT NULL,
  `uLastName` varchar(255) NOT NULL,
  `uEmail` varchar(255) NOT NULL,
  `uUsername` varchar(255) NOT NULL,
  `uPassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `RoleID`, `FakultetiID`, `DepartamentiID`, `uName`, `uLastName`, `uEmail`, `uUsername`, `uPassword`) VALUES
(1, 2, 1, 1, 'Altin', 'Musliu', 'Alitn@alibaba.com', 'Altin', 'altin'),
(9, 2, 1, 1, 'Albiona', 'Vukaj', 'Albiona@gmail.com', 'Albiona', 'albiona');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Gender` char(1) NOT NULL,
  `Status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`UserID`, `UserName`, `Gender`, `Status`) VALUES
(1, 'Edi', 'm', '1'),
(2, 'Andi', 'm', '1'),
(3, 'Biona', 'f', '1'),
(4, 'Altin', '', '1'),
(5, 'Albiona', 'f', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresa`
--
ALTER TABLE `adresa`
  ADD PRIMARY KEY (`AdresaID`);

--
-- Indexes for table `afati`
--
ALTER TABLE `afati`
  ADD PRIMARY KEY (`AfatiID`);

--
-- Indexes for table `departamenti`
--
ALTER TABLE `departamenti`
  ADD PRIMARY KEY (`DepartamentiID`),
  ADD KEY `FakultetiID` (`FakultetiID`);

--
-- Indexes for table `fakulteti`
--
ALTER TABLE `fakulteti`
  ADD PRIMARY KEY (`FakultetiID`),
  ADD KEY `UniversitetiID` (`UniversitetiID`),
  ADD KEY `AdresaID` (`AdresaID`);

--
-- Indexes for table `lënda`
--
ALTER TABLE `lënda`
  ADD PRIMARY KEY (`LëndaID`),
  ADD KEY `ProfesoriID` (`ProfesoriID`),
  ADD KEY `DepartamentiID` (`DepartamentiID`);

--
-- Indexes for table `orariprovimeve`
--
ALTER TABLE `orariprovimeve`
  ADD PRIMARY KEY (`OrariID`),
  ADD KEY `LëndaID` (`LëndaID`),
  ADD KEY `ProfesoriID` (`ProfesoriID`),
  ADD KEY `AfatiID` (`AfatiID`);

--
-- Indexes for table `profesori`
--
ALTER TABLE `profesori`
  ADD PRIMARY KEY (`ProfesoriID`),
  ADD UNIQUE KEY `pEmail` (`pEmail`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `universiteti`
--
ALTER TABLE `universiteti`
  ADD PRIMARY KEY (`UniversitetiID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `uName` (`uName`),
  ADD UNIQUE KEY `uLastName` (`uLastName`),
  ADD UNIQUE KEY `uEmail` (`uEmail`),
  ADD UNIQUE KEY `uUsername` (`uUsername`),
  ADD KEY `FakultetiID` (`FakultetiID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresa`
--
ALTER TABLE `adresa`
  MODIFY `AdresaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `afati`
--
ALTER TABLE `afati`
  MODIFY `AfatiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departamenti`
--
ALTER TABLE `departamenti`
  MODIFY `DepartamentiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fakulteti`
--
ALTER TABLE `fakulteti`
  MODIFY `FakultetiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lënda`
--
ALTER TABLE `lënda`
  MODIFY `LëndaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orariprovimeve`
--
ALTER TABLE `orariprovimeve`
  MODIFY `OrariID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profesori`
--
ALTER TABLE `profesori`
  MODIFY `ProfesoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `universiteti`
--
ALTER TABLE `universiteti`
  MODIFY `UniversitetiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departamenti`
--
ALTER TABLE `departamenti`
  ADD CONSTRAINT `departamenti_ibfk_1` FOREIGN KEY (`FakultetiID`) REFERENCES `fakulteti` (`FakultetiID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fakulteti`
--
ALTER TABLE `fakulteti`
  ADD CONSTRAINT `fakulteti_ibfk_1` FOREIGN KEY (`UniversitetiID`) REFERENCES `universiteti` (`UniversitetiID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fakulteti_ibfk_2` FOREIGN KEY (`AdresaID`) REFERENCES `adresa` (`AdresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lënda`
--
ALTER TABLE `lënda`
  ADD CONSTRAINT `lënda_ibfk_1` FOREIGN KEY (`ProfesoriID`) REFERENCES `profesori` (`ProfesoriID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lënda_ibfk_2` FOREIGN KEY (`DepartamentiID`) REFERENCES `departamenti` (`DepartamentiID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orariprovimeve`
--
ALTER TABLE `orariprovimeve`
  ADD CONSTRAINT `orariprovimeve_ibfk_1` FOREIGN KEY (`LëndaID`) REFERENCES `lënda` (`LëndaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orariprovimeve_ibfk_2` FOREIGN KEY (`ProfesoriID`) REFERENCES `profesori` (`ProfesoriID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orariprovimeve_ibfk_3` FOREIGN KEY (`AfatiID`) REFERENCES `afati` (`AfatiID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`FakultetiID`) REFERENCES `fakulteti` (`FakultetiID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`RoleID`) REFERENCES `departamenti` (`DepartamentiID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

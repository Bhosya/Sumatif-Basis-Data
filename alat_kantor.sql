-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 04:47 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alat_kantor`
--

-- --------------------------------------------------------

--
-- Table structure for table `alat_tulis`
--

CREATE TABLE `alat_tulis` (
  `Id` int(11) NOT NULL,
  `NamaBarang` varchar(100) NOT NULL,
  `Harga` int(100) NOT NULL,
  `Jumlah` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alat_tulis`
--

INSERT INTO `alat_tulis` (`Id`, `NamaBarang`, `Harga`, `Jumlah`) VALUES
(1, 'Bolpoin', 2500, 50),
(2, 'Pensil', 1500, 35),
(3, 'Penghapus', 1000, 30),
(4, 'Spidol', 7000, 60),
(5, 'Stabilo', 5000, 45),
(6, 'Buku', 3000, 70),
(7, 'Penggaris', 3500, 30),
(8, 'Stopmap', 1000, 65),
(9, 'Kertas', 45000, 15),
(10, 'Kalkuator', 25000, 55);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `Id` int(11) NOT NULL,
  `NamaPembeli` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`Id`, `NamaPembeli`) VALUES
(1, 'Rapi'),
(2, 'Piki'),
(3, 'Asep'),
(4, 'Ariel'),
(5, 'Arya'),
(6, 'Dapa'),
(7, 'Sefa'),
(8, 'Sifa'),
(9, 'Halim'),
(10, 'Dapin');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_pembeli` int(100) NOT NULL,
  `id_barang` int(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pembeli`, `id_barang`, `jumlah`, `harga`) VALUES
(2, 2, 1, 10, 25000),
(3, 1, 3, 3, 4500),
(4, 3, 5, 2, 10000),
(5, 4, 10, 1, 25000),
(6, 5, 7, 3, 10500),
(7, 6, 2, 7, 10500),
(8, 7, 8, 4, 4000),
(9, 8, 6, 12, 36000),
(10, 9, 3, 1, 1000),
(11, 10, 3, 1, 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alat_tulis`
--
ALTER TABLE `alat_tulis`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_barang` (`id_barang`),
  ADD KEY `transaksi_ibfk_2` (`id_pembeli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alat_tulis`
--
ALTER TABLE `alat_tulis`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `alat_tulis` (`Id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

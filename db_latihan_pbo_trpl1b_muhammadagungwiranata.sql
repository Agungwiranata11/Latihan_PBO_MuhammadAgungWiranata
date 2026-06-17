-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2026 at 02:25 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_latihan_pbo_trpl1b_muhammadagungwiranata`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_tiket`
--

CREATE TABLE `tabel_tiket` (
  `id_tiket` int NOT NULL,
  `nama_film` varchar(100) NOT NULL,
  `jadwal_tayang` datetime NOT NULL,
  `jumlah_kursi` int NOT NULL,
  `harga_dasar_tiket` decimal(10,2) NOT NULL,
  `jenis_studio` enum('Regular','IMAX','Velvet') NOT NULL,
  `tipe_audio` varchar(50) DEFAULT NULL,
  `lokasi_baris` varchar(10) DEFAULT NULL,
  `kacamata_3d_id` varchar(50) DEFAULT NULL,
  `efek_gerak_fitur` varchar(50) DEFAULT NULL,
  `bantal_selimut_pack` varchar(50) DEFAULT NULL,
  `layanan_butler` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabel_tiket`
--

INSERT INTO `tabel_tiket` (`id_tiket`, `nama_film`, `jadwal_tayang`, `jumlah_kursi`, `harga_dasar_tiket`, `jenis_studio`, `tipe_audio`, `lokasi_baris`, `kacamata_3d_id`, `efek_gerak_fitur`, `bantal_selimut_pack`, `layanan_butler`) VALUES
(1, 'Avengers: Endgame', '2026-06-20 13:00:00', 2, '40000.00', 'Regular', 'Dolby Digital 7.1', 'Baris G', NULL, NULL, NULL, NULL),
(2, 'Spider-Man: No Way Home', '2026-06-20 15:30:00', 3, '40000.00', 'Regular', 'Dolby Atmos', 'Baris E', NULL, NULL, NULL, NULL),
(3, 'Gundala', '2026-06-20 18:00:00', 1, '35000.00', 'Regular', 'DTS:X', 'Baris C', NULL, NULL, NULL, NULL),
(4, 'Pengabdi Setan 2', '2026-06-20 21:00:00', 4, '35000.00', 'Regular', 'Dolby Digital 5.1', 'Baris A', NULL, NULL, NULL, NULL),
(5, 'KKN di Desa Penari', '2026-06-21 12:00:00', 2, '40000.00', 'Regular', 'Dolby Atmos', 'Baris F', NULL, NULL, NULL, NULL),
(6, 'Agak Laen', '2026-06-21 14:30:00', 5, '40000.00', 'Regular', 'Standard Stereo', 'Baris D', NULL, NULL, NULL, NULL),
(7, 'Laskar Pelangi', '2026-06-21 17:00:00', 2, '35000.00', 'Regular', 'Dolby Digital 7.1', 'Baris B', NULL, NULL, NULL, NULL),
(8, 'Interstellar', '2026-06-21 19:00:00', 1, '60000.00', 'IMAX', NULL, NULL, 'GL-IMAX-01', 'Active Motion Bass', NULL, NULL),
(9, 'Dune: Part Two', '2026-06-21 21:45:00', 2, '65000.00', 'IMAX', NULL, NULL, 'GL-IMAX-02', 'Full Motion Simulation', NULL, NULL),
(10, 'Oppenheimer', '2026-06-22 13:00:00', 2, '70000.00', 'IMAX', NULL, NULL, 'GL-IMAX-03', 'Sub-Bass Shaker', NULL, NULL),
(11, 'Avatar: The Way of Water', '2026-06-22 16:30:00', 3, '75000.00', 'IMAX', NULL, NULL, 'GL-IMAX-04', 'Water Mist & Wind Fitur', NULL, NULL),
(12, 'Top Gun: Maverick', '2026-06-22 20:00:00', 2, '65000.00', 'IMAX', NULL, NULL, 'GL-IMAX-05', 'G-Force Cockpit Vibration', NULL, NULL),
(13, 'Tenet', '2026-06-23 14:00:00', 1, '60000.00', 'IMAX', NULL, NULL, 'GL-IMAX-06', 'Inversion Time Echo', NULL, NULL),
(14, 'The Matrix Resurrections', '2026-06-23 17:15:00', 2, '60000.00', 'IMAX', NULL, NULL, 'GL-IMAX-07', 'Standard Motion', NULL, NULL),
(15, 'The Batman', '2026-06-22 18:00:00', 2, '100000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Premium Quilt Pack', 'Personal Butler Service'),
(16, 'Inception', '2026-06-22 21:15:00', 4, '100000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Standard Cozy Pack', 'On-Call Butler Service'),
(17, 'Titanic', '2026-06-23 12:00:00', 2, '120000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Luxury Silk Pack', 'VVIP Butler Service'),
(18, 'La La Land', '2026-06-23 15:30:00', 2, '100000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Romantic Couple Pack', 'Personal Butler Service'),
(19, 'The Godfather', '2026-06-23 19:00:00', 2, '150000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Vintage Executive Pack', 'Executive Butler Service'),
(20, 'Past Lives', '2026-06-23 22:15:00', 2, '100000.00', 'Velvet', NULL, NULL, NULL, NULL, 'Standard Cozy Pack', 'On-Call Butler Service');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_tiket`
--
ALTER TABLE `tabel_tiket`
  ADD PRIMARY KEY (`id_tiket`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_tiket`
--
ALTER TABLE `tabel_tiket`
  MODIFY `id_tiket` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

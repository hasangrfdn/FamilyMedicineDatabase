-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 02 Haz 2024, 00:35:17
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `schema`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ailehekimi`
--

CREATE TABLE `ailehekimi` (
  `aileHekimiID` int(11) NOT NULL,
  `ad` varchar(50) DEFAULT NULL,
  `soyad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolum`
--

CREATE TABLE `bolum` (
  `bolumID` int(11) NOT NULL,
  `bolumAdi` varchar(100) DEFAULT NULL,
  `bolumAciklama` text DEFAULT NULL,
  `yoneticiID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doktor`
--

CREATE TABLE `doktor` (
  `doktorID` int(11) NOT NULL,
  `soyad` varchar(50) DEFAULT NULL,
  `ad` varchar(50) DEFAULT NULL,
  `uzmanlikAlani` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gorev`
--

CREATE TABLE `gorev` (
  `gorevID` int(11) NOT NULL,
  `gorevDetay` text DEFAULT NULL,
  `labID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hasta`
--

CREATE TABLE `hasta` (
  `hastaID` int(11) NOT NULL,
  `soyad` varchar(50) DEFAULT NULL,
  `ad` varchar(50) DEFAULT NULL,
  `cinsiyet` varchar(10) DEFAULT NULL,
  `dogumTarihi` date DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `aileHekimiID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `laboratuvar`
--

CREATE TABLE `laboratuvar` (
  `labID` int(11) NOT NULL,
  `labAdi` varchar(100) DEFAULT NULL,
  `labAdres` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `randevu`
--

CREATE TABLE `randevu` (
  `randevuID` int(11) NOT NULL,
  `hastaID` int(11) DEFAULT NULL,
  `doktorID` int(11) DEFAULT NULL,
  `randevuTarihi` date DEFAULT NULL,
  `randevuDurumu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `recete`
--

CREATE TABLE `recete` (
  `receteID` int(11) NOT NULL,
  `doktorID` int(11) DEFAULT NULL,
  `ilacAdi` varchar(100) DEFAULT NULL,
  `dozaj` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `saglikhizmetleri`
--

CREATE TABLE `saglikhizmetleri` (
  `hizmetID` int(11) NOT NULL,
  `hizmetAdi` varchar(100) DEFAULT NULL,
  `bolumID` int(11) DEFAULT NULL,
  `gorevID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tahlil`
--

CREATE TABLE `tahlil` (
  `tahlilID` int(11) NOT NULL,
  `hastaID` int(11) DEFAULT NULL,
  `tahlilSonuc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tedavi`
--

CREATE TABLE `tedavi` (
  `tedaviID` int(11) NOT NULL,
  `hastaID` int(11) DEFAULT NULL,
  `tedaviDetay` text DEFAULT NULL,
  `labID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetic`
--

CREATE TABLE `yonetic` (
  `yoneticiID` int(11) NOT NULL,
  `ad` varchar(50) DEFAULT NULL,
  `soyad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ailehekimi`
--
ALTER TABLE `ailehekimi`
  ADD PRIMARY KEY (`aileHekimiID`);

--
-- Tablo için indeksler `bolum`
--
ALTER TABLE `bolum`
  ADD PRIMARY KEY (`bolumID`),
  ADD KEY `yoneticiID` (`yoneticiID`);

--
-- Tablo için indeksler `doktor`
--
ALTER TABLE `doktor`
  ADD PRIMARY KEY (`doktorID`);

--
-- Tablo için indeksler `gorev`
--
ALTER TABLE `gorev`
  ADD PRIMARY KEY (`gorevID`),
  ADD KEY `labID` (`labID`);

--
-- Tablo için indeksler `hasta`
--
ALTER TABLE `hasta`
  ADD PRIMARY KEY (`hastaID`),
  ADD KEY `aileHekimiID` (`aileHekimiID`);

--
-- Tablo için indeksler `laboratuvar`
--
ALTER TABLE `laboratuvar`
  ADD PRIMARY KEY (`labID`);

--
-- Tablo için indeksler `randevu`
--
ALTER TABLE `randevu`
  ADD PRIMARY KEY (`randevuID`),
  ADD KEY `hastaID` (`hastaID`),
  ADD KEY `doktorID` (`doktorID`);

--
-- Tablo için indeksler `recete`
--
ALTER TABLE `recete`
  ADD PRIMARY KEY (`receteID`),
  ADD KEY `doktorID` (`doktorID`);

--
-- Tablo için indeksler `saglikhizmetleri`
--
ALTER TABLE `saglikhizmetleri`
  ADD PRIMARY KEY (`hizmetID`),
  ADD KEY `bolumID` (`bolumID`),
  ADD KEY `gorevID` (`gorevID`);

--
-- Tablo için indeksler `tahlil`
--
ALTER TABLE `tahlil`
  ADD PRIMARY KEY (`tahlilID`),
  ADD KEY `hastaID` (`hastaID`);

--
-- Tablo için indeksler `tedavi`
--
ALTER TABLE `tedavi`
  ADD PRIMARY KEY (`tedaviID`),
  ADD KEY `hastaID` (`hastaID`),
  ADD KEY `labID` (`labID`);

--
-- Tablo için indeksler `yonetic`
--
ALTER TABLE `yonetic`
  ADD PRIMARY KEY (`yoneticiID`);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `bolum`
--
ALTER TABLE `bolum`
  ADD CONSTRAINT `bolum_ibfk_1` FOREIGN KEY (`yoneticiID`) REFERENCES `yonetic` (`yoneticiID`);

--
-- Tablo kısıtlamaları `gorev`
--
ALTER TABLE `gorev`
  ADD CONSTRAINT `gorev_ibfk_1` FOREIGN KEY (`labID`) REFERENCES `laboratuvar` (`labID`);

--
-- Tablo kısıtlamaları `hasta`
--
ALTER TABLE `hasta`
  ADD CONSTRAINT `hasta_ibfk_1` FOREIGN KEY (`aileHekimiID`) REFERENCES `ailehekimi` (`aileHekimiID`);

--
-- Tablo kısıtlamaları `randevu`
--
ALTER TABLE `randevu`
  ADD CONSTRAINT `randevu_ibfk_1` FOREIGN KEY (`hastaID`) REFERENCES `hasta` (`hastaID`),
  ADD CONSTRAINT `randevu_ibfk_2` FOREIGN KEY (`doktorID`) REFERENCES `doktor` (`doktorID`);

--
-- Tablo kısıtlamaları `recete`
--
ALTER TABLE `recete`
  ADD CONSTRAINT `recete_ibfk_1` FOREIGN KEY (`doktorID`) REFERENCES `doktor` (`doktorID`);

--
-- Tablo kısıtlamaları `saglikhizmetleri`
--
ALTER TABLE `saglikhizmetleri`
  ADD CONSTRAINT `saglikhizmetleri_ibfk_1` FOREIGN KEY (`bolumID`) REFERENCES `bolum` (`bolumID`),
  ADD CONSTRAINT `saglikhizmetleri_ibfk_2` FOREIGN KEY (`gorevID`) REFERENCES `gorev` (`gorevID`);

--
-- Tablo kısıtlamaları `tahlil`
--
ALTER TABLE `tahlil`
  ADD CONSTRAINT `tahlil_ibfk_1` FOREIGN KEY (`hastaID`) REFERENCES `hasta` (`hastaID`);

--
-- Tablo kısıtlamaları `tedavi`
--
ALTER TABLE `tedavi`
  ADD CONSTRAINT `tedavi_ibfk_1` FOREIGN KEY (`hastaID`) REFERENCES `hasta` (`hastaID`),
  ADD CONSTRAINT `tedavi_ibfk_2` FOREIGN KEY (`labID`) REFERENCES `laboratuvar` (`labID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

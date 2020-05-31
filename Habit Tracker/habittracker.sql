-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 31 Maj 2020, 15:34
-- Wersja serwera: 10.4.10-MariaDB
-- Wersja PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `habittracker`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miesiace`
--

CREATE TABLE `miesiace` (
  `id_miesiaca` int(2) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  `liczba_dni` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `miesiace`
--

INSERT INTO `miesiace` (`id_miesiaca`, `nazwa`, `liczba_dni`) VALUES
(1, 'Styczeń', 31),
(2, 'Luty', 28),
(3, 'Marzec', 31),
(4, 'Kwiecień', 30),
(5, 'Maj', 31),
(6, 'Czerwiec', 30),
(7, 'Lipiec', 31),
(8, 'Sierpień', 31),
(9, 'Wrzesień', 30),
(10, 'Październik', 31),
(11, 'Listopad', 30),
(12, 'Grudzień', 31);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nawyki`
--

CREATE TABLE `nawyki` (
  `id_nawyku` int(2) NOT NULL,
  `id_uzytkownika` int(2) NOT NULL,
  `nazwa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `nawyki`
--

INSERT INTO `nawyki` (`id_nawyku`, `id_uzytkownika`, `nazwa`) VALUES
(1, 19, 'Mycie zębów');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `ID` int(2) NOT NULL,
  `LOGIN` varchar(30) DEFAULT NULL,
  `HASLO` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`ID`, `LOGIN`, `HASLO`) VALUES
(17, 'Testowy', 'haslo'),
(18, 'Adam', 'haslo'),
(19, 'Klaudia', 'haslo2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_nawyku`
--

CREATE TABLE `zapisy_nawyku` (
  `id_zapisu` int(11) NOT NULL,
  `id_nawyku` int(2) NOT NULL,
  `id_miesiaca` int(2) NOT NULL,
  `dni_nawyku` varchar(20) NOT NULL,
  `rok` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_nawyku`
--

INSERT INTO `zapisy_nawyku` (`id_zapisu`, `id_nawyku`, `id_miesiaca`, `dni_nawyku`, `rok`) VALUES
(1, 1, 2, '0', 2020);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `miesiace`
--
ALTER TABLE `miesiace`
  ADD PRIMARY KEY (`id_miesiaca`);

--
-- Indeksy dla tabeli `nawyki`
--
ALTER TABLE `nawyki`
  ADD PRIMARY KEY (`id_nawyku`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `zapisy_nawyku`
--
ALTER TABLE `zapisy_nawyku`
  ADD PRIMARY KEY (`id_zapisu`),
  ADD KEY `fk_zapis_nawyk` (`id_nawyku`),
  ADD KEY `fk_zapis_miesiac` (`id_miesiaca`);

--
-- AUTO_INCREMENT dla tabel zrzutów
--

--
-- AUTO_INCREMENT dla tabeli `nawyki`
--
ALTER TABLE `nawyki`
  MODIFY `id_nawyku` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT dla tabeli `zapisy_nawyku`
--
ALTER TABLE `zapisy_nawyku`
  MODIFY `id_zapisu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `zapisy_nawyku`
--
ALTER TABLE `zapisy_nawyku`
  ADD CONSTRAINT `fk_zapis_miesiac` FOREIGN KEY (`id_miesiaca`) REFERENCES `miesiace` (`id_miesiaca`),
  ADD CONSTRAINT `fk_zapis_nawyk` FOREIGN KEY (`id_nawyku`) REFERENCES `nawyki` (`id_nawyku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

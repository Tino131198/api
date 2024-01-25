-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Gegenereerd op: 25 jan 2024 om 11:56
-- Serverversie: 10.4.28-MariaDB
-- PHP-versie: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jokesdb`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jokes`
--

CREATE TABLE `jokes` (
  `id` int(11) NOT NULL,
  `setup` varchar(255) DEFAULT NULL,
  `punchline` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `jokes`
--

INSERT INTO `jokes` (`id`, `setup`, `punchline`) VALUES
(1, 'I got fired from the sandpaper factory', 'They said I was too abrasive'),
(2, 'What do you call someone who\'s been stabbed 3 times?', 'An ambulance'),
(3, 'I was on a date with this girl I found on tinder', 'I reached the cafe early. She came a little later. Like a gentleman, I helped her sit by pulling her stool. When she seemed comfortable I asked, \"Can I push your stool in ?\"She : \"Let\'s see how this date goes first\"'),
(4, 'Working at a Land Rover factory is so interesting', 'I make a new Discovery every day'),
(5, 'For my birthday I bought a pair of ghost bumblee earrings.', 'This way my face can always be between a pair of boo-bees.');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `jokes`
--
ALTER TABLE `jokes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `jokes`
--
ALTER TABLE `jokes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

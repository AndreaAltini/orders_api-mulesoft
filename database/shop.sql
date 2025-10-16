-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Ott 16, 2025 alle 15:40
-- Versione del server: 5.7.24
-- Versione PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `customers`
--

CREATE TABLE `customers` (
  `id` int(3) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Andrea', 'Geppetto', 'andrea.geppetto@gmail.com'),
(2, 'Marcello', 'Depascazio', 'marcidepi@gmail.com'),
(3, 'Marco', 'Nardico', 'marco_nardico@libero.it'),
(4, 'Eleonora', 'Triagli', 'triagli96@hotmail.it'),
(5, 'Valerio', 'Lunghini', 'valung@gmail.com'),
(6, 'Francesca', 'Rossi', 'francesca.rossi@yahoo.it'),
(7, 'Giovanni', 'Bianchi', 'giovanni.bianchi@gmail.com'),
(8, 'Chiara', 'Verdi', 'chiara.verdi@hotmail.com'),
(9, 'Luca', 'Ferrari', 'luca.ferrari@gmail.com'),
(10, 'Sara', 'Mariani', 'sara.mariani@outlook.it');

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE `orders` (
  `id` int(3) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `customer_id` int(3) DEFAULT NULL,
  `status` enum('processing','confirmed','shipped','delivered') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id`, `order_date`, `customer_id`, `status`) VALUES
(1, '2025-09-01 10:30:00', 1, 'processing'),
(2, '2025-09-02 15:00:00', 2, 'confirmed'),
(3, '2025-09-03 09:45:00', 3, 'shipped'),
(4, '2025-09-04 12:10:00', 4, 'delivered'),
(5, '2025-09-05 17:20:00', 5, 'processing'),
(6, '2025-09-06 08:00:00', 6, 'confirmed'),
(7, '2025-09-06 19:30:00', 7, 'shipped'),
(8, '2025-09-07 14:05:00', 8, 'delivered'),
(9, '2025-09-08 11:15:00', 9, 'processing'),
(10, '2025-09-09 16:40:00', 10, 'confirmed'),
(11, '2025-09-10 09:00:00', 1, 'shipped'),
(12, '2025-09-11 13:25:00', 2, 'delivered');

-- --------------------------------------------------------

--
-- Struttura della tabella `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 1, 749.99),
(2, 1, 2, 1, 99.9),
(3, 2, 3, 1, 12.5),
(4, 2, 4, 1, 35),
(5, 3, 9, 1, 299.99),
(6, 3, 2, 2, 99.9),
(7, 4, 5, 1, 599),
(8, 4, 6, 2, 29.99),
(9, 5, 7, 1, 120),
(10, 5, 8, 1, 65),
(11, 6, 3, 2, 12.5),
(12, 6, 10, 1, 139.99),
(13, 7, 1, 1, 749.99),
(14, 7, 9, 1, 299.99),
(15, 8, 4, 1, 35),
(16, 8, 6, 3, 29.99),
(17, 9, 8, 1, 65),
(18, 9, 3, 1, 12.5),
(19, 10, 10, 1, 139.99),
(20, 10, 2, 1, 99.9),
(21, 11, 5, 1, 599),
(22, 11, 7, 1, 120),
(23, 12, 9, 1, 299.99),
(24, 12, 6, 1, 29.99);

-- --------------------------------------------------------

--
-- Struttura della tabella `products`
--

CREATE TABLE `products` (
  `id` int(3) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `category` enum('informatics','books','home','other') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `products`
--

INSERT INTO `products` (`id`, `name`, `unit_price`, `category`) VALUES
(1, 'HP Pavilion 15 Laptop', 749.99, 'informatics'),
(2, 'Logitech MX Master 3 Mouse', 99.9, 'informatics'),
(3, 'Harry Potter and the Philosopher\'s Stone', 12.5, 'books'),
(4, 'The Lord of the Rings', 35, 'books'),
(5, 'Dyson V11 Vacuum Cleaner', 599, 'home'),
(6, 'LED Desk Lamp', 29.99, 'home'),
(7, 'Stainless Steel Cookware Set', 120, 'home'),
(8, 'Invicta Tindy Backpack', 65, 'other'),
(9, 'Sony WH-1000XM4 Headphones', 299.99, 'informatics'),
(10, 'Kindle Paperwhite', 139.99, 'informatics');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`customer_id`);

--
-- Indici per le tabelle `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ordine` (`order_id`),
  ADD KEY `id_prodotto` (`product_id`);

--
-- Indici per le tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `products`
--
ALTER TABLE `products`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Limiti per la tabella `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

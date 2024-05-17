DROP DATABASE IF EXISTS copamundo;
CREATE DATABASE IF NOT EXISTS copamundo;
USE copamundo;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22-Mar-2019 às 20:52
-- Versão do servidor: 10.1.35-MariaDB
-- versão do PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `copa_mundo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `estadios`
--

CREATE TABLE `estadios` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `capacidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estadios`
--

INSERT INTO `estadios` (`codigo`, `nome`, `capacidade`) VALUES
(1, 'Lujniki', 80000),
(2, 'Spartak', 45000),
(3, 'São Petersburgo', 67000),
(4, 'Nizhny Novgorodorod', 45000),
(5, 'Sochi', 48000),
(6, 'Kazan', 45000),
(7, 'Samara', 45000),
(8, 'Rostov', 45000),
(9, 'Ecaterimburgo', 35000),
(10, 'Kaliningrado', 35000),
(11, 'Saransk', 44000),
(12, 'Volgogrado', 45000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadores`
--

CREATE TABLE `jogadores` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `idade` int(11) NOT NULL,
  `posicao` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `selecao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jogadores`
--

INSERT INTO `jogadores` (`codigo`, `nome`, `idade`, `posicao`, `numero`, `selecao`) VALUES
(1, 'NAHUEL GUZMAN', 32, 'GOLEIRO', 1, 1),
(2, 'GABRIEL MERCADO', 31, 'ZAGUEIRO', 2, 1),
(3, 'JAVIER MASCHERANO', 34, 'ZAGUEIRO', 14, 1),
(4, 'ANGEL DI MARIA', 30, 'MEIA', 11, 1),
(5, 'GONZALO HIGUAIN', 30, 'ATACANTE', 9, 1),
(6, 'LIONEL MESSI', 30, 'ATACANTE', 10, 1),
(7, 'SERGIO AGUERO', 30, 'ATACANTE', 19, 1),
(8, 'CASSIO', 31, 'GOLEIRO', 16, 4),
(9, 'THIAGO SILVA', 33, 'ZAGUEIRO', 2, 4),
(10, 'PEDRO GEROMEL', 32, 'ZAGUEIRO', 4, 4),
(11, 'PHILIPPE COUTINHO', 25, 'MEIA', 11, 4),
(12, 'PAULINHO', 29, 'MEIA', 15, 4),
(13, 'FRED', 25, 'MEIA', 18, 4),
(14, 'GABRIEL JESUS', 21, 'ATACANTE', 9, 4),
(15, 'NEYMAR', 26, 'ATACANTE', 10, 4),
(16, 'JEAN HENRIQUE', 25, 'ATACANTE', 7, 4),
(17, 'JACK BUTLAND', 25, 'GOLEIRO', 13, 10),
(18, 'KYLE WALKER', 28, 'ZAGUEIRO', 2, 10),
(19, 'DANNY ROSE', 27, 'ZAGUEIRO', 3, 10),
(20, 'JESSE LINGARD', 25, 'MEIA', 7, 10),
(21, 'HARRY KANE', 24, 'ATACANTE', 9, 10),
(22, 'RAHEEM STERLING', 23, 'ATACANTE', 10, 10),
(23, 'JAMIE VARDY', 31, 'ATACANTE', 11, 10),
(24, 'MANUEL NEUER', 32, 'GOLEIRO', 1, 12),
(25, 'MARVIN PLATTENHARDT', 26, 'ZAGUEIRO', 2, 12),
(26, 'JONAS HECTOR', 28, 'ZAGUEIRO', 3, 12),
(27, 'JULIAN DRAXLER', 24, 'MEIA', 7, 12),
(28, 'MESUT OZIL', 29, 'MEIA', 10, 12),
(29, 'TIMO WERNER', 22, 'ATACANTE', 9, 12),
(30, 'MARIO GOMEZ', 32, 'ATACANTE', 23, 12),
(31, 'HUGO LLORIS', 31, 'GOLEIRO', 1, 11),
(32, 'BENJAMIN PAVARD', 22, 'ZAGUEIRO', 2, 11),
(33, 'CORENTIN TOLISSO', 23, 'MEIA', 12, 11),
(34, 'ANTOINE GRIEZMANN', 27, 'MEIA', 7, 11),
(35, 'KYLIAN MBAPPE', 19, 'ATACANTE', 10, 11),
(36, 'OUSMANE DEMBELE', 21, 'ATACANTE', 11, 11),
(37, 'RUI PATRICIO', 30, 'GOLEIRO', 1, 23),
(38, 'BRUNO ALVES', 36, 'ZAGUEIRO', 2, 23),
(39, 'PEPE', 35, 'ZAGUEIRO', 3, 23),
(40, 'MARIO RUI', 27, 'ZAGUEIRO', 19, 23),
(41, 'MANUEL FERNANDES', 32, 'MEIA', 4, 23),
(42, 'JOAO MARIO', 25, 'MEIA', 10, 23),
(43, 'BERNARDO SILVA', 23, 'MEIA', 11, 23),
(44, 'CRISTIANO RONALDO', 33, 'ATACANTE', 7, 23),
(45, 'RICARDO QUARESMA', 34, 'ATACANTE', 20, 23),
(46, 'DAVID DE GEA', 27, 'GOLEIRO', 1, 28),
(47, 'GERARD PIQUE', 31, 'ZAGUEIRO', 3, 28),
(48, 'NACHO', 28, 'ZAGUEIRO', 4, 28),
(49, 'SERGIO RAMOS', 32, 'ZAGUEIRO', 15, 28),
(50, 'SERGIO BUSQUETS', 29, 'MEIA', 5, 28),
(51, 'ANDRES INIESTA', 34, 'MEIA', 6, 28),
(52, 'DAVID SILVA', 32, 'ATACANTE', 21, 28),
(53, 'THIAGO', 27, 'MEIA', 10, 28),
(54, 'FERNANDO MUSLERA', 31, 'GOLEIRO', 1, 32),
(55, 'JOSE GIMENEZ', 23, 'ZAGUEIRO', 2, 32),
(56, 'DIEGO GODIN', 32, 'ZAGUEIRO', 3, 32),
(57, 'CARLOS SANCHEZ', 33, 'MEIA', 5, 32),
(58, 'CRISTIAN RODRIGUEZ', 32, 'MEIA', 7, 32),
(59, 'LUIS SUAREZ', 31, 'ATACANTE', 9, 32),
(60, 'GIORGIAN DE ARRASCAETA', 24, 'ATACANTE', 10, 32),
(61, 'EDINSON CAVANI', 31, 'ATACANTE', 21, 32);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogos`
--

CREATE TABLE `jogos` (
  `codigo` int(11) NOT NULL,
  `selecao_a` int(11) NOT NULL,
  `selecao_b` int(11) NOT NULL,
  `gols_a` int(11) DEFAULT NULL,
  `gols_b` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `estadio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jogos`
--

INSERT INTO `jogos` (`codigo`, `selecao_a`, `selecao_b`, `gols_a`, `gols_b`, `data`, `hora`, `estadio`) VALUES
(1, 24, 25, NULL, NULL, '2018-06-14', '12:00:00', 1),
(2, 9, 32, NULL, NULL, '2018-06-15', '09:00:00', 9),
(3, 24, 9, NULL, NULL, '2018-06-19', '15:00:00', 3),
(4, 18, 14, NULL, NULL, '2018-06-15', '12:00:00', 3),
(5, 23, 28, NULL, NULL, '2018-06-15', '15:00:00', 5),
(6, 23, 18, NULL, NULL, '2018-06-20', '09:00:00', 1),
(7, 11, 2, NULL, NULL, '2018-06-16', '07:00:00', 6),
(8, 21, 8, NULL, NULL, '2018-06-16', '13:00:00', 11),
(9, 11, 21, NULL, NULL, '2018-06-21', '12:00:00', 9),
(10, 1, 13, NULL, NULL, '2018-06-16', '10:00:00', 2),
(11, 7, 19, NULL, NULL, '2018-06-16', '16:00:00', 10),
(12, 1, 7, NULL, NULL, '2018-06-21', '15:00:00', 4),
(13, 6, 27, NULL, NULL, '2018-06-17', '09:00:00', 7),
(14, 4, 30, NULL, NULL, '2018-06-17', '15:00:00', 8),
(15, 4, 6, NULL, NULL, '2018-06-22', '09:00:00', 3),
(16, 12, 17, NULL, NULL, '2018-06-17', '12:00:00', 1),
(17, 29, 16, NULL, NULL, '2018-06-18', '09:00:00', 4),
(18, 12, 29, NULL, NULL, '2018-06-23', '15:00:00', 5),
(19, 3, 20, NULL, NULL, '2018-06-18', '12:00:00', 5),
(20, 31, 10, NULL, NULL, '2018-06-18', '15:00:00', 12),
(21, 3, 31, NULL, NULL, '2018-06-23', '09:00:00', 2),
(22, 22, 26, NULL, NULL, '2018-06-19', '12:00:00', 2),
(23, 5, 15, NULL, NULL, '2018-06-19', '09:00:00', 11),
(24, 15, 26, NULL, NULL, '2018-06-24', '12:00:00', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `selecoes`
--

CREATE TABLE `selecoes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `grupo` varchar(1) NOT NULL,
  `tecnico` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `selecoes`
--

INSERT INTO `selecoes` (`codigo`, `nome`, `grupo`, `tecnico`) VALUES
(1, 'ARGENTINA', 'D', 'JORGE SAMPAOLI'),
(2, 'AUSTRALIA', 'C', 'BERT VAN MARWIJK'),
(3, 'BELGICA', 'G', 'ROBERTO MARTINEZ'),
(4, 'BRASIL', 'E', 'TITE'),
(5, 'COLÔMBIA', 'H', 'JOSÉ PÉKERMAN'),
(6, 'COSTA RICA', 'E', 'OSCAR RAMIREZ'),
(7, 'CROÁCIA', 'D', 'ZLATKO DALIC'),
(8, 'DINAMARCA', 'C', 'AGE HAREIDE'),
(9, 'EGITO', 'A', 'HÉCTOR CÚPER'),
(10, 'INGLATERRA', 'G', 'GARETH SOUTHGATE'),
(11, 'FRANÇA', 'C', 'DIDIER DESCHAMPS'),
(12, 'ALEMANHA', 'F', 'JOACHIM LOW'),
(13, 'ISLÂNDIA', 'D', 'HEIMIR HALLGRIMSSON'),
(14, 'IRÃ', 'B', 'CARLOS QUEIROZ'),
(15, 'JAPÃO', 'H', 'AKIRA NISHINO'),
(16, 'COREIA DO SUL', 'F', 'SHIN TAE-YONG'),
(17, 'MÉXICO', 'F', 'JUAN CARLOS OSORIO'),
(18, 'MARROCOS', 'B', 'HERVÉ RENARD'),
(19, 'NIGÉRIA', 'D', 'GERNOT ROHR'),
(20, 'PANAMÁ', 'G', 'HERNAN DARIO GOMEZ'),
(21, 'PERU', 'C', 'RICARDO GARECA'),
(22, 'POLÔNIA', 'H', 'ADAM NAWALKA'),
(23, 'PORTUGAL', 'B', 'FERNANDO SANTOS'),
(24, 'RÚSSIA', 'A', 'STANISLAV CHERCHESOV'),
(25, 'ARÁBIA SAUDITA', 'A', 'JUAN ANTONIO PIZZI'),
(26, 'SENEGAL', 'H', 'ALIOU CISSÉ'),
(27, 'SÉRVIA', 'E', 'MLADEN KRSTAJIC'),
(28, 'ESPANHA', 'B', 'JULEN LOPETEGUI'),
(29, 'SUÉCIA', 'F', 'JANNE ANDERSSON'),
(30, 'SUÍÇA', 'E', 'VLADIMIR PETKOVIC'),
(31, 'TUNÍSIA', 'G', 'NABIL MAÂLOUL'),
(32, 'URUGUAI', 'A', 'OSCAR WASHINGTON TABAREZ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estadios`
--
ALTER TABLE `estadios`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `jogadores`
--
ALTER TABLE `jogadores`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `selecao_fk` (`selecao`);

--
-- Indexes for table `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `selecao_a_fk` (`selecao_a`),
  ADD KEY `selecao_b_fk` (`selecao_b`),
  ADD KEY `estadio_fk` (`estadio`);

--
-- Indexes for table `selecoes`
--
ALTER TABLE `selecoes`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estadios`
--
ALTER TABLE `estadios`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jogadores`
--
ALTER TABLE `jogadores`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `jogos`
--
ALTER TABLE `jogos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `selecoes`
--
ALTER TABLE `selecoes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `jogadores`
--
ALTER TABLE `jogadores`
  ADD CONSTRAINT `selecao_fk` FOREIGN KEY (`selecao`) REFERENCES `selecoes` (`codigo`);

--
-- Limitadores para a tabela `jogos`
--
ALTER TABLE `jogos`
  ADD CONSTRAINT `estadio_fk` FOREIGN KEY (`estadio`) REFERENCES `estadios` (`codigo`),
  ADD CONSTRAINT `selecao_a_fk` FOREIGN KEY (`selecao_a`) REFERENCES `selecoes` (`codigo`),
  ADD CONSTRAINT `selecao_b_fk` FOREIGN KEY (`selecao_b`) REFERENCES `selecoes` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

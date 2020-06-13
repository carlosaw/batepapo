-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 13-Jun-2020 às 19:23
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `batepapo1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'Geral'),
(2, 'Testes'),
(3, 'Desenvolvimento'),
(4, 'Criada via Sistema'),
(5, 'Teste 2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `date_msg` datetime NOT NULL,
  `msg` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `messages`
--

INSERT INTO `messages` (`id`, `id_user`, `id_group`, `date_msg`, `msg`) VALUES
(1, 2, 4, '2020-06-10 22:20:16', 'oi'),
(2, 2, 3, '2020-06-10 22:24:26', 'Mensagem de desenvolvimento'),
(3, 2, 3, '2020-06-10 22:25:25', 'Mensagem de agradecimento'),
(4, 2, 2, '2020-06-10 22:35:31', 'Boa noite!'),
(5, 2, 4, '2020-06-11 10:33:20', 'testando 123'),
(6, 2, 4, '2020-06-11 10:51:27', 'testando 123'),
(7, 2, 4, '2020-06-11 10:54:57', 'Testando 123'),
(8, 2, 3, '2020-06-11 10:57:06', 'Testando456'),
(9, 2, 4, '2020-06-11 11:01:18', 'Testando 678'),
(10, 2, 4, '2020-06-11 11:07:25', 'Testando'),
(11, 2, 4, '2020-06-11 14:20:16', 'OlÃ¡'),
(12, 2, 4, '2020-06-11 14:23:01', 'OlaÂ´'),
(13, 2, 4, '2020-06-11 14:23:39', 'Ola'),
(14, 2, 3, '2020-06-11 14:29:59', 'Ola de novo'),
(15, 2, 3, '2020-06-11 14:30:43', 'Boa tarde'),
(16, 2, 3, '2020-06-11 14:42:38', 'Enviando msg'),
(17, 2, 3, '2020-06-11 14:43:51', 'Enter'),
(18, 2, 4, '2020-06-11 15:01:40', 'Pelo edge'),
(19, 2, 4, '2020-06-11 15:05:33', 'Tarde'),
(20, 2, 4, '2020-06-11 15:13:31', 'Ola'),
(21, 2, 4, '2020-06-11 15:16:47', 'Pronto'),
(22, 2, 3, '2020-06-11 15:20:17', 'ALOHA'),
(23, 2, 3, '2020-06-11 15:23:10', 'Qualquerr'),
(24, 2, 4, '2020-06-11 15:50:41', 'mensagem eventual'),
(25, 2, 4, '2020-06-11 15:52:11', 'Eventual msg'),
(26, 2, 4, '2020-06-11 16:56:03', 'Mensagem enviada'),
(27, 2, 4, '2020-06-11 16:58:06', 'Mensagem'),
(28, 2, 4, '2020-06-11 17:02:07', 'Mandando bem'),
(29, 2, 4, '2020-06-11 17:27:53', 'Apelando'),
(30, 2, 4, '2020-06-11 17:40:46', 'Ultima mensagem'),
(31, 2, 3, '2020-06-11 17:45:08', 'Desenvolve'),
(32, 2, 4, '2020-06-11 20:06:37', 'Alguma mensagem'),
(33, 2, 4, '2020-06-11 20:08:19', 'Sua mensagem'),
(34, 2, 3, '2020-06-11 20:09:46', 'Desnvolveimento 2'),
(35, 2, 4, '2020-06-11 21:27:14', 'Criando msg'),
(36, 2, 4, '2020-06-12 09:09:39', 'Cartagema'),
(37, 2, 4, '2020-06-12 10:45:52', 'gula'),
(38, 2, 4, '2020-06-12 10:46:23', 'carlos'),
(39, 2, 4, '2020-06-12 10:48:34', 'cahat'),
(40, 2, 4, '2020-06-12 10:53:29', 'Cantando'),
(41, 2, 4, '2020-06-12 10:55:44', 'Garnd'),
(42, 2, 4, '2020-06-12 11:03:09', 'Garantido no'),
(43, 2, 4, '2020-06-12 11:03:42', 'Garantido'),
(44, 2, 4, '2020-06-12 11:05:19', 'Qualeur'),
(45, 2, 4, '2020-06-12 11:09:25', 'go'),
(46, 2, 4, '2020-06-12 11:14:22', 'aqui'),
(47, 2, 4, '2020-06-12 11:18:25', 'algo'),
(48, 2, 4, '2020-06-12 11:19:11', 'Aquilo outro'),
(49, 2, 4, '2020-06-12 14:46:15', 'Aquele'),
(50, 2, 4, '2020-06-12 14:59:53', 'criando'),
(51, 2, 4, '2020-06-12 15:00:16', 'criando'),
(52, 2, 4, '2020-06-12 15:26:48', 'Criando sistema'),
(53, 2, 4, '2020-06-12 15:27:46', 'Mensagem...'),
(54, 2, 3, '2020-06-12 15:34:44', 'Grampo'),
(55, 2, 4, '2020-06-12 15:39:53', 'Aqiupppadsas'),
(56, 2, 4, '2020-06-12 15:40:17', 'asldasjasÃ£sd'),
(57, 2, 4, '2020-06-12 15:57:38', 'Outrma mensagem'),
(58, 2, 4, '2020-06-12 16:03:54', 'Com dois pontos'),
(59, 2, 3, '2020-06-12 16:05:46', 'Get_messagens'),
(60, 2, 1, '2020-06-12 16:17:51', 'testando de noveo'),
(61, 2, 4, '2020-06-12 16:25:17', 'candidade'),
(62, 2, 3, '2020-06-12 16:28:08', 'Cacete'),
(63, 2, 4, '2020-06-12 16:31:58', 'Groups'),
(64, 2, 4, '2020-06-12 16:47:25', 'Quando'),
(65, 2, 3, '2020-06-12 16:49:38', 'Fechando'),
(66, 2, 4, '2020-06-12 21:08:02', 'ola'),
(67, 2, 4, '2020-06-12 22:13:53', 'aaa'),
(68, 2, 3, '2020-06-12 22:17:23', 'aasdas'),
(69, 2, 4, '2020-06-12 22:35:55', 'Testando de novo'),
(70, 2, 1, '2020-06-12 22:36:31', 'Caraca'),
(71, 2, 3, '2020-06-12 22:40:43', 'chat'),
(72, 2, 3, '2020-06-12 22:43:56', 'fadara'),
(73, 2, 3, '2020-06-12 22:46:13', 'dafasadasdasd'),
(74, 2, 5, '2020-06-12 22:49:20', 'adasdasd'),
(75, 2, 1, '2020-06-12 22:51:13', 'fdasr'),
(76, 2, 3, '2020-06-12 22:52:12', 'ghtthrthrth');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `loginhash` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `pass`, `loginhash`) VALUES
(2, 'carlos', '$2y$10$nyJaMEBZx.yLXnx3Xfflte28uomwJVg8zwgYkpwJT.w2PaVUrRwfy', '6a49d133ff6623572a51f9a9d63d2a0a');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

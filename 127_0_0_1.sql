-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 22-Jul-2022 às 20:59
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pressticket`
--
CREATE DATABASE IF NOT EXISTS `pressticket` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pressticket`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contactcustomfields`
--

DROP TABLE IF EXISTS `contactcustomfields`;
CREATE TABLE IF NOT EXISTS `contactcustomfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `contactId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contactId` (`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `profilePicUrl` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `isGroup` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `number`, `profilePicUrl`, `createdAt`, `updatedAt`, `email`, `isGroup`) VALUES
(4, 'Pedrinho', '553183737980', 'https://pps.whatsapp.net/v/t61.24694-24/263117065_149556440961013_987239664882690533_n.jpg?ccb=11-4&oh=01_AVzkz76rhx357_EidGeejpsGFYVDRG-WClh70WGK30mi_w&oe=62DAB16E', '2022-07-11 14:16:20', '2022-07-11 14:16:20', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `ack` int(11) NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `mediaType` varchar(255) DEFAULT NULL,
  `mediaUrl` varchar(255) DEFAULT NULL,
  `ticketId` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) NOT NULL,
  `fromMe` tinyint(1) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `contactId` int(11) DEFAULT NULL,
  `quotedMsgId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketId` (`ticketId`),
  KEY `Messages_contactId_foreign_idx` (`contactId`),
  KEY `Messages_quotedMsgId_foreign_idx` (`quotedMsgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `messages`
--

INSERT INTO `messages` (`id`, `body`, `ack`, `read`, `mediaType`, `mediaUrl`, `ticketId`, `createdAt`, `updatedAt`, `fromMe`, `isDeleted`, `contactId`, `quotedMsgId`) VALUES
('C6C1F34A19FD0C4FA90B94B3DF1AE021', '.', 0, 1, 'chat', NULL, 4, '2022-07-11 14:16:20.156000', '2022-07-11 14:16:20.182000', 0, 0, 4, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `queues`
--

DROP TABLE IF EXISTS `queues`;
CREATE TABLE IF NOT EXISTS `queues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `greetingMessage` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `startWork` varchar(255) DEFAULT NULL,
  `endWork` varchar(255) DEFAULT NULL,
  `absenceMessage` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `color` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `queues`
--

INSERT INTO `queues` (`id`, `name`, `color`, `greetingMessage`, `createdAt`, `updatedAt`, `startWork`, `endWork`, `absenceMessage`) VALUES
(1, 'Comunicação e Informática', '#0000ff', 'Você está na fila para ser atendido na Grande Secretaria de Comunicação e Informática. Digite aqui como podemos te ajudar!', '2022-07-11 13:36:49', '2022-07-11 13:36:49', '09:00', '17:30', 'Não estamos disponíveis no momento! Nosso atendimento é de 9:00 as 17:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quickanswers`
--

DROP TABLE IF EXISTS `quickanswers`;
CREATE TABLE IF NOT EXISTS `quickanswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortcut` text NOT NULL,
  `message` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE IF NOT EXISTS `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20200717133438-create-users.js'),
('20200717144403-create-contacts.js'),
('20200717145643-create-tickets.js'),
('20200717151645-create-messages.js'),
('20200717170223-create-whatsapps.js'),
('20200723200315-create-contacts-custom-fields.js'),
('20200723202116-add-email-field-to-contacts.js'),
('20200730153237-remove-user-association-from-messages.js'),
('20200730153545-add-fromMe-to-messages.js'),
('20200813114236-change-ticket-lastMessage-column-type.js'),
('20200901235509-add-profile-column-to-users.js'),
('20200903215941-create-settings.js'),
('20200904220257-add-name-to-whatsapp.js'),
('20200906122228-add-name-default-field-to-whatsapp.js'),
('20200906155658-add-whatsapp-field-to-tickets.js'),
('20200919124112-update-default-column-name-on-whatsappp.js'),
('20200927220708-add-isDeleted-column-to-messages.js'),
('20200929145451-add-user-tokenVersion-column.js'),
('20200930162323-add-isGroup-column-to-tickets.js'),
('20200930194808-add-isGroup-column-to-contacts.js'),
('20201004150008-add-contactId-column-to-messages.js'),
('20201004155719-add-vcardContactId-column-to-messages.js'),
('20201004955719-remove-vcardContactId-column-to-messages.js'),
('20201026215410-add-retries-to-whatsapps.js'),
('20201028124427-add-quoted-msg-to-messages.js'),
('20210108001431-add-unreadMessages-to-tickets.js'),
('20210108164404-create-queues.js'),
('20210108164504-add-queueId-to-tickets.js'),
('20210108174594-associate-whatsapp-queue.js'),
('20210108204708-associate-users-queue.js'),
('20210109192513-add-greetingMessage-to-whatsapp.js'),
('20210818102605-create-quickAnswers.js'),
('20211016014719-add-farewellMessage-to-whatsapp.js'),
('20220223095932-add-whatsapp-to-user.js'),
('20220619203200-add-startwork-queues.js'),
('20220619203500-add-endwork-queues.js'),
('20220619203900-add-absencemessage-queues.js');

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`key`, `value`, `createdAt`, `updatedAt`) VALUES
('call', 'disabled', '2022-07-11 12:00:49', '2022-07-11 12:00:49'),
('CheckMsgIsGroup', 'enabled', '2022-07-11 12:00:49', '2022-07-11 12:00:49'),
('closeTicketApi', 'disabled', '2022-07-11 12:00:49', '2022-07-11 13:51:14'),
('darkMode', 'disabled', '2022-07-11 12:00:49', '2022-07-11 12:49:09'),
('sideMenu', 'enabled', '2022-07-11 12:00:49', '2022-07-11 14:05:18'),
('timeCreateNewTicket', '30', '2022-07-11 12:00:49', '2022-07-11 14:05:29'),
('userApiToken', '04744efe-b99c-4885-ad0e-d87f5305b171', '2022-07-11 12:00:49', '2022-07-11 12:00:49'),
('userCreation', 'enabled', '2022-07-11 12:00:49', '2022-07-11 12:00:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `lastMessage` text,
  `contactId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) NOT NULL,
  `whatsappId` int(11) DEFAULT NULL,
  `isGroup` tinyint(1) NOT NULL DEFAULT '0',
  `unreadMessages` int(11) DEFAULT NULL,
  `queueId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contactId` (`contactId`),
  KEY `userId` (`userId`),
  KEY `Tickets_whatsappId_foreign_idx` (`whatsappId`),
  KEY `Tickets_queueId_foreign_idx` (`queueId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tickets`
--

INSERT INTO `tickets` (`id`, `status`, `lastMessage`, `contactId`, `userId`, `createdAt`, `updatedAt`, `whatsappId`, `isGroup`, `unreadMessages`, `queueId`) VALUES
(4, 'pending', '.', 4, NULL, '2022-07-11 14:16:20.000000', '2022-07-11 14:16:20.000000', 3, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `userqueues`
--

DROP TABLE IF EXISTS `userqueues`;
CREATE TABLE IF NOT EXISTS `userqueues` (
  `userId` int(11) NOT NULL,
  `queueId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`userId`,`queueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'admin',
  `tokenVersion` int(11) NOT NULL DEFAULT '0',
  `whatsappId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `Users_whatsappId_foreign_idx` (`whatsappId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `passwordHash`, `createdAt`, `updatedAt`, `profile`, `tokenVersion`, `whatsappId`) VALUES
(1, 'Press-Ticket', 'admin@pressticket.com.br', '$2a$08$WaEmpmFDD/XkDqorkpQ42eUZozOqRCPkPcTkmHHMyuTGUOkI8dHsq', '2022-07-11 12:00:49', '2022-07-11 12:00:49', 'admin', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `whatsappqueues`
--

DROP TABLE IF EXISTS `whatsappqueues`;
CREATE TABLE IF NOT EXISTS `whatsappqueues` (
  `whatsappId` int(11) NOT NULL,
  `queueId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`whatsappId`,`queueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `whatsappqueues`
--

INSERT INTO `whatsappqueues` (`whatsappId`, `queueId`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2022-07-11 13:37:42', '2022-07-11 13:37:42'),
(2, 1, '2022-07-11 13:52:48', '2022-07-11 13:52:48'),
(3, 1, '2022-07-11 14:06:14', '2022-07-11 14:06:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `whatsapps`
--

DROP TABLE IF EXISTS `whatsapps`;
CREATE TABLE IF NOT EXISTS `whatsapps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` text,
  `qrcode` text,
  `status` varchar(255) DEFAULT NULL,
  `battery` varchar(255) DEFAULT NULL,
  `plugged` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `greetingMessage` text,
  `farewellMessage` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `whatsapps`
--

INSERT INTO `whatsapps` (`id`, `session`, `qrcode`, `status`, `battery`, `plugged`, `createdAt`, `updatedAt`, `name`, `isDefault`, `retries`, `greetingMessage`, `farewellMessage`) VALUES
(3, NULL, '', 'CONNECTED', NULL, NULL, '2022-07-11 14:06:14', '2022-07-11 14:40:52', 'gobteste', 1, 0, 'teste', 'teste');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `contactcustomfields`
--
ALTER TABLE `contactcustomfields`
  ADD CONSTRAINT `contactcustomfields_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `Messages_contactId_foreign_idx` FOREIGN KEY (`contactId`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Messages_quotedMsgId_foreign_idx` FOREIGN KEY (`quotedMsgId`) REFERENCES `messages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`ticketId`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `Tickets_queueId_foreign_idx` FOREIGN KEY (`queueId`) REFERENCES `queues` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Tickets_whatsappId_foreign_idx` FOREIGN KEY (`whatsappId`) REFERENCES `whatsapps` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Users_whatsappId_foreign_idx` FOREIGN KEY (`whatsappId`) REFERENCES `whatsapps` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Banco de dados: `suporte`
--
CREATE DATABASE IF NOT EXISTS `suporte` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `suporte`;
--
-- Banco de dados: `ticketsci`
--
CREATE DATABASE IF NOT EXISTS `ticketsci` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ticketsci`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assunto` varchar(100) NOT NULL,
  `mensagem` varchar(900) NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `nomeuser` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tickets`
--

INSERT INTO `tickets` (`id`, `assunto`, `mensagem`, `situacao`, `nomeuser`) VALUES
(1, 'Email não abre corretamente', 'mensagens de Email não abrem de forma correta', 'ativo', 'pedro.leonel'),
(2, 'Word parou de funcionar', 'Aplicativo do pacote office não funciona mais quando clico para abrir', 'encerrado', 'pedro.leonel'),
(3, 'Sem acesso a pastas compartilhadas', 'Sem acesso as pastas compartilhadas do gobmg, favor resolver', 'ativo', 'pedro.leonel'),
(4, 'Impressora pegou fogo', 'Tá pegando fogo bixo!', 'ativo', 'pedro.leonel'),
(5, 'Computador explodiu', 'Chama o samu!!!! teu cu!', 'ativo', 'pedro.leonel'),
(6, 'Quem preencheu foi thiago', 'thiago andrade esteve aqui, o meu nome é thiago andrade...', 'ativo', 'thiago.andrade'),
(7, 'dsada', 'sdasd', 'ativo', 'thiago.andrade'),
(8, 'computador saiu voando', 'saiu voando pela janela', 'ativo', 'pedro.leonel'),
(9, 'Compra máquinas', 'Cadastro impressora', 'ativo', 'pedro.leonel'),
(10, 'Não consigo imprimir', 'ir onde o vento for...', 'ativo', 'pedro.leonel'),
(11, 'paulera pediu ajuda', 'me ajude', 'ativo', 'pedro.leonel'),
(12, 'computador com virus', 'muie pelada aparecendo toda hora', 'ativo', 'pedro.leonel'),
(13, 'Impressora pegou fogo de novo', 'extintor acabou, to indo na araujo comprar outro', 'ativo', 'pedro.leonel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `email` varchar(90) NOT NULL,
  `setor` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `senha`, `email`, `setor`) VALUES
(1, 'pedro.leonel', '1234', 'teste@teste.com', 'teste'),
(2, 'thiago.andrade', '1234', 'thiago.andrade@gobmg.org.br', 'comunicacao');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

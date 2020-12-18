-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Dez-2020 às 16:30
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_job`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `job`
--

CREATE TABLE `job` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_date` date NOT NULL,
  `finished_in` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `job`
--

INSERT INTO `job` (`id`, `id_user`, `status`, `name`, `description`, `delivery_date`, `finished_in`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 'Sistema de tarefas', 'Crud de usuário e tarefa', '2020-12-18', '2020-12-17', '2020-12-18 01:01:14', '2020-12-18 02:32:55'),
(4, 1, 2, 'Documentação do sistema', 'Documentação do sistema', '2020-12-17', '2020-12-18', '2020-12-18 04:22:45', '2020-12-18 04:23:19'),
(5, 11, 2, 'teste', 'teste teste teste teste', '2020-12-17', '2020-12-18', '2020-12-18 05:38:18', '2020-12-18 05:41:35'),
(6, NULL, 1, 'teste 2', 'teste teste teste', '2020-12-18', NULL, '2020-12-18 18:11:22', '2020-12-18 18:11:22'),
(7, NULL, 1, 'teste 3', 'teste teste teste', '2020-12-18', NULL, '2020-12-18 18:11:35', '2020-12-18 18:11:35'),
(8, NULL, 1, 'teste 4', 'teste teste', '2020-12-18', NULL, '2020-12-18 18:11:45', '2020-12-18 18:11:45'),
(9, NULL, 1, 'teste 5', 'testes teste', '2020-12-18', NULL, '2020-12-18 18:12:15', '2020-12-18 18:12:15'),
(10, NULL, 1, 'testes teste', 'testes teste', '2020-12-18', NULL, '2020-12-18 18:12:25', '2020-12-18 18:12:25'),
(11, NULL, 1, 'testes 6', 'testes teste', '2020-12-18', NULL, '2020-12-18 18:13:11', '2020-12-18 18:13:11'),
(12, NULL, 1, 'testes 7', 'testes teste', '2020-12-18', NULL, '2020-12-18 18:13:19', '2020-12-18 18:13:19'),
(13, NULL, 1, 'testes 8', 'testes teste', '2020-12-18', NULL, '2020-12-18 18:13:28', '2020-12-18 18:13:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(32, 'default', '{\"uuid\":\"3f584b6b-0e1e-4f06-a7b0-4d8f845f31fe\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:5:\\\"teste\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:23:\\\"teste teste teste teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:34:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/5\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608259099, 1608259099),
(33, 'default', '{\"uuid\":\"803319de-1f94-4108-860a-81dabe0f98ca\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:14:\\\"Job Atualizado\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:5:\\\"teste\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:54:\\\"Job Concluido por Antonio Barra em 2020-12-18 02:41:35\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:34:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/5\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608259295, 1608259295),
(34, 'default', '{\"uuid\":\"64693dca-9e33-4b43-8ec9-ebeb3be7b280\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:7:\\\"teste 2\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:17:\\\"teste teste teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:34:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/6\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608304282, 1608304282),
(35, 'default', '{\"uuid\":\"c64639c3-7193-4e39-8340-825e9b72dc83\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:7:\\\"teste 3\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:17:\\\"teste teste teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:34:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/7\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608304295, 1608304295),
(36, 'default', '{\"uuid\":\"9c36f3d6-76aa-4f64-b02a-5cc5f5fcdc38\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:7:\\\"teste 4\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:11:\\\"teste teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:34:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/8\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608304305, 1608304305),
(37, 'default', '{\"uuid\":\"4f8aa4fe-c8b2-4c69-8971-131c4cc61692\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:7:\\\"teste 5\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:12:\\\"testes teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:34:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/9\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608304335, 1608304335),
(38, 'default', '{\"uuid\":\"9b9a95e0-aac8-4d61-a386-ea121c7d3f83\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:12:\\\"testes teste\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:12:\\\"testes teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:35:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/10\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608304345, 1608304345),
(39, 'default', '{\"uuid\":\"d919745c-cc6e-4f0d-b77f-628be03ade46\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:8:\\\"testes 6\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:12:\\\"testes teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:35:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/11\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608304391, 1608304391),
(40, 'default', '{\"uuid\":\"354c4d28-87f2-4775-bef9-89abdcb3cd3c\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:8:\\\"testes 7\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:12:\\\"testes teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:35:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/12\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608304399, 1608304399),
(41, 'default', '{\"uuid\":\"d6162c03-5c38-4cf0-bab9-d7085628ba3d\",\"displayName\":\"App\\\\Mail\\\\MailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":\"\",\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":12:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\MailJob\\\":32:{s:31:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000subjectMatter\\\";s:8:\\\"Novo Job\\\";s:23:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000title\\\";s:8:\\\"testes 8\\\";s:29:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000description\\\";s:12:\\\"testes teste\\\";s:22:\\\"\\u0000App\\\\Mail\\\\MailJob\\u0000link\\\";s:35:\\\"http:\\/\\/localhost:8080\\/#\\/job\\/13\\/show\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:0:{}s:2:\\\"cc\\\";a:2:{i:0;a:2:{s:4:\\\"name\\\";s:14:\\\"Antonio Junior\\\";s:7:\\\"address\\\";s:27:\\\"antoniojuniorti98@gmail.com\\\";}i:1;a:2:{s:4:\\\"name\\\";s:13:\\\"Antonio Barra\\\";s:7:\\\"address\\\";s:23:\\\"barrajunior62@gmail.com\\\";}}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1608304408, 1608304408);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2020_12_12_211435_create_jobs_table', 2),
(61, '2014_10_12_000000_create_users_table', 3),
(62, '2014_10_12_100000_create_password_resets_table', 3),
(63, '2019_08_19_000000_create_failed_jobs_table', 3),
(64, '2020_12_12_211435_create_job_table', 3),
(65, '2020_12_17_144537_create_jobs_table', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Antonio Junior', 'antoniojuniorti98@gmail.com', '$2y$10$Sp7jtHdAcbBYjvFWi8ou3eeSFD0pw0U1RxSgJdcnho08J4rjNqIQy', '2020-12-17 18:36:28', '2020-12-17 18:36:28'),
(11, 'Antonio Barra', 'barrajunior62@gmail.com', '$2y$10$112inmsNxkcZyuGss5pY3eDkBuyxXiRBTaxcdV79LsIloFdwGEglq', '2020-12-18 02:15:46', '2020-12-18 02:16:49');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `job`
--
ALTER TABLE `job`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

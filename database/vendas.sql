-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 13-Dez-2023 às 19:56
-- Versão do servidor: 5.7.22
-- versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Eletrônicos', '2023-12-13 11:40:52', '2023-12-13 17:43:28'),
(2, 'Beleza', '2023-12-13 12:43:05', '2023-12-13 17:43:35'),
(4, 'Fitness', '2023-12-13 17:44:11', '2023-12-13 17:44:11'),
(5, 'Saúde', '2023-12-13 18:07:44', '2023-12-13 18:07:44');

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
(1, '2023_12_13_021304_create_categorias_table', 1),
(2, '2023_12_13_021430_create_produtos_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estoque` int(11) NOT NULL,
  `preco` double(8,2) NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `estoque`, `preco`, `categoria_id`, `created_at`, `updated_at`) VALUES
(2, 'Maquiagem', 100, 80.00, 2, '2023-12-13 16:55:43', '2023-12-13 18:03:51'),
(3, 'Tênis', 100, 200.00, 2, '2023-12-13 17:19:43', '2023-12-13 18:04:01'),
(5, 'Play 5', 100, 2000.00, 1, '2023-12-13 18:03:20', '2023-12-13 18:03:20'),
(6, 'SmartWatch Connect', 200, 200.00, 1, '2023-12-13 18:09:50', '2023-12-13 18:09:50'),
(7, 'Fones de Ouvido SonicX', 100, 150.00, 1, '2023-12-13 18:10:03', '2023-12-13 18:10:03'),
(8, 'Câmera Digital VisionPro', 100, 250.00, 1, '2023-12-13 18:10:18', '2023-12-13 18:10:18'),
(9, 'Secador de Cabelo SilkWave', 100, 90.00, 2, '2023-12-13 18:10:36', '2023-12-13 18:10:36'),
(10, 'Perfume Elegance Essence', 100, 300.00, 2, '2023-12-13 18:10:51', '2023-12-13 18:10:51'),
(11, 'Barbeador Elétrico PrecisionTrim', 300, 150.00, 2, '2023-12-13 18:11:12', '2023-12-13 18:11:12'),
(12, 'Esteira CardioFlex Pro', 100, 2000.00, 4, '2023-12-13 18:11:33', '2023-12-13 18:11:33'),
(13, 'Bicicleta Ergomotion Elite', 100, 2000.00, 4, '2023-12-13 18:11:45', '2023-12-13 18:11:45'),
(14, 'Garrafa Térmica HydrateTech', 100, 150.00, 4, '2023-12-13 18:12:01', '2023-12-13 18:12:01'),
(15, 'Nebulizador BreatheEasy', 100, 200.00, 5, '2023-12-13 18:12:16', '2023-12-13 18:12:16'),
(16, 'Balança Inteligente BodySync', 100, 160.00, 5, '2023-12-13 18:12:28', '2023-12-13 18:12:28'),
(17, 'Termômetro Digital TempSense', 100, 200.00, 5, '2023-12-13 18:12:40', '2023-12-13 18:12:40'),
(18, 'Almofada Ergonômica ComfortRest', 100, 200.00, 5, '2023-12-13 18:13:00', '2023-12-13 18:13:00'),
(22, 'Xbox 9', 200, 3000.00, 1, '2023-12-13 19:35:06', '2023-12-13 19:35:06');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtos_categoria_id_foreign` (`categoria_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/10/2025 às 20:56
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `portal_anuncios`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(25) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `anuncios`
--

CREATE TABLE `anuncios` (
  `id_anuncio` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_plano` int(11) DEFAULT NULL,
  `titulo` varchar(225) NOT NULL,
  `conteudo` text NOT NULL,
  `tipo_midia` enum('imagem','video') NOT NULL,
  `url_midia` varchar(225) NOT NULL,
  `link_destino` varchar(225) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_expiracao` datetime DEFAULT NULL,
  `status_pagamento` enum('pendente','pago','cancelado') NOT NULL,
  `status_veiculacao` enum('fila','ativo','finalizado') NOT NULL,
  `prioridade_fila` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT NULL,
  `notificado_fim_plano` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `hex_cor` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clik_anuncios`
--

CREATE TABLE `clik_anuncios` (
  `id_clique` int(11) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `ip_origem` varchar(45) DEFAULT NULL,
  `id_anuncio` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL,
  `nome_empresa` varchar(100) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `nome_contato` varchar(100) NOT NULL,
  `cpf_contato` varchar(14) DEFAULT NULL,
  `telefone_contato` varchar(20) NOT NULL,
  `email_contato` varchar(100) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `status` enum('ativo','inativo') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `interesses_anuncios`
--

CREATE TABLE `interesses_anuncios` (
  `id_interesse` int(11) NOT NULL,
  `plano_interesse` varchar(50) NOT NULL,
  `mensagem` text DEFAULT NULL,
  `data_registro` datetime DEFAULT NULL,
  `status_contratante` enum('novo','contatado','convertido','descartado') DEFAULT NULL,
  `id_anuncio` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login_acesso`
--

CREATE TABLE `login_acesso` (
  `id_log` int(11) NOT NULL,
  `tipo_evento` varchar(50) DEFAULT NULL,
  `id_referencia` int(11) DEFAULT NULL,
  `url_acessada` varchar(225) DEFAULT NULL,
  `ip_origem` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticias`
--

CREATE TABLE `noticias` (
  `id_noticia` int(11) NOT NULL,
  `titulo` varchar(225) NOT NULL,
  `slug_url` varchar(225) DEFAULT NULL,
  `descricao_curta` text NOT NULL,
  `conteudo_completo` text NOT NULL,
  `imagem_url` varchar(225) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `data_expiracao` datetime DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT NULL,
  `visualizacoes` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos_anuncios`
--

CREATE TABLE `planos_anuncios` (
  `id_plano` int(11) NOT NULL,
  `nome_plano` varchar(225) NOT NULL,
  `descricao` text NOT NULL,
  `durac_plano` int(11) DEFAULT NULL,
  `valor` decimal(10,0) NOT NULL,
  `anuncio_simultaneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(20) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vídeos`
--

CREATE TABLE `vídeos` (
  `id_video` int(11) NOT NULL,
  `titulo` varchar(225) NOT NULL,
  `url_video` varchar(225) NOT NULL,
  `thumbnail_url` varchar(225) DEFAULT NULL,
  `duracao_video` varchar(20) NOT NULL,
  `descricao_completa` text NOT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `visualizacoes` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `data_expiracao` datetime DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha_hash` (`senha_hash`),
  ADD KEY `fk_admin_usuario` (`id_usuario`);

--
-- Índices de tabela `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`id_anuncio`),
  ADD KEY `fk_anuncio_empresa` (`id_empresa`),
  ADD KEY `fk_anuncio_plano` (`id_plano`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `clik_anuncios`
--
ALTER TABLE `clik_anuncios`
  ADD PRIMARY KEY (`id_clique`),
  ADD KEY `fk_clique_anuncio` (`id_anuncio`),
  ADD KEY `fk_clique_usuario` (`id_usuario`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Índices de tabela `interesses_anuncios`
--
ALTER TABLE `interesses_anuncios`
  ADD PRIMARY KEY (`id_interesse`);

--
-- Índices de tabela `login_acesso`
--
ALTER TABLE `login_acesso`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `fk_login_usuario` (`id_referencia`);

--
-- Índices de tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`),
  ADD KEY `fk_noticia_categoria` (`id_categoria`);

--
-- Índices de tabela `planos_anuncios`
--
ALTER TABLE `planos_anuncios`
  ADD PRIMARY KEY (`id_plano`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha_hash` (`senha_hash`);

--
-- Índices de tabela `vídeos`
--
ALTER TABLE `vídeos`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `fk_video_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `id_anuncio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clik_anuncios`
--
ALTER TABLE `clik_anuncios`
  MODIFY `id_clique` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `interesses_anuncios`
--
ALTER TABLE `interesses_anuncios`
  MODIFY `id_interesse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `login_acesso`
--
ALTER TABLE `login_acesso`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id_noticia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `planos_anuncios`
--
ALTER TABLE `planos_anuncios`
  MODIFY `id_plano` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vídeos`
--
ALTER TABLE `vídeos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_admin_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `anuncios`
--
ALTER TABLE `anuncios`
  ADD CONSTRAINT `fk_anuncio_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_anuncio_plano` FOREIGN KEY (`id_plano`) REFERENCES `planos_anuncios` (`id_plano`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `clik_anuncios`
--
ALTER TABLE `clik_anuncios`
  ADD CONSTRAINT `fk_clique_anuncio` FOREIGN KEY (`id_anuncio`) REFERENCES `anuncios` (`id_anuncio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_clique_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `login_acesso`
--
ALTER TABLE `login_acesso`
  ADD CONSTRAINT `fk_login_usuario` FOREIGN KEY (`id_referencia`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `fk_noticia_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `vídeos`
--
ALTER TABLE `vídeos`
  ADD CONSTRAINT `fk_video_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

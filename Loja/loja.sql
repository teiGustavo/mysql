DROP DATABASE IF EXISTS loja;
CREATE DATABASE IF NOT EXISTS loja;
USE loja;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `codigo_categoria` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`codigo_categoria`, `nome`, `data_cadastro`) VALUES
(1, 'Automotivo', '2023-05-02 20:57:04'),
(2, 'Bebês', '2023-05-02 20:57:04'),
(3, 'Brinquedos e Jogos', '2023-05-02 20:57:04'),
(4, 'Computadores e Informática', '2023-05-02 20:57:04'),
(5, 'Games e Consoles', '2023-05-02 20:57:04'),
(6, 'Livros', '2023-05-02 20:57:04'),
(7, 'Pet Shop', '2023-05-02 20:57:04'),
(8, 'Roupas, Calçados e Acessórios', '2023-05-02 20:57:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `datanasc` date DEFAULT NULL,
  `datacadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cpf`, `nome`, `email`, `usuario`, `senha`, `datanasc`, `datacadastro`) VALUES
('21400922100', 'Martim Ribeiro Araujo', 'MartimRibeiroAraujo@rhyta.com', 'Sibes1987', 'dai7uuMem', '1987-01-20', '2023-05-02 21:22:55'),
('34973233498', 'Antônio Cunha Sousa', 'AntonioCunhaSousa@teleworm.us', 'Thel1994', 'jahFaez0iP5M', '1994-09-20', '2023-05-02 21:22:55'),
('54648909470', 'Clara Cavalcanti Lima', 'ClaraCavalcantiLima@armyspy.com', 'Sainigh', 'Thaik9aech', '1976-04-05', '2023-05-02 21:22:55'),
('56308076503', 'Larissa Almeida Castro', 'LarissaAlmeidaCastro@armyspy.com', 'Looris', 'aeZaiqu9ooSh', '1996-09-21', '2023-05-02 21:22:55'),
('64081767475', 'Arthur Souza Costa', 'ArthurSouzaCosta@teleworm.us', 'Twoulair', 'chuXeig0ees', '1978-05-27', '2023-05-02 21:22:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `formas_pagamentos`
--

CREATE TABLE `formas_pagamentos` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `datacadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `formas_pagamentos`
--

INSERT INTO `formas_pagamentos` (`codigo`, `descricao`, `datacadastro`) VALUES
(1, 'Dinheiro', '2023-05-02 21:23:49'),
(2, 'Cartão de Crédito', '2023-05-02 21:23:49'),
(3, 'Cartão de Débito', '2023-05-02 21:23:49'),
(4, 'PIX', '2023-05-02 21:23:49'),
(5, 'Transferência Bancária', '2023-05-02 21:23:49'),
(6, 'Cheque', '2023-05-02 21:23:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `codigo_produto` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `categoria` int(11) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`codigo_produto`, `nome`, `preco`, `quantidade`, `categoria`, `data_cadastro`) VALUES
(1, 'Suporte Veicular Magnético 3 em 1', '73.71', 5, 1, '2023-05-02 21:00:37'),
(2, 'Pneu Goodyear Aro 14 Assurance Maxlife 175/65r14 86h', '368.90', 8, 1, '2023-05-02 21:00:37'),
(3, 'Fralda Huggies Tripla Proteção M - 92 Fraldas', '67.99', 3, 2, '2023-05-02 21:00:37'),
(4, 'NINHO Fases 1+ 800g', '42.99', 15, 2, '2023-05-02 21:14:23'),
(5, 'Pacote 5 Carros Sortidos, Hot Wheels, Mattel', '51.71', 2, 3, '2023-05-02 21:14:23'),
(6, 'Boneca Moana e Porquinho Pua Disney Cotiplás 2600', '137.90', 2, 3, '2023-05-02 21:14:23'),
(7, 'Notebook Lenovo Ultrafino IdeaPad 3 Ryzen 5 5500U 8GB 256GB SSD Prata 15.6\" Linu', '2749.89', 2, 4, '2023-05-02 21:14:23'),
(8, 'Cadeira Gamer Basica, CGR-02 - XZONE', '793.25', 6, 4, '2023-05-02 21:14:23'),
(9, 'The Last Of Us Part I - Playstation 5', '329.00', 20, 5, '2023-05-02 21:14:23'),
(10, 'Console Xbox Series S', '2129.00', 2, 5, '2023-05-02 21:14:23'),
(11, 'O pequeno príncipe', '34.95', 40, 6, '2023-05-02 21:14:23'),
(12, 'A revolução dos bichos: Um conto de fadas', '12.90', 55, 6, '2023-05-02 21:14:23'),
(13, 'Brinquedo Macaco Marrom Chalesco para Cães', '25.20', 30, 7, '2023-05-02 21:14:23'),
(14, 'PEDIGREE Ração Nutrição Essencial Carne Para Cães Adultos 10.1kg', '101.59', 4, 7, '2023-05-02 21:14:23'),
(15, 'Relógio Technos Masculino Racer Prata - 2117LDFS/1P', '339.24', 3, 8, '2023-05-02 21:17:58'),
(16, 'Moletom Canguru Masculino Raglan Divertido Nasa Geek Nerd ER_113', '179.00', 2, 8, '2023-05-02 21:17:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `codigo_usuario` int(11) NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`codigo_usuario`, `nome_completo`, `username`, `senha`, `email`, `data_cadastro`) VALUES
(1, 'Administrador do Sistema', 'admin', '123456', 'admin@gmail.com', '2023-05-02 21:33:53');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `cliente` varchar(11) NOT NULL,
  `formapgto` int(11) NOT NULL,
  `numparcelas` int(11) NOT NULL DEFAULT 1,
  `datavenda` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `cliente`, `formapgto`, `numparcelas`, `datavenda`) VALUES
(1, '21400922100', 2, 5, '2023-05-02 21:24:10'),
(2, '34973233498', 2, 12, '2023-05-02 21:24:58'),
(3, '54648909470', 1, 1, '2023-05-02 21:24:58'),
(4, '56308076503', 4, 1, '2023-05-02 21:24:58'),
(5, '21400922100', 3, 1, '2023-05-02 21:24:58'),
(6, '64081767475', 2, 3, '2023-05-02 21:24:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendasprodutos`
--

CREATE TABLE `vendasprodutos` (
  `venda` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendasprodutos`
--

INSERT INTO `vendasprodutos` (`venda`, `produto`, `valor`) VALUES
(1, 3, '67.99'),
(2, 7, '2800.00'),
(3, 16, '179.00'),
(3, 11, '30.90'),
(4, 13, '25.20'),
(5, 1, '73.71'),
(6, 5, '55.00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`codigo_categoria`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `formas_pagamentos`
--
ALTER TABLE `formas_pagamentos`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`codigo_produto`),
  ADD KEY `categoria_FK` (`categoria`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codigo_usuario`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_fk` (`cliente`),
  ADD KEY `formapgto` (`formapgto`);

--
-- Índices para tabela `vendasprodutos`
--
ALTER TABLE `vendasprodutos`
  ADD KEY `venda_fk` (`venda`),
  ADD KEY `produto_fk` (`produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `codigo_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `formas_pagamentos`
--
ALTER TABLE `formas_pagamentos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `codigo_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codigo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `categoria_FK` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`codigo_categoria`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `cliente_fk` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cpf`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formapgto` FOREIGN KEY (`formapgto`) REFERENCES `formas_pagamentos` (`codigo`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `vendasprodutos`
--
ALTER TABLE `vendasprodutos`
  ADD CONSTRAINT `produto_fk` FOREIGN KEY (`produto`) REFERENCES `produtos` (`codigo_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_fk` FOREIGN KEY (`venda`) REFERENCES `vendas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

CREATE TABLE customers (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	cpf varchar(11) NOT NULL,
	nome varchar(80) NOT NULL,
	email varchar(50) NOT NULL,
	usuario varchar(30) NOT NULL,
	senha varchar(255) NOT NULL,
	datanasc date DEFAULT NULL,
	datacadastro timestamp NOT NULL DEFAULT current_timestamp()
);
    
CREATE TABLE orders(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	numparcelas int(11) NOT NULL DEFAULT 1,
	datavenda timestamp NOT NULL DEFAULT current_timestamp(),
    cliente varchar(11) NOT NULL,
    
    formapgto int(11) NOT NULL,
    CONSTRAINT FK_FP_ORDERS
		FOREIGN KEY(formapgto)
		REFERENCES formas_pagamentos(codigo)
);

CREATE TABLE order_details (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
	venda INT NOT NULL,
	CONSTRAINT FK_VENDAS_OD
		FOREIGN KEY(venda)
		REFERENCES VENDAS(id),
	
    produto INT NOT NULL,
    CONSTRAINT FK_PRODUTOS_OD
		FOREIGN KEY(produto)
		REFERENCES PRODUTOS(codigo_produto),

	valor decimal(8,2) NOT NULL
);

INSERT INTO customers(cpf, nome, email, usuario, senha, datanasc, datacadastro) 
	SELECT * FROM clientes;

INSERT INTO orders(id, cliente, formapgto, numparcelas, datavenda) 
	SELECT * FROM vendas;

INSERT INTO order_details (venda, produto, valor)
	SELECT * FROM vendasprodutos;
    
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
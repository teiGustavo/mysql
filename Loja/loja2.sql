DROP DATABASE IF EXISTS lojas;
CREATE DATABASE IF NOT EXISTS lojas;
USE lojas;

CREATE TABLE categorias (
    codigo_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE customers (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	cpf varchar(14) NOT NULL,
	nome varchar(80) NOT NULL,
	email varchar(50) NOT NULL,
	usuario varchar(30) NOT NULL,
	senha varchar(255) NOT NULL,
	datanasc date DEFAULT NULL,
	datacadastro timestamp NOT NULL DEFAULT current_timestamp()
);

CREATE TABLE formas_pagamentos (
	codigo int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	descricao varchar(50) NOT NULL,
	datacadastro timestamp NOT NULL DEFAULT current_timestamp()
);

CREATE TABLE produtos (
  codigo_produto int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome varchar(150) NOT NULL,
  preco decimal(8,2) NOT NULL,
  quantidade int NOT NULL,
  data_cadastro timestamp NOT NULL DEFAULT current_timestamp(),
  
  categoria int DEFAULT NULL,
    CONSTRAINT FK_CATEGORIAS_PRODUTOS
		FOREIGN KEY(categoria)
		REFERENCES categorias(codigo_categoria)
);

CREATE TABLE usuarios (
  codigo_usuario int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_completo varchar(100) NOT NULL,
  username varchar(50) NOT NULL,
  senha varchar(255) NOT NULL,
  email varchar(80) NOT NULL,
  data_cadastro timestamp NOT NULL DEFAULT current_timestamp()
);
    
CREATE TABLE orders(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	numparcelas int NOT NULL DEFAULT 1,
	datavenda timestamp NOT NULL DEFAULT current_timestamp(),
    
    cliente int NOT NULL,
    CONSTRAINT FK_CUSTOMERS_ORDERS
		FOREIGN KEY(cliente)
		REFERENCES customers(id),
    
    formapgto int NOT NULL,
    CONSTRAINT FK_FP_ORDERS
		FOREIGN KEY(formapgto)
		REFERENCES formas_pagamentos(codigo)
);

CREATE TABLE order_details (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor decimal(8,2) NOT NULL DEFAULT 0.0,
    
	venda INT NOT NULL,
	CONSTRAINT FK_VENDAS_OD
		FOREIGN KEY(venda)
		REFERENCES orders(id),
	
    produto INT NOT NULL,
    CONSTRAINT FK_PRODUTOS_OD
		FOREIGN KEY(produto)
		REFERENCES produtos(codigo_produto)
);
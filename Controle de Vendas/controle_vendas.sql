DROP SCHEMA IF EXISTS controle_vendas;
CREATE SCHEMA IF NOT EXISTS controle_vendas;
USE controle_vendas;

CREATE TABLE categorias(
	cod INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao varchar(80) NOT NULL
);

CREATE TABLE produtos(
	cod INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 0) NOT NULL,
    qtdEstoque INT(11) NOT NULL
);

CREATE TABLE produtoscategorias(
	codProd INT(11) NOT NULL,
    codCat INT(11) NOT NULL,
    
    CONSTRAINT FK_PRODUTOS_PRODUTOSCATEGORIAS
		FOREIGN KEY(codProd)
		REFERENCES produtos(cod),
        
	CONSTRAINT FK_CATEGORIAS_PRODUTOSCATEGORIAS
		FOREIGN KEY(codCat)
		REFERENCES categorias(cod),
        
	PRIMARY KEY(codProd, codCat)
);

CREATE TABLE clientes(
	cpf VARCHAR(11) NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    dataNasc DATE NOT NULL,
    logradouro VARCHAR(120) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    bairro VARCHAR(60) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    estado VARCHAR(2) NOT NULL
);

CREATE TABLE telefones(
	cod INT(11) NOT NULL PRIMARY KEY,
    ddd VARCHAR(2) NOT NULL,
    numero VARCHAR(9) NOT NULL,
    
    codCli VARCHAR(11) NOT NULL,
     CONSTRAINT FK_CLIENTES_TELEFONES
		FOREIGN KEY(codCli)
		REFERENCES clientes(cpf)
);

CREATE TABLE vendas(
	cod INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	data TIMESTAMP NOT NULL,
    
    codCli VARCHAR(11) NOT NULL,
    CONSTRAINT FK_CLIENTES_VENDAS
		FOREIGN KEY(codCli)
		REFERENCES clientes(cpf)
);

CREATE TABLE vendasprodutos(
	codVen INT(11) NOT NULL,
    codProd INT(11) NOT NULL,
    valorVenda DECIMAL(13, 2) NOT NULL,
    
    CONSTRAINT FK_VENDAS_VENDASPRODUTOS
		FOREIGN KEY(codVen)
		REFERENCES vendas(cod),
        
	CONSTRAINT FK_PRODUTOS_VENDASPRODUTOS
		FOREIGN KEY(codProd)
		REFERENCES produtos(cod),
        
	PRIMARY KEY(codVen, CodProd)
);

CREATE TABLE formaspgto(
	cod INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE vendasformaspgto(
	codVen INT(11) NOT NULL,
    codPgto INT(11) NOT NULL,
    
    CONSTRAINT FK_VENDAS_VENDASFORMAPGTO
		FOREIGN KEY(codVen)
		REFERENCES vendas(cod),
        
	CONSTRAINT FK_FORMASPGTO_VENDASFORMAPGTO
		FOREIGN KEY(codPgto)
		REFERENCES formaspgto(cod),
        
	PRIMARY KEY(codVen, codPgto)
);
DROP DATABASE IF EXISTS banco_sp;
CREATE DATABASE IF NOT EXISTS banco_sp;
USE banco_exercicio2_sp;

CREATE TABLE Produtos (
    Prd_Codigo INT PRIMARY KEY,
    Prd_Descricao VARCHAR(255),
    Prd_Valor DECIMAL(10, 2),
    Prd_Status VARCHAR(50),
    Prd_Falta INT,
    Prd_Qtd_Estoque INT
);

CREATE TABLE Orcamentos (
    Orc_Codigo INT PRIMARY KEY,
    Orc_Data DATE,
    Orc_Status VARCHAR(50)
);

CREATE TABLE Orcamento_Produtos (
    Orp_Qtd INT,
    Orp_Valor DECIMAL(10, 2),
    Orp_Status VARCHAR(50),
    Orc_Codigo INT,
    Prd_Codigo INT,
    FOREIGN KEY (Orc_Codigo) REFERENCES Orcamentos(Orc_Codigo),
    FOREIGN KEY (Prd_Codigo) REFERENCES Produtos(Prd_Codigo)
);

INSERT INTO Produtos (Prd_Codigo, Prd_Descricao, Prd_Valor, Prd_Status, Prd_Falta, Prd_Qtd_Estoque)
VALUES
    (1, 'Produto A', 10.99, 'Disponível', 0, 20),
    (2, 'Produto B', 15.49, 'Disponível', 0, 15),
    (3, 'Produto C', 7.99, 'Disponível', 0, 30),
    (4, 'Produto D', 25.99, 'Disponível', 0, 10),
    (5, 'Produto E', 12.79, 'Disponível', 0, 25),
    (6, 'Produto F', 8.99, 'Disponível', 0, 40),
    (7, 'Produto G', 19.99, 'Disponível', 0, 12),
    (8, 'Produto H', 6.49, 'Disponível', 0, 35),
    (9, 'Produto I', 14.99, 'Disponível', 0, 18),
    (10, 'Produto J', 9.99, 'Disponível', 0, 22);

INSERT INTO Orcamentos (Orc_Codigo, Orc_Data, Orc_Status)
VALUES
    (1, '2023-09-14', 'Em Andamento'),
    (2, '2023-09-15', 'Concluído'),
    (3, '2023-09-16', 'Em Andamento'),
    (4, '2023-09-17', 'Concluído'),
    (5, '2023-09-18', 'Em Andamento'),
    (6, '2023-09-19', 'Em Andamento'),
    (7, '2023-09-20', 'Concluído'),
    (8, '2023-09-21', 'Em Andamento'),
    (9, '2023-09-22', 'Concluído'),
    (10, '2023-09-23', 'Em Andamento');

INSERT INTO Orcamento_Produtos (Orp_Qtd, Orp_Valor, Orp_Status, Orc_Codigo, Prd_Codigo)
VALUES
    (2, 21.98, 'Vendido', 1, 1),
    (3, 46.47, 'Vendido', 2, 2),
    (1, 7.99, 'Vendido', 3, 3),
    (4, 103.96, 'Vendido', 4, 4),
    (2, 25.58, 'Vendido', 5, 5),
    (3, 26.97, 'Vendido', 6, 6),
    (1, 19.99, 'Vendido', 7, 7),
    (2, 12.98, 'Vendido', 8, 8),
    (3, 44.97, 'Vendido', 9, 9),
    (4, 39.96, 'Vendido', 10, 10);


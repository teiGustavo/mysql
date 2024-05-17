DROP SCHEMA IF EXISTS vendas;
CREATE SCHEMA IF NOT EXISTS vendas;
USE vendas;

CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome_do_Produto VARCHAR(100),
    Descricao TEXT,
    Preco_Unitario DECIMAL(10, 2)
);

CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    Data_do_Pedido DATE,
    ID_do_Cliente INT,
    FOREIGN KEY (ID_do_Cliente) REFERENCES Clientes(ID)
);

CREATE TABLE Itens_do_Pedido (
    ID INT PRIMARY KEY,
    ID_do_Pedido INT,
    ID_do_Produto INT,
    Quantidade INT,
    FOREIGN KEY (ID_do_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_do_Produto) REFERENCES Produtos(ID)
);

CREATE TABLE Pagamentos (
    ID_do_Pagamento INT PRIMARY KEY,
    ID_do_Pedido INT,
    Valor_Total DECIMAL(10, 2),
    Data_do_Pagamento DATE,
    Metodo_de_Pagamento VARCHAR(50),
    FOREIGN KEY (ID_do_Pedido) REFERENCES Pedidos(ID)
);

INSERT INTO Clientes (ID, Nome, Sobrenome, Email, Telefone)
VALUES
    (1, 'João', 'Silva', 'joao.silva@example.com', '(11) 1234-5678'),
    (2, 'Maria', 'Santos', 'maria.santos@example.com', '(21) 9876-5432'),
    (3, 'Pedro', 'Almeida', 'pedro.almeida@example.com', '(31) 5555-1234'),
    (4, 'Ana', 'Oliveira', 'ana.oliveira@example.com', '(41) 8765-4321'),
    (5, 'Carlos', 'Rodrigues', 'carlos.rodrigues@example.com', '(51) 2345-6789'),
    (6, 'Mariana', 'Ferreira', 'mariana.ferreira@example.com', '(61) 5555-4321'),
    (7, 'Gustavo', 'Lima', 'gustavo.lima@example.com', '(71) 1234-5678'),
    (8, 'Amanda', 'Costa', 'amanda.costa@example.com', '(81) 9876-5432'),
    (9, 'Rafael', 'Martins', 'rafael.martins@example.com', '(91) 5555-1234'),
    (10, 'Juliana', 'Sousa', 'juliana.sousa@example.com', '(101) 8765-4321'),
    (11, 'Fernando', 'Pereira', 'fernando.pereira@example.com', '(111) 2345-6789'),
    (12, 'Carolina', 'Ramos', 'carolina.ramos@example.com', '(121) 5555-4321'),
    (13, 'Hugo', 'Oliveira', 'hugo.oliveira@example.com', '(131) 1234-5678'),
    (14, 'Isabela', 'Rodrigues', 'isabela.rodrigues@example.com', '(141) 9876-5432'),
    (15, 'Lucas', 'Silveira', 'lucas.silveira@example.com', '(151) 5555-1234'),
    (16, 'Mariana', 'Pereira', 'mariana.pereira@example.com', '(161) 8765-4321'),
    (17, 'Eduardo', 'Almeida', 'eduardo.almeida@example.com', '(171) 2345-6789'),
    (18, 'Patrícia', 'Santos', 'patricia.santos@example.com', '(181) 5555-4321'),
    (19, 'Alex', 'Ferreira', 'alex.ferreira@example.com', '(191) 1234-5678'),
    (20, 'Aline', 'Lima', 'aline.lima@example.com', '(201) 9876-5432'),
    (21, 'Marcelo', 'Costa', 'marcelo.costa@example.com', '(211) 5555-1234'),
    (22, 'Natália', 'Martins', 'natalia.martins@example.com', '(221) 8765-4321'),
    (23, 'André', 'Sousa', 'andre.sousa@example.com', '(231) 2345-6789'),
    (24, 'Sofia', 'Pereira', 'sofia.pereira@example.com', '(241) 5555-4321'),
    (25, 'Gustavo', 'Oliveira', 'gustavo.oliveira@example.com', '(251) 1234-5678');

INSERT INTO Produtos (ID, Nome_do_Produto, Descricao, Preco_Unitario)
VALUES
    (1, 'Camiseta', 'Camiseta de algodão preta, tamanho M', 29.99),
    (2, 'Calça Jeans', 'Calça jeans azul, corte reto, tamanho 32', 79.99),
    (3, 'Tênis', 'Tênis esportivo, cor preta, tamanho 42', 99.99),
    (4, 'Relógio', 'Relógio de pulso analógico, cor prata', 49.99),
    (5, 'Celular', 'Smartphone Android, 128GB, cor preta', 499.99),
    (6, 'Bolsa', 'Bolsa de couro sintético, cor marrom', 39.99),
    (7, 'Fones de Ouvido', 'Fones de ouvido sem fio, com cancelamento de ruído', 149.99),
    (8, 'Notebook', 'Notebook com processador Intel Core i5, 8GB RAM', 799.99),
    (9, 'Mochila', 'Mochila resistente para laptop, cor preta', 49.99),
    (10, 'Chapéu', 'Chapéu de aba larga, estilo Fedora', 19.99),
    (11, 'Óculos de Sol', 'Óculos de sol com armação dourada', 29.99),
    (12, 'Câmera Digital', 'Câmera digital compacta, 20MP', 199.99),
    (13, 'Sapato Social', 'Sapato social de couro, cor preta', 89.99),
    (14, 'Bicicleta', 'Bicicleta de montanha, 21 velocidades', 299.99),
    (15, 'Perfume', 'Perfume floral, frasco de 50ml', 69.99),
    (16, 'Impressora', 'Impressora a jato de tinta, Wi-Fi', 129.99),
    (17, 'Colar', 'Colar de prata com pingente de coração', 39.99),
    (18, 'Máquina de Café', 'Máquina de café automática, 12 xícaras', 129.99),
    (19, 'Caneta Esferográfica', 'Caneta de tinta preta, design elegante', 4.99),
    (20, 'Tablet', 'Tablet Android, 10 polegadas, 64GB', 199.99),
    (21, 'Relógio Inteligente', 'Relógio inteligente com monitor de atividades', 89.99),
    (22, 'Cadeira de Escritório', 'Cadeira giratória acolchoada, cor preta', 149.99),
    (23, 'Carteira', 'Carteira de couro genuíno, várias divisórias', 24.99),
    (24, 'Bateria Externa', 'Bateria externa de 10000mAh', 29.99),
    (25, 'Sapato Casual', 'Sapato casual de lona, cor azul', 39.99),
    (26, 'Laptop', 'Laptop ultrabook, tela de 13 polegadas', 1099.99),
    (27, 'Guarda-Chuva', 'Guarda-chuva compacto, resistente ao vento', 14.99),
    (28, 'Ventilador', 'Ventilador de mesa, 3 velocidades', 34.99),
    (29, 'Máscara Facial', 'Máscara facial de tecido, conjunto de 5', 9.99),
    (30, 'Pulseira', 'Pulseira de prata com pingentes variados', 19.99);

INSERT INTO Pedidos (ID, Data_do_Pedido, ID_do_Cliente)
VALUES
    (1, '2023-08-01', 3),
    (2, '2023-08-02', 5),
    (3, '2023-08-03', 2),
    (4, '2023-08-04', 1),
    (5, '2023-08-05', 4),
    (6, '2023-08-06', 6),
    (7, '2023-08-07', 7),
    (8, '2023-08-08', 8),
    (9, '2023-08-09', 9),
    (10, '2023-08-10', 10),
    (11, '2023-08-11', 11),
    (12, '2023-08-12', 12),
    (13, '2023-08-13', 13),
    (14, '2023-08-14', 14),
    (15, '2023-08-15', 15),
    (16, '2023-08-16', 16),
    (17, '2023-08-17', 17),
    (18, '2023-08-18', 18),
    (19, '2023-08-19', 19),
    (20, '2023-08-20', 20);

INSERT INTO Itens_do_Pedido (ID, ID_do_Pedido, ID_do_Produto, Quantidade)
VALUES
    (1, 1, 3, 2),
    (2, 1, 10, 1),
    (3, 2, 2, 1),
    (4, 2, 8, 3),
    (5, 3, 14, 2),
    (6, 3, 6, 1),
    (7, 4, 1, 2),
    (8, 4, 5, 1),
    (9, 5, 9, 2),
    (10, 6, 11, 1),
    (11, 6, 19, 2),
    (12, 7, 20, 1),
    (13, 8, 13, 1),
    (14, 8, 7, 1),
    (15, 9, 4, 1),
    (16, 10, 12, 1),
    (17, 11, 17, 2),
    (18, 12, 15, 1),
    (19, 13, 25, 1),
    (20, 14, 18, 1);

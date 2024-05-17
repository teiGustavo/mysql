INSERT INTO categorias (nome, data_cadastro) VALUES
('Automotivo', '2023-05-02 20:57:04'),
('Bebês', '2023-05-02 20:57:04'),
('Brinquedos e Jogos', '2023-05-02 20:57:04'),
('Computadores e Informática', '2023-05-02 20:57:04'),
('Games e Consoles', '2023-05-02 20:57:04'),
('Livros', '2023-05-02 20:57:04'),
('Pet Shop', '2023-05-02 20:57:04'),
('Roupas, Calçados e Acessórios', '2023-05-02 20:57:04');

INSERT INTO customers (cpf, nome, email, usuario, senha, datanasc, datacadastro) VALUES
('214.009.221-00', 'Martim Ribeiro Araujo', 'MartimRibeiroAraujo@rhyta.com', 'Sibes1987', 'dai7uuMem', '1987-01-20', '2023-05-02 21:22:55'),
('349.732.334-98', 'Antônio Cunha Sousa', 'AntonioCunhaSousa@teleworm.us', 'Thel1994', 'jahFaez0iP5M', '1994-09-20', '2023-05-02 21:22:55'),
('546.489.094-70', 'Clara Cavalcanti Lima', 'ClaraCavalcantiLima@armyspy.com', 'Sainigh', 'Thaik9aech', '1976-04-05', '2023-05-02 21:22:55'),
('563.080.765-03', 'Larissa Almeida Castro', 'LarissaAlmeidaCastro@armyspy.com', 'Looris', 'aeZaiqu9ooSh', '1996-09-21', '2023-05-02 21:22:55'),
('640.817.674-75', 'Arthur Souza Costa', 'ArthurSouzaCosta@teleworm.us', 'Twoulair', 'chuXeig0ees', '1978-05-27', '2023-05-02 21:22:55');

INSERT INTO formas_pagamentos (descricao, datacadastro) VALUES
('Dinheiro', '2023-05-02 21:23:49'),
('Cartão de Crédito', '2023-05-02 21:23:49'),
('Cartão de Débito', '2023-05-02 21:23:49'),
('PIX', '2023-05-02 21:23:49'),
('Transferência Bancária', '2023-05-02 21:23:49'),
('Cheque', '2023-05-02 21:23:49');

INSERT INTO produtos (nome, preco, quantidade, categoria, data_cadastro) VALUES
('Suporte Veicular Magnético 3 em 1', '73.71', 5, 1, '2023-05-02 21:00:37'),
('Pneu Goodyear Aro 14 Assurance Maxlife 175/65r14 86h', '368.90', 8, 1, '2023-05-02 21:00:37'),
('Fralda Huggies Tripla Proteção M - 92 Fraldas', '67.99', 3, 2, '2023-05-02 21:00:37'),
('NINHO Fases 1+ 800g', '42.99', 15, 2, '2023-05-02 21:14:23'),
('Pacote 5 Carros Sortidos, Hot Wheels, Mattel', '51.71', 2, 3, '2023-05-02 21:14:23'),
('Boneca Moana e Porquinho Pua Disney Cotiplás 2600', '137.90', 2, 3, '2023-05-02 21:14:23'),
('Notebook Lenovo Ultrafino IdeaPad 3 Ryzen 5 5500U 8GB 256GB SSD Prata 15.6\" Linu', '2749.89', 2, 4, '2023-05-02 21:14:23'),
('Cadeira Gamer Basica, CGR-02 - XZONE', '793.25', 6, 4, '2023-05-02 21:14:23'),
('The Last Of Us Part I - Playstation 5', '329.00', 20, 5, '2023-05-02 21:14:23'),
('Console Xbox Series S', '2129.00', 2, 5, '2023-05-02 21:14:23'),
('O pequeno príncipe', '34.95', 40, 6, '2023-05-02 21:14:23'),
('A revolução dos bichos: Um conto de fadas', '12.90', 55, 6, '2023-05-02 21:14:23'),
('Brinquedo Macaco Marrom Chalesco para Cães', '25.20', 30, 7, '2023-05-02 21:14:23'),
('PEDIGREE Ração Nutrição Essencial Carne Para Cães Adultos 10.1kg', '101.59', 4, 7, '2023-05-02 21:14:23'),
('Relógio Technos Masculino Racer Prata - 2117LDFS/1P', '339.24', 3, 8, '2023-05-02 21:17:58'),
('Moletom Canguru Masculino Raglan Divertido Nasa Geek Nerd ER_113', '179.00', 2, 8, '2023-05-02 21:17:58');

INSERT INTO usuarios (nome_completo, username, senha, email, data_cadastro) VALUES
('Administrador do Sistema', 'admin', '12345678', 'adm@adm.com', '2023-05-02 21:33:53');

INSERT INTO orders (cliente, formapgto, numparcelas, datavenda) VALUES
(1, 2, 5, '2023-05-02 21:24:10'),
(2, 2, 12, '2023-05-02 21:24:58'),
(3, 1, 1, '2023-05-02 21:24:58'),
(4, 4, 1, '2023-05-02 21:24:58'),
(1, 3, 1, '2023-05-02 21:24:58'),
(5, 2, 3, '2023-05-02 21:24:58');

INSERT INTO order_details (venda, produto, valor) VALUES
(1, 3, '67.99'),
(2, 7, '2800.00'),
(3, 16, '179.00'),
(3, 11, '30.90'),
(4, 13, '25.20'),
(5, 1, '73.71'),
(6, 5, '55.00');
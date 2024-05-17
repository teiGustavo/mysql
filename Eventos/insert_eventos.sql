INSERT INTO estados(nome_estado) values 
('Minas Gerais');

INSERT INTO cidades(nome_cidade, estado_id) values 
('Muriaé', 1),
('Miradouro', 1);

INSERT INTO generos(nome) values 
('Eletrônica'),
('Sertanejo');

INSERT INTO artistas(nome, telefone, email, pagina_web, genero_id) values 
("Marília Mendonça", "(32) 9 9800-7364", "shows@mariliamendonça.com", "mariliamendonça.com.br", 2),
("DJ Alok", "(32) 9 9800-7364", "shows@alok.com", "alok.com", 1);

INSERT INTO tipo_eventos(nome) values 
('Peça'),
('Exposição'),
('Show');

INSERT INTO eventos(data_evento, localizacao, tipo_evento_id, cidade_id) values 
("2023-07-18 19:00:00", "Parque de Exposição Local", 2, 1);

INSERT INTO precos(cachê, artista_id, tipo_evento_id) values 
(35000.00, 1, 3),
(30000.00, 2, 3),
(25000.00, 1, 2),
(15000.00, 2, 2),
(10000.00, 1, 1),
(10000.00, 2, 1);

INSERT INTO apresentacoes(valor_ingresso, publico_maximo, publico_presente, artista_id, evento_id) values 
(150, 10000, 8500, 1, 1),
(100, 10000, 8500, 2, 1);

INSERT INTO despesas(marketing, evento_id) values 
(8000.00, 1);

INSERT INTO artistas_despesas(hospedagem, preco_id, despesa_id) values 
(5000.00, 1, 1),
(5000.00, 2, 1);

UPDATE artistas_despesas AS AD SET AD.cachê = (
	SELECT P.cachê 
    FROM precos AS P 
    WHERE AD.preco_id = P.id
);

INSERT INTO receitas(evento_id) values 
(1);

UPDATE receitas AS R SET R.renda = (
	SELECT (E.valor_ingresso * E.publico_presente) 
    FROM eventos AS E
    WHERE R.evento_id = E.id
);

INSERT INTO lucros(evento_id, lucro) values 
(1, 15000.00);
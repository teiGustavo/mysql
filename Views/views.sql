/*VIEW 1*/
DROP VIEW IF EXISTS clientes_pedidos;

CREATE VIEW clientes_pedidos as
SELECT P.ID, DATE_FORMAT(P.Data_do_Pedido, '%d/%m/%Y') as Data_do_Pedido, P.ID_do_Cliente, C.nome, C.Sobrenome, C.email, C.Telefone
FROM pedidos as P JOIN clientes as C ON P.ID_do_Cliente = C.ID;

SELECT * FROM clientes_pedidos;

/*VIEW 2*/
DROP VIEW IF EXISTS pedidos_produtos;

CREATE VIEW pedidos_produtos as
SELECT *
FROM pedidos as P JOIN itens_do_pedido as I ON P.ID_do_Pedido = I.ID_do_Pedido;

SELECT * FROM pedidos_produtos;
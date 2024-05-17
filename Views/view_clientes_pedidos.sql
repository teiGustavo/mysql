/*VIEW PARA OS CLIENTES JOIN PEDIDOS*/
DROP VIEW IF EXISTS clientes_pedidos;

CREATE VIEW clientes_pedidos as
SELECT P.ID_do_Pedido, P.Data_do_Pedido, P.ID_do_Cliente, C.nome, C.Sobrenome, C.email, C.Telefone
FROM pedidos as P JOIN clientes as C ON P.ID_do_Cliente = C.ID;

SELECT * FROM clientes_pedidos;
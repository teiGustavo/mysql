SELECT F.titulo AS 'Título do Filme'
FROM filme AS F
WHERE F.preco_da_locacao > (SELECT AVG(preco_da_locacao) 
								FROM filme);

SELECT C.cliente_id, C.primeiro_nome
FROM cliente AS C
WHERE C.cliente_id IN (SELECT cliente_id
							FROM aluguel 
                            GROUP BY cliente_id
                            HAVING COUNT(cliente_id) > 15);

DROP TABLE IF EXISTS atoresbkp;
CREATE TABLE IF NOT EXISTS atoresbkp(
	ator_id smallint(5) UNSIGNED NOT NULL,
    primeiro_nome varchar(45) NOT NULL,
    ultimo_nome varchar(45) NOT NULL,
    ultima_atualizacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status CHAR(1)
);

INSERT INTO atoresbkp(ator_id, primeiro_nome, ultimo_nome, ultima_atualizacao) SELECT ator_id, primeiro_nome, ultimo_nome, ultima_atualizacao
																							FROM ator;
                                                                                            
UPDATE atoresbkp SET status = "A";																				                                                                                            
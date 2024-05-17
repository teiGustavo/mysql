/*Número 1*/
SELECT J.nome AS 'Nome do Jogador'
FROM jogadores AS J
WHERE J.idade > (
	SELECT AVG(idade) 
    FROM jogadores
);

/*Número 2*/
SELECT S.nome AS 'Nome da Seleção', J.nome AS 'Nome do Jogador'
FROM selecoes AS S JOIN jogadores AS J ON S.codigo = J.selecao
WHERE J.idade > (
	SELECT AVG(JD.idade) 
    FROM jogadores AS JD
    WHERE JD.selecao = J.selecao
);

/*Número 3*/
DROP TABLE IF EXISTS selecoes_bkp;
CREATE TABLE IF NOT EXISTS selecoes_bkp (
  codigo INT(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  grupo VARCHAR(1) NOT NULL,
  tecnico VARCHAR(80) NOT NULL
);

INSERT INTO selecoes_bkp 
	SELECT * FROM selecoes;

/*Número 4*/
SELECT JG.codigo AS 'Código do Jogo', DATE_FORMAT(JG.data, "%d/%m/%Y") AS 'Data do Jogo', CONCAT(S1.nome, " x ", S2.nome) AS 'Jogo'
FROM jogos AS JG JOIN selecoes AS S1 ON (S1.codigo = JG.selecao_a) JOIN selecoes AS S2 ON (S2.codigo = JG.selecao_b)
WHERE 40000 > (
	SELECT E.capacidade 
    FROM estadios AS E
    WHERE E.codigo = JG.estadio
);

/*Número 5*/
SELECT S.nome AS 'Nome da Seleção'
FROM selecoes AS S
WHERE 200 > (
	SELECT SUM(J.idade)
    FROM jogadores as J JOIN selecoes AS SL ON SL.codigo = J.selecao AND SL.codigo = S.codigo
    GROUP BY SL.codigo
);

/*Número 6*/
SELECT CONCAT(J.nome, " (", J.posicao, ") - ", S.nome) AS 'Nome do Jogador, Posição e Seleção'
FROM jogadores AS J JOIN selecoes AS S ON S.codigo = J.selecao;

/*Número 7*/
SELECT CONCAT(DATE_FORMAT(JG.data, "%d/%m/%Y"), " - ", S1.nome, " x ", S2.nome) AS 'Data do Jogo e Seleções Rivais'
FROM jogos AS JG JOIN selecoes AS S1 ON S1.codigo = JG.selecao_a JOIN selecoes AS S2 ON S2.codigo = JG.selecao_b;

/*Número 8*/
SELECT E.nome AS 'Nome do Estádio', IF(
	E.capacidade > 50000, "GRANDE", IF(
		E.capacidade BETWEEN 40000 AND 50000, "MÉDIO", "PEQUENO"
	)
) AS 'Porte'
FROM estadios AS E;
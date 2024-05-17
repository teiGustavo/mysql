USE banco_sp;

/* HELPERS */

DELIMITER $$
DROP PROCEDURE IF EXISTS FORMATAR_DATA $$
CREATE PROCEDURE FORMATAR_DATA(
	IN data_desejada VARCHAR(10),
    OUT data_formatada VARCHAR(10)
)
BEGIN
	DECLARE data_f VARCHAR(10);
    
	SET data_f =  REPLACE(data_desejada, '/', '-');
	
    IF data_f LIKE '__-__-____' THEN
		SELECT DATE_FORMAT(STR_TO_DATE(data_f, '%d-%m-%Y'), '%Y-%m-%d') INTO data_formatada;
	ELSEIF data_f LIKE '__-____' THEN
		SET data_formatada = CONCAT(SUBSTRING_INDEX(data_f, '-', -1), '-', SUBSTRING_INDEX(data_f, '-', 1));
	ELSE 
		SET data_formatada = data_f;
	END IF;
END $$
DELIMITER ;

/* TAREFA 1 */

DELIMITER $$
DROP PROCEDURE IF EXISTS BAIXA_ESTOQUE $$
CREATE PROCEDURE BAIXA_ESTOQUE(
	IN codigo_produto INT,
    IN quantidade_vendida INT
)
BEGIN
	DECLARE qtd_em_estoque INT;
	DECLARE qtd_restante INT;
    
    SET qtd_em_estoque = (SELECT Prd_Qtd_Estoque FROM produtos WHERE Prd_Codigo = codigo_produto);

	CREATE TABLE IF NOT EXISTS produtos_em_falta (
		Prd_Codigo INT NOT NULL, 
        Qtd_Vendida INT NOT NULL, 
        Qtd_Estoque INT NOT NULL, 
        Usuario VARCHAR(100) DEFAULT 'Gerente',
        Data_Venda DATETIME NOT NULL DEFAULT NOW()
    );
    
    IF (@qtd_em_estoque >= quantidade_vendida) THEN
		UPDATE produtos 
		SET Prd_Qtd_Estoque = (Prd_Qtd_Estoque - quantidade_vendida)
		WHERE Prd_Codigo = codigo_produto;
	ELSE
		SET qtd_restante = (@qtd_vendida - @qtd_em_estoque);
        
		UPDATE produtos 
		SET Prd_Qtd_Estoque = 0
		WHERE Prd_Codigo = codigo_produto;
        
		INSERT INTO produtos_em_falta(Prd_Codigo, Qtd_Vendida, Qtd_Estoque) VALUE (codigo_produto, quantidade_vendida, qtd_em_estoque);
    END IF;
END $$
DELIMITER ;

/* TAREFA 2*/

DELIMITER $$
DROP PROCEDURE IF EXISTS REAJUSTAR_PRECO $$
CREATE PROCEDURE REAJUSTAR_PRECO(
	IN codigo_produto INT,
	IN porcentagem double
)
BEGIN
	UPDATE produtos 
    SET Prd_Valor = (((Prd_Valor * porcentagem) / 100) + Prd_Valor)
    WHERE Prd_Codigo = codigo_produto;
END $$
DELIMITER ;

/* TAREFA 3 */

DELIMITER $$
DROP PROCEDURE IF EXISTS FATURAMENTO $$
CREATE PROCEDURE FATURAMENTO(
	IN data_desejada VARCHAR(10)
)
BEGIN
	CALL FORMATAR_DATA(data_desejada, @data_formatada);
    
    IF @data_formatada LIKE '____' THEN
		SELECT SUM(OP.Orp_Valor)
		FROM orcamento_produtos AS OP JOIN orcamentos AS O ON OP.Orc_Codigo = O.Orc_Codigo
		WHERE YEAR(O.Orc_Data) = @data_formatada;
	ELSEIF @data_formatada LIKE '____-__' THEN
		SELECT SUM(OP.Orp_Valor)
		FROM orcamento_produtos AS OP JOIN orcamentos AS O ON OP.Orc_Codigo = O.Orc_Codigo
		WHERE DATE_FORMAT(O.Orc_Data, '%Y-%m') = @data_formatada;
	ELSE
		SELECT SUM(OP.Orp_Valor)
		FROM orcamento_produtos AS OP JOIN orcamentos AS O ON OP.Orc_Codigo = O.Orc_Codigo
		WHERE O.Orc_Data = @data_formatada;
    END IF;
END $$
DELIMITER ;

/* TAREFA 4 */

DELIMITER $$
DROP PROCEDURE IF EXISTS QUANTIDADE_VENDIDA $$
CREATE PROCEDURE QUANTIDADE_VENDIDA(
	IN produto_id INT
)
BEGIN
	DECLARE quantidade_produto INT;
    DECLARE quantidade_id INT;
    
	CREATE TABLE IF NOT EXISTS produtos_vendidos (
		Prd_Codigo INT NOT NULL, 
        Qtd_Total_Vendida INT NOT NULL, 
        Data_Atualizacao DATETIME NOT NULL DEFAULT NOW()
    );
    
    SET @quantidade_id = (
		SELECT COUNT(Prd_Codigo)
		FROM produtos_vendidos
		WHERE Prd_Codigo = produto_id
        GROUP BY Prd_Codigo
	);
    
	SET @quantidade_produto = (
		SELECT Orp_Qtd
		FROM Orcamento_Produtos
		WHERE Prd_Codigo = produto_id AND Orp_Status = 'Vendido'
        GROUP BY Prd_Codigo
	);
    
    IF (@quantidade_id > 0) THEN
		IF (@quantidade_produto != (SELECT Qtd_Total_Vendida FROM produtos_vendidos WHERE Prd_Codigo = produto_id)) THEN
			UPDATE produtos_vendidos 
			SET Qtd_Total_Vendida = @quantidade_produto, Data_Atualizacao = NOW()
            WHERE Prd_Codigo = produto_id;
        END IF;
    ELSE
		INSERT INTO produtos_vendidos(Prd_Codigo, Qtd_Total_Vendida) VALUE
		(produto_id, @quantidade_produto);
	END IF;
    
END $$
DELIMITER ;
/* TAREFA 1 */

DELIMITER $$
DROP PROCEDURE IF EXISTS NOTA_AJUSTADA $$
CREATE PROCEDURE NOTA_AJUSTADA(
	IN id_aluno INT,
	IN id_prova INT
)
BEGIN
	DECLARE nota DECIMAL(15, 2);
    
    SELECT valor_nota INTO nota
    FROM nota
    WHERE aluno_id = id_aluno AND prova_id = id_prova;
    
	IF (nota > 10) THEN
		SET nota = 10;
	END IF;
	
	CASE
		WHEN (nota <= 5) THEN
			SET nota = (nota * 0.10) + nota;
		WHEN ((nota > 5 ) AND (nota < 8)) THEN
			SET nota = (nota * 0.05) + nota;
		WHEN (nota >= 8) THEN
			SET nota = (nota * 0.02) + nota;
	END CASE;
    
    SELECT nota;
END $$
DELIMITER ;

/* TAREFA 2 */

DELIMITER $$
DROP PROCEDURE IF EXISTS LISTA_DE_MATRICULAS $$
CREATE PROCEDURE LISTA_DE_MATRICULAS(
	OUT lista_de_matriculas VARCHAR(100)
)
BEGIN
	DECLARE finalizado INT DEFAULT 0;
	DECLARE matricula VARCHAR(45) DEFAULT '';

	DECLARE cursor_matricula CURSOR FOR SELECT matricula FROM aluno;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finalizado = 1;
    
	OPEN cursor_matricula;
		REPEAT
			FETCH cursor_matricula INTO matricula;

			IF (lista_de_matriculas = '') THEN
				SET lista_de_matriculas = matricula;
			ELSE
				SET lista_de_matriculas = CONCAT(lista_de_matriculas, '; ', matricula);
			END IF;
                  
		UNTIL finalizado = 1
        END REPEAT;
    CLOSE cursor_matricula;
    
    SELECT lista_de_matriculas;
END $$
DELIMITER ;

/* TAREFA 3 */

DELIMITER $$
DROP PROCEDURE IF EXISTS EXIBE_PROVA $$
CREATE PROCEDURE EXIBE_PROVA(
	IN id_prova INT
)
BEGIN
	DECLARE min DOUBLE;
	DECLARE max DOUBLE;
	DECLARE media DECIMAL(10, 2);
    
    SELECT MIN(valor_nota) INTO min
    FROM nota
    WHERE prova_id = id_prova;
    
	SELECT MAX(valor_nota) INTO max
    FROM nota
    WHERE prova_id = id_prova;
    
    SELECT AVG(valor_nota) INTO media
    FROM nota
    WHERE prova_id = id_prova;
    
    SELECT min AS 'Menor Nota', max AS 'Maior Nota', media AS 'Média das Notas';
END $$
DELIMITER ;
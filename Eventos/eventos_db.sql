DROP SCHEMA IF EXISTS eventos;
CREATE SCHEMA IF NOT EXISTS eventos;
USE eventos;

CREATE TABLE IF NOT EXISTS estados(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS cidades(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    
	estado_id INT NOT NULL,
    CONSTRAINT fk_estados_cidades
		FOREIGN KEY(estado_id)
        REFERENCES estados(id)
);

CREATE TABLE IF NOT EXISTS generos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS artistas(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    email VARCHAR(50) NOT NULL,
    pagina_web VARCHAR(100) NOT NULL DEFAULT "Não Informada",
    
    genero_id INT NOT NULL,
    CONSTRAINT fk_generos_artistas
		FOREIGN KEY(genero_id)
        REFERENCES generos(id)
);

CREATE TABLE IF NOT EXISTS tipo_eventos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS eventos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data DATETIME NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
            
	tipo_evento_id INT NOT NULL,
    CONSTRAINT fk_tipo_eventos_eventos
		FOREIGN KEY(tipo_evento_id)
        REFERENCES tipo_eventos(id),
        
	cidade_id INT NOT NULL,
    CONSTRAINT fk_cidades_eventos
		FOREIGN KEY(cidade_id)
        REFERENCES cidades(id)
);

CREATE TABLE IF NOT EXISTS precos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cachê DOUBLE NOT NULL,
    
    artista_id INT NOT NULL,
    CONSTRAINT fk_artitas_precos
		FOREIGN KEY(artista_id)
        REFERENCES artistas(id),
        
	evento_id INT NOT NULL,
    CONSTRAINT fk_tipo_eventos_precos
		FOREIGN KEY(evento_id)
        REFERENCES eventos(id)
);

CREATE TABLE IF NOT EXISTS apresentacoes(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
	valor_ingresso DOUBLE NOT NULL,
    publico_maximo INT NOT NULL,
    publico_presente INT DEFAULT 0,
    
    artista_id INT NOT NULL,
    CONSTRAINT fk_artitas_artistas_eventos
		FOREIGN KEY(artista_id)
        REFERENCES artistas(id),
        
	evento_id INT NOT NULL,
    CONSTRAINT fk_eventos_artistas_eventos
		FOREIGN KEY(evento_id)
        REFERENCES eventos(id)
);

CREATE TABLE IF NOT EXISTS tipo_despesas(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS despesas(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor DOUBLE NOT NULL DEFAULT 0.0,
    data DATE NOT NULL,
    
    evento_id INT NOT NULL,
    CONSTRAINT fk_eventos_despesas
		FOREIGN KEY(evento_id)
        REFERENCES eventos(id),
        
	tipo_despesa_id INT NOT NULL,
    CONSTRAINT fk_tipo_despesas_despesas
		FOREIGN KEY(tipo_despesa_id)
        REFERENCES tipo_despesas(id)   
);

CREATE TABLE IF NOT EXISTS receitas(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    evento_id INT NOT NULL,
    CONSTRAINT fk_eventos_receitas
		FOREIGN KEY(evento_id)
        REFERENCES eventos(id),
        
    renda DOUBLE
);

CREATE TABLE IF NOT EXISTS lucros(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
	evento_id INT NOT NULL,
    CONSTRAINT fk_eventos_lucros
		FOREIGN KEY(evento_id)
        REFERENCES eventos(id),
        
    lucro DOUBLE
)
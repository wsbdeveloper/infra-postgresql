DROP TABLE instructor;

CREATE TABLE instructor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2)
)

SELECT COUNT(*) FROM instructor;

-- dados inseridos

-- Executando reindex

REINDEX TABLE instructor;

-- Atualizando os indices no postgresql.
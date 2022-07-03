
DROP TABLE instructor;

CREATE TABLE instructor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2)
)

SELECT COUNT(*) FROM instructor;


-- Inserindo dados
DO $$
    DECLARE
    BEGIN
        FOR i IN 1...1000000 LOOP
            INSERT INTO instructor(nome, salario) VALUES ('Instructor(a) ' || i, random() * 1000 + 1)
        END LOOP
    END
$$;

-- Alterando sálario 
UPDATE instructor SET salario = salario * 2 WHERE id % 2 = 1;

-- Deletando usuário || postgres flag disable row
DELETE FROM instructor WHERE id % 2 = 0;

-- Vacuumn process

SELECT relname, n_dead_tup FROM pg_stat_user_tables;
SELECT pg_size_pretty(pg_relation_size('instructor'));


-- Não é possível fazer qualquer outra ação no banco.
-- selects etc
VACUUM FULL instructor;

VACUUM ANALYSE instructor;

VACUUM VERBOSE;


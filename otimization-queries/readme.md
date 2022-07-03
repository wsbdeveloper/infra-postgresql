# Otimization queries

Vamos verificar como nosso banco está trazendo nossos filtros com EXPLAIN.

```sql
EXPLAIN SELECT * FROM instructor WHERE salario > 1500;
```

Está como modo sequencial, isso não é muito bom quando tivermos muitos dados.
:worried:

Vamos criar um indice para melhorar nossas queries :zany_face:

```sql
CREATE INDEX idx_salario ON instructor(salario);
```

Dica :facepunch: Realizar reindex após criação de indices

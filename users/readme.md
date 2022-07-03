# Users Permissions

arquivo usado nessa doc pg_hba.conf

inserimos nosso host para a configuração como trust, ou seja, podemos acessar do nosso
servidor sem senha apenas confiando no nosso host.

```bash
host    wbit    postres    172.17.0.2/32      trust
```

Após a configração é necessário reiniciar o servidor postgresql.

```bash
pg_ctl restart
```

Conexão com usuário.

```bash
pg_ctl --host=172.0.0.1 --username=postgres -w
```

# Criando usuario

Definições de roles: documentação postgres

criando um usuário com permissão de LOGIN

```sql
CREATE USER wellington;
```

Alterando pg_hba.conf

```bash
host    wbit    wellington    172.17.0.2/32      trust
```

Reiniciar postgresql

```bash
pg_ctl restart
```

```bash
pg_ctl --host=172.0.0.1 --username=wellington -w
```

# Senha para usuário

Exluindo wellington para criar com senha.

```sql
DROP ROLE wellington;
```

Adicionando senha.

```sql
CREATE USER wellington PASSWORD '12345';
```

Alterando o pg_hba.conf para pedir a senha.

```bash
host    wbit    wellington    172.17.0.2/32      password
```

Reiniciar postgresql

```bash
pg_ctl restart
```

Conectar com senha.

```bash
psql --host=host --username=wellington -W wbit # banco de dados wbit
```

Colocar a senha e logar! 👍

Possível combar roles para nossa necessidade.

https://www.postgresql.org/docs/current/sql-createrole.html

## Adicionando permissões aos usuários

Revogando permissões com REVOKE

```sql
REVOKE ALL ON DATABASE wbit FROM wellington;
```

Reiniciar postgresql

```bash
pg_ctl restart
```

Removendo todas permissões de wellington no banco de dados.

Adicionando permissão de select para wellington.

```sql
GRANT SELECT ON public.tabela TO wellington;
```

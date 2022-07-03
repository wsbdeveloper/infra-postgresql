# Backup postgres

```bash
pg_dump -f= /tmp/dump.sql db_name
```

# Restore

```bash
pgsql db_name < /tmp/dump.sql
```

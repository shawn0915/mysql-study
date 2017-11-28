# Configuration

## Options

```bash
mysqld --verbose --help
```

## my.cnf

## Variables

```mysql
-- VARIABLES
SHOW GLOBAL VARIABLES ;
SHOW SESSION VARIABLES ;
-- STATUS
SHOW GLOBAL STATUS ;
SHOW SESSION STATUS ;
```

## SQL Modes

- characteristics
- behavior

```mysql
SELECT @@sql_mode;
+--------------------------------------------+
| @@sql_mode                                 |
+--------------------------------------------+
| STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION |
+--------------------------------------------+
1 row in set (0.00 sec)

```

## Reference

- [server-configuration](https://dev.mysql.com/doc/refman/5.6/en/server-configuration.html)
# Grant

- Admin
  - FILE
  - PROCESS
  - SUPER
  - ALL

- Table
  - SELECT
  - DELETE
  - INSERT
  - UPDATE

```mysql
-- dba
create user 'dba'@'localhost' identified by 'password';
grant all on *.* to 'dba'@'localhost';
flush privileges;

-- repl
create user 'repl'@'%' identified by 'password';
grant replication slave on *.* to 'repl'@'%';
flush privileges;
```

```mysql
GRANT SELECT ON sakila.* TO
'shawn'@'localhost' IDENTIFIED BY 'passwd';
```
```mysql
SHOW GRANTS ;
```

```mysql
FLUSH PRIVILEGES ;
```

> mysqladmin
```bash
mysqladmin flush-privileges
mysqladmin reload
```

> REVOKE
```mysql
REVOKE DELETE, INSERT, UPDATE ON sakila.*
FROM 'shawn'@'localhost';
```
```bash
mysqld_safe --skip-grant-tables

mysql --skip-networking
mysql --socket
```

# Account Resource Limits

- MAX_USER_CONNECTIONS
- MAX_QUERIES_PER_HOUR
- MAX_UPDATES_PER_HOUR
- MAX_CONNECTIONS_PER_HOUR
- MAX_USER_CONNECTIONS

```mysql
GRANT ALL ON sakila.* TO 'shawn'@'localhost'
WITH MAX_QUERIES_PER_HOUR 20
MAX_UPDATES_PER_HOUR 10
MAX_CONNECTIONS_PER_HOUR 5
MAX_USER_CONNECTIONS 2;
```
```mysql
SHOW GRANTS FOR 'shawn'@'localhost';
```


## REF

- [privileges-provided](https://dev.mysql.com/doc/refman/5.6/en/privileges-provided.html)




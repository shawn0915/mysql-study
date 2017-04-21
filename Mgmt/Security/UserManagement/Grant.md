# Grant

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
```bash
mysqladmin flush-privileges
mysqladmin reload
```
```mysql
REVOKE DELETE, INSERT, UPDATE ON sakila.*
FROM 'shawn'@'localhost';
```
```bash
mysql --skip-grant-tables
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






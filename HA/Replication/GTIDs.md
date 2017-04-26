# Global Transaction Identifiers(GTIDs)

```bash
vim /etc/my.cnf

gtid-mode=ON
enforce-gtid-consistency
log-slave-updates

```

```mysql
SELECT @@server_uuid;

(root@localhost) [(none)] 15:48:29> SELECT @@server_uuid;
+--------------------------------------+
| @@server_uuid                        |
+--------------------------------------+
| b57d8bfc-dba0-11e6-ab03-0050562cc7c0 |
+--------------------------------------+
1 row in set (0.00 sec)
```

```mysql
SELECT @@global.gtid_executed;

(root@localhost) [(none)] 15:49:14> SELECT @@global.gtid_executed;
+------------------------+
| @@global.gtid_executed |
+------------------------+
|                        |
+------------------------+
1 row in set (0.00 sec)

```
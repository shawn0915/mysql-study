# LOG

- 错误日志 error log (--log_error)
- 二进制日志 binary log (--log_bin, --expire_logs_days)
- 查询日志 general log (--general_log)
- 慢查询日志 slow query log (--slow_query_log, --long_query_time)
- Enterprise Audit (--audit_log, --audit_log_file)

## 错误日志 error log

```mysql
(shawn@localhost) [(none)] 14:10:43> SHOW VARIABLES LIKE 'log_error';
+---------------+---------------------------------+
| Variable_name | Value                           |
+---------------+---------------------------------+
| log_error     | /data/log/mysql/mysql-error.log |
+---------------+---------------------------------+
1 row in set (0.00 sec)
```


## 二进制日志 binary log

[BINLOG](binlog.md)

## 查询日志 general log

## 慢查询日志 slow query log

## Enterprise Audit

> audit_log
```mysql
<AUDIT_RECORD TIMESTAMP="2012-10-12T09:35:15"
  NAME="Connect" CONNECTION_ID="4" STATUS="0"
  USER="root" PRIV_USER="root" OS_LOGIN="" PROXY_USER=""
  HOST="localhost" IP="127.0.0.1" DB=""/>
<AUDIT_RECORD TIMESTAMP="2012-10-12T09:38:33"
  NAME="Query" CONNECTION_ID="4" STATUS="0"
  SQLTEXT="INSERT INTO tbl VALUES(1, 2)"/>
```

# Tools

```bash
mysqlsla
mysqldumpslow
```

# REF

- log
  - [server-logs](https://dev.mysql.com/doc/refman/5.6/en/server-logs.html)
  - [mysql-log-rotate](https://dev.mysql.com/doc/refman/5.6/en/log-file-maintenance.html)
  - [slave-logs-status](https://dev.mysql.com/doc/refman/5.6/en/slave-logs-status.html)
- audit
  - [mysql-enterprise-audit](https://dev.mysql.com/doc/refman/5.6/en/mysql-enterprise-audit.html)
  - [audit-log](https://dev.mysql.com/doc/refman/5.6/en/audit-log-reference.html)
  - [audit-log-file](https://dev.mysql.com/doc/refman/5.6/en/audit-log-file.html)
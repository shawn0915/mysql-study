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


## 二进制日志 binlog

```mysql
(shawn@localhost) [(none)] 14:45:19> SHOW MASTER STATUS \G
*************************** 1. row ***************************
             File: mysql-bin.000004
         Position: 1431
     Binlog_Do_DB: 
 Binlog_Ignore_DB: 
Executed_Gtid_Set: 
1 row in set (0.00 sec)


(shawn@localhost) [(none)] 14:45:42> SHOW BINLOG EVENTS IN 'mysql-bin.000004'\G
*************************** 1. row ***************************
   Log_name: mysql-bin.000004
        Pos: 4
 Event_type: Format_desc
  Server_id: 1
End_log_pos: 120
       Info: Server ver: 5.6.30-log, Binlog ver: 4
```

The binary log rotates when one of the following events occurs:
- The MySQL server is restarted.
- The maximum allowed size is reached (max_binlog_size).
- A FLUSH LOGS SQL command is issued.

> binlog files
```mysql
-- format
SHOW VARIABLES LIKE 'binlog_format';
-- binary log
SHOW BINARY LOGS ;
-- mater status
SHOW MASTER STATUS ;
```

> view binary logs
```bash
mysqlbinlog mysql-bin.000001 mysql-bin.000002

mysqlbinlog mysql-bin.000001 | more
```

> delete binary logs
```mysql
-- base on age
SHOW VARIABLES LIKE 'expire_logs_days';

SET GLOBAL expire_logs_days = 7;
PURGE BINARY LOGS BEFORE now() - INTERVAL 3 day;
-- base on name
PURGE BINARY LOGS TO 'mysql-bin.000002';
```

> flush binary log
```bash
mysqladmin flush-logs
```

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
- audit
  - [mysql-enterprise-audit](https://dev.mysql.com/doc/refman/5.6/en/mysql-enterprise-audit.html)
  - [audit-log](https://dev.mysql.com/doc/refman/5.6/en/audit-log-reference.html)
  - [audit-log-file](https://dev.mysql.com/doc/refman/5.6/en/audit-log-file.html)
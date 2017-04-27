# LOG

- 错误日志 error log (--log_error)
- 二进制日志 binary log (--log_bin, --expire_logs_days)
- 查询日志 general log (--general_log)
- 慢查询日志 slow query log (--slow_query_log, --long_query_time)
- Enterprise Audit (--audit_log, --audit_log_file)
- 操作日誌

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


```bash
mysqld --log-queries-not-using-indexes
```
```mysql
SHOW VARIABLES LIKE 'log_queries_not_using_indexes';
```

## MySQL Enterprise Audit

[audit_log](audit_log.md)


## 操作日誌

```bash
vim /etc/bashrc
```
```yaml
export WHOAMI=`whoami`
export DATE=`date +"%y%m%d_%H%M%S"`
alias mysql="mysql --tee /data/logs/mysql_record/record_${DATE}_${WHOAMI}.log"
```
```bash
source /etc/bashrc
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
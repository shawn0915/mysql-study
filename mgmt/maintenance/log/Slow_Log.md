# Slow Query Log
慢查询日志 slow query log (--slow_query_log, --long_query_time)

- 配置

```bash
vim /etc/my.cnf

[mysqld]

# MySQL 5.5
long_query_time=1
log-slow-queries=/data/mysql/data/slowlog.log

# MySQL 5.6
slow-query-log=1
slow-query-log-file=/data/mysql/data/slowlog.log
# 慢查询时间阈值，默认10s
long_query_time=1

# MySQL 5.7
# todo
```

- 查看变量

```mysql
show variables like '%slow%';
set global slow_query_log = ON;
set global slow_launch_time = 1;
```

```mysql
mysql> show variables like '%slow%';
 +---------------------------+----------------------------------------+
 | Variable_name             | Value                                  |
 +---------------------------+----------------------------------------+
 | log_slow_admin_statements | OFF                                    |
 | log_slow_slave_statements | OFF                                    |
 | slow_launch_time          | 1                                      |
 | slow_query_log            | ON                                     |
 | slow_query_log_file       | /data/mysql/data/iZ25ggavgm7Z-slow.log |
 +---------------------------+----------------------------------------+
 5 rows in set (0.00 sec)
```

```mysql
show global variables like '%long%';
show session variables like '%long%';

set global long_query_time=1;
set session long_query_time=1;
```

- 查询SQL不适用索引

```bash
mysqld --log-queries-not-using-indexes
```
```mysql
SHOW VARIABLES LIKE 'log_queries_not_using_indexes';
```

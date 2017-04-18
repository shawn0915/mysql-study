# LOG

- 错误日志 error log
- 二进制日志 binlog
- 查询日志 general log
- 慢查询日志 slow query log


## 错误日志 error log

```mysql
(shawn@localhost) [(none)] 14:10:43> show variables like 'log_error';
+---------------+---------------------------------+
| Variable_name | Value                           |
+---------------+---------------------------------+
| log_error     | /data/log/mysql/mysql-error.log |
+---------------+---------------------------------+
1 row in set (0.00 sec)
```


## 二进制日志 binlog

```mysql
(shawn@localhost) [(none)] 14:45:19> show master status \G
*************************** 1. row ***************************
             File: mysql-bin.000004
         Position: 1431
     Binlog_Do_DB: 
 Binlog_Ignore_DB: 
Executed_Gtid_Set: 
1 row in set (0.00 sec)


(shawn@localhost) [(none)] 14:45:42> show binlog events in 'mysql-bin.000004'\G
*************************** 1. row ***************************
   Log_name: mysql-bin.000004
        Pos: 4
 Event_type: Format_desc
  Server_id: 1
End_log_pos: 120
       Info: Server ver: 5.6.30-log, Binlog ver: 4
```

## 查询日志 general log

## 慢查询日志 slow query log

> Tools

- mysqlsla
- mysqldumpslow


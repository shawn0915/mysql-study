# BINARY LOG

```mysql
-- SHOW MASTER STATUS
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

> Rotates log

- MySQL restarts
- It reaches its maximum size as set by ```max_binlog_size```
- You issue a ```FLUSH LOGS``` statement

```mysql
SHOW BINARY LOGS;
SHOW MASTER STATUS;
```


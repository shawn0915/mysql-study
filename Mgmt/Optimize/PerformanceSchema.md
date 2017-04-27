# Performance Schema

```mysql
SHOW VARIABLES LIKE 'performance_schema';
```
```mysql
USE performance_schema;

SELECT file_name, event_name FROM file_instances LIMIT 1;
```


## Instruments

> Instruments in Performance Schema are points within the server source code from which MySQL raises events.


```mysql
stage/sql/statistics
statement/com/Binlog Dump
wait/io/file/innodb/innodb_data_file
wait/io/file/sql/binlog
wait/io/socket/sql/server_unix_socket

```


## REF

- [performance-schema-table-descriptions](https://dev.mysql.com/doc/refman/5.6/en/performance-schema-table-descriptions.html)

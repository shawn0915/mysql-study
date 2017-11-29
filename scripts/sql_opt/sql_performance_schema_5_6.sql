/*
Performance Schema
MySQL 5.6
 */

SHOW VARIABLES LIKE 'performance_schema';

USE performance_schema;

SELECT
  file_name,
  event_name
FROM file_instances
LIMIT 1;

/usr/share/mysql/english/errmsg.sys  	wait/io/file/sql/ERRMSG

/*
Instruments

Instruments in Performance Schema are points within the server source code from which MySQL raises events.
 */

stage/sql/statistics
statement/com/Binlog Dump
wait/io/file/innodb/innodb_data_file
wait/io/file/sql/binlog
wait/io/socket/sql/server_unix_socket

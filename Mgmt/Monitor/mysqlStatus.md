# MySQL STATUS

> Examining Server Status

```mysql
SHOW STATUS 
```
```bash
mysqladmin status
mysqladmin extended-status
```

> Top Status Variables

```mysql
SHOW STATUS LIKE 'Created_tmp_disk_tables';
SHOW STATUS LIKE 'Handler_read_first';
SHOW STATUS LIKE 'Innodb_buffer_pool_wait_free';
SHOW STATUS LIKE 'Max_used_connections';
SHOW STATUS LIKE 'Open_tables';
SHOW STATUS LIKE 'Select_full_join';
SHOW STATUS LIKE 'Slow_queries';
SHOW STATUS LIKE 'Sort_merge_passes';
SHOW STATUS LIKE 'Threads_connected';
SHOW STATUS LIKE 'Uptime';
```

# Innodb buffer pool

```mysql
innodb_buffer_pool_instances
innodb_buffer_pool_size
innodb_buffer_pool_load_at_startup
innodb_buffer_pool_dump_at_shutdown
```

```bash

[root@localhost mysql]# mysqladmin -S /var/lib/mysql/mysql.sock ext | grep -i innodb_buffer_pool
| Innodb_buffer_pool_dump_status                | not started |
| Innodb_buffer_pool_load_status                | not started |
| Innodb_buffer_pool_pages_data                 | 157         |
| Innodb_buffer_pool_bytes_data                 | 2572288     |
| Innodb_buffer_pool_pages_dirty                | 0           |
| Innodb_buffer_pool_bytes_dirty                | 0           |
| Innodb_buffer_pool_pages_flushed              | 1           |
| Innodb_buffer_pool_pages_free                 | 393051      |
| Innodb_buffer_pool_pages_misc                 | 0           |
| Innodb_buffer_pool_pages_total                | 393208      |
| Innodb_buffer_pool_read_ahead_rnd             | 0           |
| Innodb_buffer_pool_read_ahead                 | 0           |
| Innodb_buffer_pool_read_ahead_evicted         | 0           |
| Innodb_buffer_pool_read_requests              | 580         |
| Innodb_buffer_pool_reads                      | 158         |
| Innodb_buffer_pool_wait_free                  | 0           |
| Innodb_buffer_pool_write_requests             | 1           |
```




# Replication

- binary log
- replication threads and logs
- replication environment
- replication topologies


## Replication Use Cases

- Horizontal scale-out 水平向外扩展
- Business intelligence and analytics 业务智能和分析
- Geographic data distribution 地理数据分布

## Master Configuration

- **REPLICATION SLAVE** privilege

```mysql
GRANT REPLICATION SLAVE ON *.* TO <user>@<slave-hostname>;
```

## Slave Configuration

```mysql
CHANGE MASTER TO
MASTER_HOST = 'host_name',
MASTER_PORT = port_num,
MASTER_USER = 'user_name',
MASTER_PASSWORD = 'password',
MASTER_LOG_FILE = 'master_log_name',
MASTER_LOG_POS = master_log_pos;

CHANGE MASTER TO MASTER_PASSWORD='newpass';
```
```mysql
-- STATUS
SHOW MASTER STATUS;
```
```bash
mysqldump -uroot -p --master-data -B sakila > backup_sakila.sql
```

## REF

- [faqs-replication](https://dev.mysql.com/doc/refman/5.6/en/faqs-replication.html)
- [replication-features](https://dev.mysql.com/doc/refman/5.6/en/replication-features.html)




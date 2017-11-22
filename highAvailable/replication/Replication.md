# Replication


- Replication
- 同步复制
- [Semisynchronous Replication 半同步复制](semisync.md)
  - 无损半同步复制 `rpl_semi_sync_master_wait_point`
- Asynchronous Replication 异步复制
- 多源复制
- 组复制
- [GTIDs](replication/GTIDs.md)
- binary log
- [replication threads and logs](replication/ReplicationThreads.md)
- replication environment
- replication topologies
- 时延

## Replication Use Cases

- Horizontal scale-out 水平向外扩展
- Business intelligence and analytics 业务智能和分析
- Geographic data distribution 地理数据分布

## Master Configuration

- **REPLICATION SLAVE** privilege

```mysql
GRANT REPLICATION SLAVE ON *.* TO <user>@<slave-hostname>;
```

从库的复制账号需要主库的replication slave权限
主从库都需要replication client权限

R client:
1.	用来监控和管理复制的账号需要该权限
2.	后续可以方便的交换主备库角色


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

## Reference

- [faqs-replication](https://dev.mysql.com/doc/refman/5.6/en/faqs-replication.html)
- [replication-features](https://dev.mysql.com/doc/refman/5.6/en/replication-features.html)



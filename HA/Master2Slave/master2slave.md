# 搭建异步复制

## 主库配置：

```mysql
grant replication slave on *.* to 'repl'@'*' identified by '123456';

```

```bash
vim /etc/my.cnf
server-id = 10
log-bin = /data/mysql/data/mysql-bin
```



flush tables with read lock;
```mysql
(root@localhost) [(none)] 20:47:47> show master status;
+------------------+----------+--------------+------------------+-------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+------------------+----------+--------------+------------------+-------------------+
| mysql-bin.000004 |      120 |              |                  |                   |
+------------------+----------+--------------+------------------+-------------------+
1 row in set (0.00 sec)
```


tar zcvf data.tgz data

unlock tables;


## 从库配置:

```yaml
vim /etc/my.cnf
server-id = 20
log-bin = /data/mysql/data/mysql-bin
relay_log = /data/mysql/data/mysql-relay-bin
log_slave_updates = 1
read_only = 1
```


mysqld_safe --skip-slave-start &

## 启动复制

```mysql
change master to
master_host='master_host_nam e'
,master_user='repl'
,master_password='passwd'
,master_log_file='mysql-bin.000004'
,master_log_pos='120'
;
```



start slave;


show processlist\G


## 主要复制启动选项





log-slave-updates

master-connect-retry

read-only

replicate-do-db
replicate-do-table
replicate-ignore-db
replicate-ignore-table

slave-skip-errors



## 切换主从库

从库：

```bash


Slave1,2:
stop slave io_thread;

show processlist\G

Slave1:

stop slave;
reset master;


Slave2:
stop slave;
change master to master_host=’new_master_host’;
start slave;
```

Ps.删除新的主库上的master.info和relay-log.info

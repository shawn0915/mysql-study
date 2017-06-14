## 主MySQL配置

1、修改配置文件

```bash
vi /etc/my.cnf
[mysqld]
server-id=138
log-bin=master-bin
log-bin-index=master-bin.index
```
注：// server-id 给数据库服务的唯一标识，一般为大家设置服务器Ip的末尾号

2、重启数据库

```bash
service mysql restart

```

3、为从库分配用户

```mysql
mysql> create user repl;
mysql> GRANT REPLICATION SLAVE ON *.* TO 'repl'@'192.168.15.%' IDENTIFIED BY 'mysql';
mysql> flush privileges;
```

注：//repl用户必须具有REPLICATION SLAVE权限，除此之外没有必要添加不必要的权限，密码为mysql。说明一下192.168.0.%，这个配置是指明repl用户所在服务器，这里%是通配符，表示192.168.0.0-192.168.0.255的Server都可以以repl用户登陆主服务器。当然你也可以指定固定Ip。

4、登陆查看状态

```mysql
mysql> show master status\G
```



## 从MySQL配置

1、修改配置文件

```bash
vi /etc/my.cnf
[mysqld]
server-id=139
relay_log=slave-relay-bin
relay_log-index=slave-relay-bin.index
```


2、重启数据库

service mysql restart

3、连接主库

```mysql
mysql> change master to 
master_host='192.168.15.138',
master_port=3306,
master_user='repl',
master_password='mysql',
master_auto_position=1;
mysql> start slave;

```

4、登陆查看状态

```mysql
mysql> show slave status\G
```






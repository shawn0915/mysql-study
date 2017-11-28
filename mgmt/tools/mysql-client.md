# mysql client

```bash
mysql
mysqladmin
mysqlimport
mysqldump
mysqlcheck
mysqlshow
mysqlslap
```

## mysql


```mysql
SOURCE /usr/stage/world_innodb.sql
```

## mysqladmin

```bash
mysqladmin --help
mysqladmin status
mysqladmin variables
mysqladmin processlist
mysqladmin shutdown
```

## mysqldumpslow
- perl script
```bash
mysqldumpslow mysql-slow.log
```

## mysqlbinlog

```bash
mysqlbinlog mysql-bin.000001
```

## Reference

- [MySQL Client Programs](https://dev.mysql.com/doc/refman/5.6/en/programs-client.html)
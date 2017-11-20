# Backup

- Hot 热备份
  - mysqlhotcopy
    - Perl Script
    - MyISAM
  - MyISAM
  - ibbackup
  - Xtrabackup(Innodb)

- Cold 冷备份
  - Disk
    - ```tar, cp, cpio, rsync, xcopy```
      - For InnoDB: MySQL server shutdown is required.
      - For MyISAM: Lock tables to allow reads but not changes.
      - Snapshot, replication, or proprietary methods can be used.
    - Snapshot
      - **InnoDB** tables do not require ```FLUSH TABLES WITH READ LOCK``` to start a snapshot
      - but MyISAM tables do.
    - LVM Snapshots
      - ```lvcreate -s -n <snapshot-name> -L <size> <original-volume>```
      - ```lvcreate -s -n lv_datadirbackup -L 2G /dev/VG_MYSQL/lv_datadir```
      - ```lvremove VG_MYSQL/lv_datadirbackup```
  - Binary logs
  - Logical/textual backup
    - mysqldump
      - less then a few GBs
    - mysqlimport

- Warm
  - middle-of-the-road backup type
  - Not being able to modify data during backups



## mysqldump

```bash
mysqldump -l MyISAM
mysqldump --single -transation Innodb
```

## Export data

```mysql
-- SELECT ... INTO OUTFILE 
SELECT * INTO OUTFILE
  '/tmp/City.txt' FROM City;
```

## Import data

- disable all ```LOAD DATA LOCAL```
  - starting mysqld with the ```--local-infile=0``` option
- two modifier keywords
  - IGNORE
  - REPLACE
  
```mysql
-- LOAD DATA INFILE
LOAD DATA INFILE '/tmp/City.txt'
INTO TABLE city_0426
FIELDS TERMINATED BY '\t';
```

## MySQL Enterprise Backup

```bash
mysqlbackup
```
- privileges required



## REF

- [load-data-local](https://dev.mysql.com/doc/refman/5.6/en/load-data-local.html)
- [mysql-enterprise-backup](https://dev.mysql.com/doc/mysql-enterprise-backup/4.1/en/intro.html)
- [meb-files-overview](https://dev.mysql.com/doc/mysql-enterprise-backup/4.1/en/meb-files-overview.html)
- [mysqldump](https://dev.mysql.com/doc/refman/5.6/en/mysqldump.html)
- [point-in-time-recovery](https://dev.mysql.com/doc/refman/5.6/en/point-in-time-recovery.html)





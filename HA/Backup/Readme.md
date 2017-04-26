# Backup

- 物理备份
  - 热备份
    - mysqlhotcopy
    - MyISAM
    - ibbackup
    - Xtrabackup(Innodb)

  - 冷备份
    - cp

- 逻辑备份

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




## REF

- [load-data-local](https://dev.mysql.com/doc/refman/5.6/en/load-data-local.html)





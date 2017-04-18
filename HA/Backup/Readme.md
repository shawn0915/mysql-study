# Backup

- 物理
  - 热备份
    - mysqlhotcopy
    - MyISAM
    - ibbackup
    - Xtrabackup(Innodb)

  - 冷备份
    - cp

- 逻辑

```bash
mysqldump -l MyISAM
mysqldump --single -transation Innodb
```

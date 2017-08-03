
```mysql
mysql> alter table j1 convert to character set utf8mb4;
```

```bash
vim /etc/my.cnf
[mysqld]
init-connect='SET NAMES utf8mb4'
character-set-server=utf8mb4
```

## Ref

- [UTF8字符集的表怎么直接转UTF8MB4？](http://mp.weixin.qq.com/s/VWVKy16gMJ_kFeICsyMiVw)


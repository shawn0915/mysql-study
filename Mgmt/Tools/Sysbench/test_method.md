# Sysbench测试

## OLTP测试
数据准备：
1.	连接mysql 新建测试库
CREATE DATABASE sbtest DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
2.	表及数据准备
模拟行方现有数据量2.8亿，10张表，每张表2千万数据量，1000个并发，10万个请求。
```bash
sysbench --mysql-host=localhost --mysql-port=3306 --mysql-user=admin --mysql-password=123456 --mysql-db=sbtest --oltp-tables-count=10 --oltp-table-size=20000000 --num-threads=1000 --max-requests=100000 --report-interval=1 --test=/home/admin/sysbench-0.5/sysbench/tests/db/oltp.lua prepare

```

OLTP测试：
```bash
sysbench --mysql-host=localhost --mysql-port=3306 --mysql-user=admin --mysql-password=123456 --mysql-db=sbtest --oltp-tables-count=10 --oltp-table-size=20000000 --num-threads=1000 --max-requests=100000 --report-interval=1 --test=/home/admin/sysbench-0.5/sysbench/tests/db/oltp.lua run
```

结果分析：
   主要结果参数说明：
	tps是平均每秒钟事务提交次数，qps表示每秒查询次数（包括read和write），transactions 事务每秒。


只写测试：
```bash
sysbench --mysql-host=localhost --mysql-port=3306 --mysql-user=admin --mysql-password=123456 --mysql-db=sbtest --oltp-tables-count=10 --oltp-table-size=20000000 --num-threads=1000 --max-requests=100000 --report-interval=1 --test=/home/admin/sysbench-0.5/sysbench/tests/db/insert.lua run
```

结果分析：





清理数据：

```bash
sysbench --mysql-host=localhost --mysql-port=3306 --mysql-user=admin --mysql-password=123456 --mysql-db=sbtest --oltp-tables-count=10 --oltp-table-size=20000000 --num-threads=1000 --max-requests=100000 --report-interval=1 --test=/home/admin/sysbench-0.5/sysbench/tests/db/oltp.lua cleanup
```

## 内存测试 
文件准备：
```bash
sysbench --test=fileio --num-threads=20 --file-total-size=20G --file-test-mode=rndrw prepare

```

内存测试：
```bash
sysbench --test=memory --memory-block-size=4096 --memory-total-size=30G run

```

结果分析：





## 磁盘IO测试 
随机读测试：
```bash
sysbench --test=fileio --num-threads=100 --file-total-size=20G --file-test-mode=rndrw run
```
结果分析：




清理文件:
```bash
sysbench --test=fileio --num-threads=20 --file-total-size=20G --file-test-mode=rndrw cleanup
```

## CPU测试 
```bash
sysbench --test=cpu --num-threads=100 --cpu-max-prime=100000 run
```

寻找100000以内的最大素数

结果分析：


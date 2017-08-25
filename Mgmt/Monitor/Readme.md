# Monitor

## 主机性能

### 监控项

- CPU
- MEMORY
  - SWAP
- DISK
  - IOPS
  - SSD/HDD
  - 文件系统
- NETWORK
  - IN
  - OUT

### 监控指标


## 数据库性能

- 内存
- 线程
- 连接数
- 访问量
- 运行状态
  - [mysql status](mysqlStatus.md)

## benchmarking 基准

- mysqlslap

```bash
mysqlslap --iterations=5000 --concurrency=50 --query=workload.sql
--create=schema.sql --delimiter=";"
```
- sql-bench

## Performance Schema

[Performance Schema](../Optimize/PerformanceSchema.md)

## 报警

- 报警阈值
- 报警途径
  - Mail
  - SMS
  - Weixin
  
## 报表

- 实现方式
 - MySQL+Python

 

## REF

- [performance-schema](https://dev.mysql.com/doc/refman/5.6/en/performance-schema-quick-start.html)

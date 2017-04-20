# Optimizing MySQL Performance

## What

- innodb table
- data structure
```mysql
-- 优化表的数据类型
use sakila;
select * from country procedure analyse();
```
- index constraint
- query execution plan
- locking

## How
定位    分析    优化

### 定位

- STATUS
```mysql
SHOW STATUS;
```
- EXPLAIN
```mysql
EXPLAIN
	EXPLAIN
	EXPLAIN EXTENDED
	SHOW WARNINGS \G
	EXPLAIN PARTITIONS
```
- PROFILE
```mysql
SHOW PROFILE
	SELECT @@have_profiling;
	select @@profiling;
	show profiles;
	show profile [cpu | all] for query 4;
```
- TRACE
```mysql
-- 分析优化器
SELECT * FROM INFORMATION_SCHEMA.OPTIMIZER_TRACE ;
```



## REF

- [optimization](https://dev.mysql.com/doc/refman/5.6/en/optimization.html)
- [Locking Operations](https://dev.mysql.com/doc/refman/5.6/en/locking-issues.html)

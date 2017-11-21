# Optimizing MySQL Performance

> performance tuning

## Target


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
```mysql
USE sakila;
-- PROCEDURE ANALYSE(100, 256)
SELECT city_id, city, country_id FROM City PROCEDURE ANALYSE(250,1024);
```
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
-- EXPLAIN
EXPLAIN EXTENDED
SHOW WARNINGS
EXPLAIN PARTITIONS
```
```mysql
EXPLAIN FORMAT = JSON
SELECT city, country_id FROM city;
```
```json
{
  "query_block": {
    "select_id": 1,
    "table": {
      "table_name": "city",
      "access_type": "ALL",
      "rows": 600,
      "filtered": 100
    }
  }
}
```

- PROFILE
```mysql
-- SHOW PROFILE
SELECT @@have_profiling;
select @@profiling;
show profiles;
-- show profile [cpu | all] for query 4;
```

- TRACE
```mysql
-- 分析优化器
SELECT * FROM INFORMATION_SCHEMA.OPTIMIZER_TRACE ;
```

## Tuning

- [Server](Server.md)
- buffer pool

## REF

- [optimization](https://dev.mysql.com/doc/refman/5.6/en/optimization.html)
- [Locking Operations](https://dev.mysql.com/doc/refman/5.6/en/locking-issues.html)

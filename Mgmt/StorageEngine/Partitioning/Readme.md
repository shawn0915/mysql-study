# Partitioning

> Distribution of partitions is across physical storage.

- According to user-specified rules that are set as needed
- Each partition is stored as its own unit.

> The expression can be either an integer column value, or a function acting on one or
  more column values and returning an integer.

- The expression must return NULL or an integer value.
- With the use of RANGE/LIST COLUMNS, the expression can be one or more
columns of the following data types: INTs, DATE, DATETIME, CHAR, VARCHAR,
BINARY, and VARBINARY.

## MySQL supports several types of partitioning

- [RANGE](RANGE.md)
- [LIST](LIST.md)
- [KEY](KEY.md)
- COLUMNS
  - RANGE COLUMNS
  - LIST COLUMNS
- LINEAR
  - linear hashing
- Subpartitioning
  - RANGE and LIST partitioned tables can be subpartitioned
  - The subpartitions themselves can be HASH or KEY

## Basic Partition Syntax

```mysql
CREATE TABLE <table_name> (<table_column_options>)
ENGINE=<engine_name>
PARTITION BY <type> (<partition_expression>);
```
```
PARTITION BY RANGE ...
PARTITION BY RANGE COLUMNS ...
PARTITION BY LIST ...
PARTITION BY LIST COLUMNS ...
PARTITION BY HASH ...
PARTITION BY LINEAR HASH ...
PARTITION BY KEY ...
PARTITION BY LINEAR KEY ...
```

## Obtaining Partition Information

```mysql
SHOW CREATE TABLE ORDERS_HASH;

SHOW TABLE STATUS LIKE 'orders_hash';
```

```mysql
SELECT PARTITION_NAME, PARTITION_DESCRIPTION
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME='orders_list'
      AND TABLE_SCHEMA='sakila';
```
```

+----------------+-----------------------+
| PARTITION_NAME | PARTITION_DESCRIPTION |
+----------------+-----------------------+
| p0             | 1,3,4,17              |
| p1             | 2,12,14               |
| p2             | 6,8,20                |
| p3             | 5,7,9,11,16           |
| p4             | 10,13,15,18           |
+----------------+-----------------------+

```

> EXPLAIN PARTITIONS
```mysql
EXPLAIN PARTITIONS SELECT * FROM orders_range\G
```
```mysql
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: orders_range
   partitions: p0,p1,p2,p3,p4
         type: ALL
possible_keys: NULL
          key: NULL
      key_len: NULL
          ref: NULL
         rows: 5
        Extra: NULL
1 row in set (0.00 sec)
```


## Redefining the Partitioning Type

```mysql
ALTER TABLE orders_range
PARTITION BY HASH(id) PARTITIONS 4;
```

## Exchanging Partitions

> To exchange a table partition or subpartition with a table.
- Move any existing rows in the partition or subpartition to the
non-partitioned table.
- Move any existing rows in the non-partitioned table to the
table partition or subpartition.

```mysql
ALTER TABLE orders_range
EXCHANGE PARTITION p0
WITH TABLE orders;
```

## Dropping Partitions

## Removing Partitioning


## Partitioning Limitations

> General
- The maximum number of partitions per table is 8192.
- Spatial types are not supported.
- Temporary tables cannot be partitioned.
- It is not possible to partition log tables.
> Foreign keys and indexes
- Foreign keys are not supported.
- FULLTEXT indexes are not supported.
- No global indexes: Each partition has its own indexes.
> Subpartitioning is possible only:
- When partitioning by RANGE and LIST
- By LINEAR HASH or LINEAR KEY


## REF

- [partitioning-limitations](https://dev.mysql.com/doc/refman/5.6/en/partitioning-limitations.html)
- [partitioning-columns](https://dev.mysql.com/doc/refman/5.6/en/partitioning-columns.html)




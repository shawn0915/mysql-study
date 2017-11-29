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

- [RANGE](ex_range.sql)
- [LIST](ex_list.sql)
- [KEY](ex_key.sql)
- [HASH](ex_hash.sql)
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

```mysql
SHOW TABLE STATUS LIKE 'tableName';
```

```mysql
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

[Partition Information](ex_info.sql)


## Redefining the Partitioning Type

将 ALTER TABLE 与 PARTITION BY 配合使用，将分区类型从 RANGE 更改为 HASH
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

将表分区或子分区与表交换。
将分区或子分区中的所有现有行移至非分区表。
将非分区表中的所有现有行移至表分区或子分区。
要交换的表不能进行分区。
它必须与分区表具有相同表结构。
交换之前，非分区表中的行必须位于为分区或子分区定义的范围内。


```mysql
ALTER TABLE orders_range
EXCHANGE PARTITION p0
WITH TABLE orders;
```

交换分区的结果包括：
交换分区不会在分区表或交换表上调用触发器。
将重置交换表中的所有 AUTO_INCREMENT 列。


## Dropping Partitions

[DROP PARTITION](ex_drop.sql)

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
- When partitioning by ```RANGE``` and ```LIST```
- By ```LINEAR HASH``` or ```LINEAR KEY```


## Performance Effects of Altering a Partition

根据分区的数量，与创建非分区表相比，创建分区表的速度稍微慢一些。
分区操作处理速度比较： 

对于大型事务表，```DROP PARTITION``` 比 DELETE 快得多。 
```ADD PARTITION``` 在 RANGE 和 LIST 表上相当快。 

对于在 KEY 或 HASH 表上运行的 ADD PARTITION，速度取决于已经存储的行数。 

如果存在更多数据，需要花费更长时间来添加新分区。 
对超大型表运行 ```COALESCE PARTITION```、```REORGANIZE PARTITION``` 和 ```PARTITION BY``` 时，
它们的执行速度可能会很慢。 在此类操作过程中，硬件 I/O 的开销比分区引擎的开销高得多。 

在 KEY/HASH 上运行的 ADD PARTITION 将所有行重新分布到新数量的分区，
有效地执行完整表复制。COALESCE PARTITION 和 PARTITION BY 产生相同结果。 
针对 LINEAR HASH/KEY 分区的 ADD/COALESCE PARTITION 仅拆分/合并受影响数量的分区。 
REORGANIZE PARTITION 取决于要重组的分区的大小。


## Partitioning: Storage Engine Features

分区存储在与 InnoDB 表相同位置中的文件中。
您可以提供 DATA DIRECTORY 选项来重定位分区。
每个分区在以下数据目录中具有其自己的文件：
**<table_name>#P#<partition_name>.ibd**

如果禁用 innodb_file_per_table，分区将存储在共享表空间中。
所有数据和索引都将进行分区。
不能仅对数据或仅对索引进行分区。
分区可用于其他存储引擎。不可用于 MERGE、FEDERATED、CSV

每个 PARTITION 子句可以包括一个 [STORAGE] ENGINE 选项。该选项没有作用。
每个分区使用的存储引擎与表作为一个整体而使用的存储引擎相同。 
分区应用于表的所有数据和索引。请注意，不能仅对数据或仅对索引进行分区。 

默认情况下，分区存储在数据目录中其自己的文件中。
使用 DATA DIRECTORY 指定替代分区位置： 

 

分区作为存储引擎来实现。
分区表使用分区存储引擎和后备存储引擎（例如 InnoDB）的组合。
其他存储引擎也可以使用分区；
但是 MERGE、CSV 和 FEDERATED 存储引擎无法使用分区。

## Reference

- [partitioning-limitations](https://dev.mysql.com/doc/refman/5.6/en/partitioning-limitations.html)
- [partitioning-columns](https://dev.mysql.com/doc/refman/5.6/en/partitioning-columns.html)
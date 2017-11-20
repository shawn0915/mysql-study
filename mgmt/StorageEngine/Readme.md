# 存储引擎 Storage Engines

## Engines

### [Innodb](Innodb/Innodb.md)

### [MyISM](MyISM.md)

### OTHER

- MEMORY
  - stored in memory, represented on disk by a .frm file
  - Maximum size option --max-heap-table-size
  - Cannot contain TEXT or BLOB columns
  - Can use different character sets for different columns
- ARCHIVE
  - Represented by .frm file
  - Data file: .ARZ
  - Does not support indexes
  - Supports INSERT and SELECT
  - Supports ORDER BY operations and BLOB columns
  - Accepts all but spatial data types
  - Uses row-level locking
  - Supports AUTO_INCREMENT columns
- FEDERATED
- EXAMPLE
- BLACKHOLE
  - Used for replication
  - Supports all kinds of indexes
  - Retrievals always return an empty result
- MERGE
- CSV
- PERFORMANCE_SCHEMA
- [NDBCLUSTER](https://dev.mysql.com/doc/refman/5.6/en/mysql-cluster.html)


```mysql
SHOW ENGINES;

SELECT @@default_storage_engine;
```

## Partitioning

[Partitioning](Partitioning/Readme.md)

## REF

- [storage-engines](https://dev.mysql.com/doc/refman/5.6/en/storage-engines.html)
- [memory-storage-engine](https://dev.mysql.com/doc/refman/5.6/en/memory-storage-engine.html)







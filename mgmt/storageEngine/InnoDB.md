# Innodb

- [History](#history)
- [Feature](#feature)
- [Reference](#reference)


## History

- Innobase Oy
- Oracle (2005)

## Feature

- Transaction-safe (ACID compliant)
- [MVCC](#mvcc) (Multi-Versioning Concurrency Control)
  - InnoDB row-level locking
  - Oracle-style consistent non-locking reads
- Table data arranged to optimize primary key based queries
- Support for foreign-key referential integrity constraints
- Maximum performance on large data volumes
- Mixing of queries on tables with different storage engines
- Fast auto-recovery after a crash
- Buffer pool for caching data and indexes in memory

## Converting Existing Tables to InnoDB

```mysql
-- alter table
ALTER TABLE city ENGINE = InnoDB;
-- clone a table
INSERT INTO <innodb_table> SELECT * FROM <other_table>;
-- Insert large tables in smaller pieces for greater control.
INSERT INTO newtable SELECT * FROM oldtable
WHERE yourkey > something AND yourkey <= somethingelse;
```

## Tablespace

> InnoDB creates a further tablespace in the database directory—an.ibd 
  file—for each InnoDB table.

## Innodb Buffer Pools

- [Innodb Buffer Pool](innodb/Innodb_buffer_pool.md)


## Reduce Deadlocks



## Innodb Status

- [Innodb Status](innodb/Innodb_status.md)

## MVCC

InnoDB adds three fields to each row stored in a database:
- DB_TRX_ID: Transaction identifier
- DB_ROLL_PTR: Roll pointer
- DB_ROW_ID: Row ID

## Reference

- [innodb-storage-engine](https://dev.mysql.com/doc/refman/5.6/en/innodb-storage-engine.html)





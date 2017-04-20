# Innodb

## Feature Summary

- Transaction-safe (ACID compliant)
- MVCC (Multi-Versioning Concurrency Control)
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

## Buffer Pools

- innodb_buffer_pool_instances
- innodb_buffer_pool_size
- innodb_buffer_pool_load_at_startup
- innodb_buffer_pool_dump_at_shutdown

## Reduce Deadlocks

```mysql
SHOW ENGINE INNODB STATUS ;
```

```

=====================================
2017-04-20 14:37:58 7fc049de7700 INNODB MONITOR OUTPUT
=====================================
Per second averages calculated from the last 22 seconds
-----------------
BACKGROUND THREAD
-----------------
srv_master_thread loops: 219 srv_active, 0 srv_shutdown, 84918 srv_idle
srv_master_thread log flush and writes: 85137
----------
SEMAPHORES
----------
OS WAIT ARRAY INFO: reservation count 185
OS WAIT ARRAY INFO: signal count 183
Mutex spin waits 90, rounds 1200, OS waits 35
RW-shared spins 119, rounds 3600, OS waits 120
RW-excl spins 5, rounds 912, OS waits 30
Spin rounds per wait: 13.33 mutex, 30.25 RW-shared, 182.40 RW-excl
------------
TRANSACTIONS
------------
Trx id counter 8493
Purge done for trx's n:o < 8492 undo n:o < 0 state: running but idle
History list length 159
LIST OF TRANSACTIONS FOR EACH SESSION:
---TRANSACTION 8487, not started
MySQL thread id 74, OS thread handle 0x7fc049de7700, query id 63504 192.168.52.101 shawn init
show ENGINE innodb STATUS
--------
FILE I/O
--------
I/O thread 0 state: waiting for completed aio requests (insert buffer thread)
I/O thread 1 state: waiting for completed aio requests (log thread)
I/O thread 2 state: waiting for completed aio requests (read thread)
I/O thread 3 state: waiting for completed aio requests (read thread)
I/O thread 4 state: waiting for completed aio requests (read thread)
I/O thread 5 state: waiting for completed aio requests (read thread)
I/O thread 6 state: waiting for completed aio requests (write thread)
I/O thread 7 state: waiting for completed aio requests (write thread)
I/O thread 8 state: waiting for completed aio requests (write thread)
I/O thread 9 state: waiting for completed aio requests (write thread)
Pending normal aio reads: 0 [0, 0, 0, 0] , aio writes: 0 [0, 0, 0, 0] ,
 ibuf aio reads: 0, log i/o's: 0, sync i/o's: 0
Pending flushes (fsync) log: 0; buffer pool: 0
876 OS file reads, 11066 OS file writes, 7622 OS fsyncs
0.00 reads/s, 0 avg bytes/read, 0.00 writes/s, 0.00 fsyncs/s
-------------------------------------
INSERT BUFFER AND ADAPTIVE HASH INDEX
-------------------------------------
Ibuf: size 1, free list len 0, seg size 2, 0 merges
merged operations:
 insert 0, delete mark 0, delete 0
discarded operations:
 insert 0, delete mark 0, delete 0
Hash table size 17359, node heap has 1 buffer(s)
0.00 hash searches/s, 0.00 non-hash searches/s
---
LOG
---
Log sequence number 11966784
Log flushed up to   11966784
Pages flushed up to 11966784
Last checkpoint at  11966784
0 pending log writes, 0 pending chkp writes
6660 log i/o's done, 0.00 log i/o's/second
----------------------
BUFFER POOL AND MEMORY
----------------------
Total memory allocated 8585216; in additional pool allocated 0
Dictionary memory allocated 388896
Buffer pool size   511
Free buffers       254
Database pages     256
Old database pages 0
Modified db pages  0
Pending reads 0
Pending writes: LRU 0, flush list 0, single page 0
Pages made young 0, not young 0
0.00 youngs/s, 0.00 non-youngs/s
Pages read 856, created 1008, written 3659
0.00 reads/s, 0.00 creates/s, 0.00 writes/s
No buffer pool page gets since the last printout
Pages read ahead 0.00/s, evicted without access 0.00/s, Random read ahead 0.00/s
LRU len: 256, unzip_LRU len: 0
I/O sum[0]:cur[0], unzip sum[0]:cur[0]
--------------
ROW OPERATIONS
--------------
0 queries inside InnoDB, 0 queries in queue
0 read views open inside InnoDB
Main thread process no. 4804, id 140463845938944, state: sleeping
Number of rows inserted 53331, updated 11, deleted 8, read 9278
0.00 inserts/s, 0.00 updates/s, 0.00 deletes/s, 0.00 reads/s
----------------------------
END OF INNODB MONITOR OUTPUT
============================

```

## REF

- [innodb-storage-engine](https://dev.mysql.com/doc/refman/5.6/en/innodb-storage-engine.html)





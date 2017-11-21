# Locking

## Types of locks

- Shared lock
- Exclusive lock

## 行锁 表锁

- 行锁
  - 共享锁 S
  - 排他锁 X

- 表锁
  - 意向共享锁 IS
  - 意向排他锁 IX

- 行锁的三种算法
  - Record Lock
  - Gap Lock
  - Next-key Lock：Record Lock + Gap Lock
    锁定一个范围，并且锁定记录本身


## Explicit Row Locks

- LOCK IN SHARE MODE
- FOR UPDATE

## 监控状态

- [information_schema](../../sql_scripts/sql_mgmt/sql_information_schema.sql)


## Deadlocks

> Deadlocks are a classic problem in transactional databases, but they are not dangerous
  unless they are so frequent that you cannot run certain transactions at all.

## Implicit Locks

> No lock unless SERIALIZABLE level, LOCK IN SHARE MODE, or FOR UPDATE is used

## REF

- [innodb-deadlock-detection](https://dev.mysql.com/doc/refman/5.6/en/innodb-deadlock-detection.html)



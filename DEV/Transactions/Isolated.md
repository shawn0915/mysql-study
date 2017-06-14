# Isolated 一致性

## Transaction Isolation Problems

- "Dirty" read
- Non-repeatable read
- Phantom read (or phantom row)


- “脏”读
一个事务读取另一个未提交的事务所做的更改
- 不可重复读
另一个未提交的事务所做的更改导致先前读取操作不可重复
- 虚读（或虚行）
某行以前未在同一事务中显示，而现在显示出来


## Isolation Levels

- READ UNCOMMITTED
- READ COMMITTED
- REPEATABLE READ
- SERIALIZABLE

## Isolation Level Problems

![Isolation Level Problems](img/Isolation%20Level%20Problems.png)

## Global Isolation Level

```mysql
SELECT @@tx_isolation;
SELECT @@global.tx_isolation,
  @@session.tx_isolation;
```
需要```super```权限

```mysql
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

SET GLOBAL TRANSACTION ISOLATION LEVEL READ COMMITTED;
```







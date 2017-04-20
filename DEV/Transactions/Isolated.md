# Isolated

## Transaction Isolation Problems

- "Dirty" read
- Non-repeatable read
- Phantom read (or phantom row)

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










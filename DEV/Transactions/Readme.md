# Transactions

> All or none of the steps succeed.
- Execute if all steps are good.
- Cancel if steps have error or are incomplete.

## [ACID](ACID.md)

- Atomic
- Consistent
- [Isolated](Isolated.md)
- Durable

## 本地事务

```mysql
COMMIT ;
ROLLBACK ; 
LOCK TABLES ;
```

## 分布式事务 XA


## Use locking to protect transactions

> InnoDB tables use row-level locking so that multiple sessions and applications can read from
  and write to the same table simultaneously, without making each other wait and without
  producing inconsistent results. For this storage engine, avoid using the LOCK TABLES
  statement; it does not offer any extra protection but instead reduces concurrency.

> The automatic row-level locking makes these tables suitable for your busiest databases with
  your most important data, while also simplifying application logic, because you do not need to
  lock and unlock tables. Consequently, the InnoDB storage engine is the default in MySQL 5.6.




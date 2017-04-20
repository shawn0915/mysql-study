# Locking

## Types of locks

- Shared lock
- Exclusive lock

## Explicit Row Locks

- LOCK IN SHARE MODE
- FOR UPDATE

## Deadlocks

> Deadlocks are a classic problem in transactional databases, but they are not dangerous
  unless they are so frequent that you cannot run certain transactions at all.

## Implicit Locks

> No lock unless SERIALIZABLE level, LOCK IN SHARE MODE, or FOR UPDATE is used

## REF

- [innodb-deadlock-detection](https://dev.mysql.com/doc/refman/5.6/en/innodb-deadlock-detection.html)



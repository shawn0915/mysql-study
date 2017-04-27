# ACID

- Atomic
- Consistent
- [Isolated](Isolated.md)
- Durable

> Transaction SQL Control Statements

- START TRANSACTION (BEGIN)
- SAVEPOINT
- COMMIT
- ROLLBACK
- ROLLBACK TO SAVEPOINT
- RELEASE SAVEPOINT
- SET AUTOCOMMIT

```mysql
SELECT @@AUTOCOMMIT;
SET @@AUTOCOMMIT :=0;
```

> Example of statements that cause an implicit commit:

```mysql
TRUNCATE TABLE tablename;
LOAD DATA INFILE '/path/datafile';
```




## REF

- [refman-implicit-commit](https://dev.mysql.com/doc/refman/5.6/en/implicit-commit.html)



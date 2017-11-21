# Development
开发阶段


## Plan and Design
规划

- 容量规划
  - 业务增速？极限在哪？
- 分库分表
  - “合久必分，分久必合”

## Model
建模

- 业务架构
- 业务逻辑、关联关系
- [数据类型 Data Types](model/DataTypes.md)
- [索引约束](model/IndexConstraint.md)

## SQL开发

- [SQL语言(Structured Query Language)](../sql_scripts/sql_dev/sql_demo.sql)
- 语法标准
  - ANSI SQL-89
  - ANSI SQL-92
- 范式  
- 设计规范
- [审核 Audit](audit/Audit.md)
  - [audit log](../mgmt/Maintenance/Log/audit_log.md)

## Transactions and Locking

- [Transactions](transactions/Transaction.md)
- [Locking](locking/Locking.md)

## Programming Inside MySQL

### Programming

- Stored Routines
  - Stored Procedure
    - CALL statement
    - [EXAMPLE](../sql_scripts/programming/ex_procedure.sql)
  - Stored Function
    - [EXAMPLE](../sql_scripts/programming/ex_function.sql)
- EVENT
  - [EXAMPLE](../sql_scripts/programming/ex_event.sql)
- TRIGGER
  - [EXAMPLE](../sql_scripts/programming/ex_trigger.sql)
```
触发顺序：

UPDATE:
	BEFORE INSERT
	BEFORE UPDATE
	AFTER UPDATE

INSERT:
	BEFORE INSERT
	AFTER INSERT

```
- VIEW
- [EXAMINE](../sql_scripts/programming/examine.sql)

### Privileges

- ```TRIGGER``` privilege
```mysql
CREATE TRIGGER;
DROP TRIGGER;
```

- ```EVENT``` privilege
  - create, modify, or delete events.
  - You must have the **SUPER** privilege to set the global ```event_scheduler``` variable.
  - **event_scheduler** thread


## 事务和锁 Transactions and Locking

- [Transactions](transactions/Transaction.md)
- [Locking](locking/Locking.md)

 
## REF

- [condition-handling](https://dev.mysql.com/doc/refman/5.6/en/condition-handling.html)
- [example database](https://dev.mysql.com/doc/index-other.html)
- [test-db](https://launchpad.net/test-db/)
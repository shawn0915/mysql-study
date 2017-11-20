# Development

## 规划

- 容量规划
  - 业务增速？极限在哪？
- 分库分表
  - “合久必分，分久必合”

## 建模

- 业务架构
- 业务逻辑、关联关系
- [数据类型 Data Types](DataTypes/DataTypes.md)
- [索引](IndexConstraint/Readme.md)

## SQL开发

- [SQL语言(Structured Query Language)](sql_base/Readme.md)
- 语法标准
  - ANSI SQL-89
  - ANSI SQL-92
- 范式  
- 设计规范
- [审核 Audit](Audit/Readme.md)
  - [audit log](../Mgmt/Maintenance/Log/audit_log.md)

## Transactions and Locking

- [Transactions](Transactions/Readme.md)
- [Locking](Locking/Readme.md)

## Programming Inside MySQL

### Programming

- Stored Routines
  - Stored Procedure
    - CALL statement
    - [EXAMPLE](Programming/ex_procedure.sql)
  - Stored Function
    - [EXAMPLE](Programming/ex_function.sql)
- EVENT
  - [EXAMPLE](Programming/ex_event.sql)
- TRIGGER
  - [EXAMPLE](Programming/ex_trigger.sql)
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
- 视图 VIEW
- [EXAMINE](Programming/examine.sql)

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
 
### REF

- [condition-handling](https://dev.mysql.com/doc/refman/5.6/en/condition-handling.html)

## 事务和锁 Transactions and Locking

- [Transactions](Transactions/Readme.md)
- [Locking](Locking/Readme.md)

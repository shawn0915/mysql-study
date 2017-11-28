# Development
开发设计


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
- [Data Types](model/DataTypes.md)
- [IndexConstraint](model/IndexConstraint.md)

## SQL开发

- [SQL语言(Structured Query Language)](../sql_scripts/sql_dev/sql_demo.sql)
- 语法标准
  - ANSI SQL-89
  - ANSI SQL-92
  - ANSI SQL:1999
  - ANSI SQL:2003
  - ANSI SQL:2008
  - ANSI SQL:2011
  - ANSI SQL:2016
- 范式
- 设计规范
- [审核 Audit](audit/Audit.md)
  - [audit log](../mgmt/Maintenance/Log/audit_log.md)

## Transactions and Locking
事务和锁

- [Transactions](transactions/Transaction.md)
- [Locking](locking/Locking.md)

## Programming Inside MySQL

- Stored Routines
  - [Stored Procedure](../sql_scripts/sql_program/ex_procedure.sql)
  - [Stored Function](../sql_scripts/sql_program/ex_function.sql)
- [EVENT](../sql_scripts/sql_program/ex_event.sql)
- [TRIGGER](../sql_scripts/sql_program/ex_trigger.sql)
- VIEW
- [Privileges](../sql_scripts/sql_program/ex_privilege.sql)
- [EXAMINE](../sql_scripts/sql_program/examine.sql)

## Reference

- [condition-handling](https://dev.mysql.com/doc/refman/5.6/en/condition-handling.html)
- [example database](https://dev.mysql.com/doc/index-other.html)
- [test-db](https://launchpad.net/test-db/)
- [](https://dev.mysql.com/doc/refman/5.7/en/compatibility.html)
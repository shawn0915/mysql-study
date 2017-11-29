# Optimizing MySQL Performance
Performance Tuning

- Target
- What
  - Server
    - CPU
    - [Disk](server/Disk.md)
    - Memory
      - [SWAP](server/SWAP.md)
    - Network
    - OS
  - Instance
    - [Performance Schema 5.6](../../scripts/sql_opt/sql_performance_schema_5_6.sql)
    - [ ] Performance Schema 5.7
  - [Table](../../scripts/sql_opt/sql_analyse.sql)
    - Innodb Table
    - Data Structure
    - [Index Constraint](../../scripts/sql_opt/sql_index_constraint.sql)
  - SQL
    - query execution plan
    - locking
    - hint
- How
  - Location
    - STATUS `SHOW STATUS;`
    - [EXPLAIN](../../scripts/sql_opt/sql_explain.sql)
    - [PROFILE](../../scripts/sql_opt/sql_profile.sql)
    - [TRACE](../../scripts/sql_opt/sql_trace.sql)
  - Analyse
  - Optimize
- Tuning




## Reference

- [optimization/5.6](https://dev.mysql.com/doc/refman/5.6/en/optimization.html)
- [Locking Operations](https://dev.mysql.com/doc/refman/5.6/en/locking-issues.html)
- [performance-schema-table-descriptions](https://dev.mysql.com/doc/refman/5.6/en/performance-schema-table-descriptions.html)
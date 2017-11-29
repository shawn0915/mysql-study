/*
√ mysql
√ mysqladmin
√ mysqlbinlog
√ mysqlcheck
√ mysqldump
√ mysqldumpslow
mysqlimport
mysqlshow
√ mysqlslap

myisamchk
 */

-- mysqladmin
mysqladmin --help
mysqladmin status
mysqladmin variables
mysqladmin processlist
mysqladmin shutdown

-- mysqlbinlog
mysqlbinlog mysql-bin.000001

-- mysqlcheck
/*
  - Works with InnoDB, MyISAM, and ARCHIVE tables
  - Three levels of checking
    - Table-specific
    - Database-specific
    - All databases
 */
mysqlcheck --login-path=admin world_innodb City Country

-- mysqldump
mysqldump -l MyISAM
mysqldump --single -transation Innodb

-- mysqldumpslow
mysqldumpslow mysql-slow.log

-- mysqlslap
mysqlslap --iterations=5000 --concurrency=50 --query=workload.sql
--create=schema.sql --delimiter=";"
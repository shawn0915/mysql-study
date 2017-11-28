# Table Maintenance


```mysql
ANALYZE TABLE
CHECK TABLE
CHECKSUM TABLE
REPAIR TABLE
OPTIMIZE TABLE
```

## ANALYZE TABLE

  - During the analysis, MySQL locks the table with a **read lock** for InnoDB and MyISAM.
  - This statement is equivalent to using ```mysqlcheck --analyze```.
  - Requires SELECT and INSERT privileges for the table
  - Supports partitioned tables. You can also use ```ALTER TABLE...ANALYZE PARTITION```
    to check one or more partitions.
  
```mysql
(root@localhost) [sakila] 15:00:59> ANALYZE LOCAL TABLE Country;
+----------------+---------+----------+----------+
| Table          | Op      | Msg_type | Msg_text |
+----------------+---------+----------+----------+
| sakila.country | analyze | status   | OK       |
+----------------+---------+----------+----------+
1 row in set (0.01 sec)

```

## CHECK TABLE

  - Works with InnoDB, CSV, MyISAM, and ARCHIVE tables
  - Supports partitioned tables. You can also use ```ALTER TABLE...CHECK PARTITION``` to check one or more partitions.
  - Can also check views for problems, such as tables that are referenced in the view
    definition that no longer exist
  - If ```CHECK TABLE``` finds a problem for an **InnoDB** table
    - The server shuts down to prevent error propagation
    - MySQL writes an error to the error log
  - For **MyISAM** tables, the key statistics are updated as well
  - If the table is marked as ```corrupted``` or ```not closed properly``` but CHECK TABLE does
    not find any problems in the table, it marks the table as OK.

```mysql

(root@localhost) [sakila] 15:00:24> CHECK TABLE City;
+-------------+-------+----------+----------+
| Table       | Op    | Msg_type | Msg_text |
+-------------+-------+----------+----------+
| sakila.city | check | status   | OK       |
+-------------+-------+----------+----------+
1 row in set (0.01 sec)

```

## CHECKSUM TABLE

  - ```CHECKSUM TABLE``` requires the ```SELECT``` privilege for the table.
  - If the QUICK option is used
    - A live table checksum is reported if it is available; NULL is reported otherwise.
      This is very fast
    - Enable live checksum on MyISAM tables by specifying the ```CHECKSUM=1``` table
      option when you create the table
  - use hashing function

```mysql
(root@localhost) [sakila] 15:30:01> CHECKSUM TABLE City;
+-------------+------------+
| Table       | Checksum   |
+-------------+------------+
| sakila.city | 2215934930 |
+-------------+------------+
1 row in set (0.00 sec)

(root@localhost) [sakila] 15:30:03> CHECKSUM TABLE TEST;
+-------------+----------+
| Table       | Checksum |
+-------------+----------+
| sakila.test |     NULL |
+-------------+----------+
1 row in set, 1 warning (0.00 sec)
```

## REPAIR TABLE

- Repairs a possibly corrupted MyISAM or ARCHIVE table
  - Does not support InnoDB
- Supports partitioned tables
- REPAIR TABLE options
  - QUICK
  - EXTENDED
  - USE_FRM
  - NO_WRITE_TO_BINLOG or LOCAL

```mysql

(root@localhost) [mysql] 15:53:14> REPAIR TABLE mysql.help_relation;
+---------------------+--------+----------+----------+
| Table               | Op     | Msg_type | Msg_text |
+---------------------+--------+----------+----------+
| mysql.help_relation | repair | status   | OK       |
+---------------------+--------+----------+----------+
1 row in set (0.01 sec)

```

## OPTIMIZE TABLE

  - Locks the table during optimization
  - Updates index statistics
  - Works with InnoDB, MyISAM, and ARCHIVE tables
  - Supports partitioned tables. You can also use ```ALTER TABLE...OPTIMIZE PARTITION``` to check one or more partitions.
  - With InnoDB tables, OPTIMIZE TABLE is mapped to ```ALTER TABLE```, which rebuilds the table
    to update index statistics and free unused space in the clustered index.
  - ```OPTIMIZE TABLE``` works best when you use it on a table that is fully populated and does not change much. The
    benefits of optimization diminish if the data changes a lot, and you have to optimize often.

```mysql

-- Innodb
(root@localhost) [sakila] 15:34:33> OPTIMIZE TABLE City;
+-------------+----------+----------+-------------------------------------------------------------------+
| Table       | Op       | Msg_type | Msg_text                                                          |
+-------------+----------+----------+-------------------------------------------------------------------+
| sakila.city | optimize | note     | Table does not support optimize, doing recreate + analyze instead |
| sakila.city | optimize | status   | OK                                                                |
+-------------+----------+----------+-------------------------------------------------------------------+
2 rows in set (0.10 sec)

-- MyISAM
(root@localhost) [mysql] 15:46:04> OPTIMIZE TABLE help_category;
+---------------------+----------+----------+----------+
| Table               | Op       | Msg_type | Msg_text |
+---------------------+----------+----------+----------+
| mysql.help_category | optimize | status   | OK       |
+---------------------+----------+----------+----------+
1 row in set (0.00 sec)

```
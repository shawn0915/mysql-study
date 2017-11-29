/*
Index Constraint
 */

/*
查看索引
 */

USE sakila;
(shawn@localhost) [sakila] 13:58:39> SHOW INDEX FROM city\G
*************************** 1. row ***************************
        Table: city
   Non_unique: 0
     Key_name: PRIMARY
 Seq_in_index: 1
  Column_name: city_id
    Collation: A
  Cardinality: 600
     Sub_part: NULL
       Packed: NULL
         Null: 
   Index_type: BTREE
      Comment: 
Index_comment: 
*************************** 2. row ***************************
        Table: city
   Non_unique: 1
     Key_name: idx_fk_country_id
 Seq_in_index: 1
  Column_name: country_id
    Collation: A
  Cardinality: 300
     Sub_part: NULL
       Packed: NULL
         Null: 
   Index_type: BTREE
      Comment: 
Index_comment: 
2 rows in set (0.00 sec)



USE information_schema;
(shawn@localhost) [information_schema] 17:22:29> show status like "Handler_read%";
+-----------------------+-------+
| Variable_name         | Value |
+-----------------------+-------+
| Handler_read_first    | 0     |
| Handler_read_key      | 0     |	索引不常用
| Handler_read_last     | 0     |
| Handler_read_next     | 0     |
| Handler_read_prev     | 0     |
| Handler_read_rnd      | 0     |
| Handler_read_rnd_next | 127   |	查询效率
+-----------------------+-------+
7 rows in set (0.00 sec)


/*
表空间回收
 */

alter table tbl_name engine=innodb;

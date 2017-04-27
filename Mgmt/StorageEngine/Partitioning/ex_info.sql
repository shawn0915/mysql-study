-- TABLE STATUS
SHOW CREATE TABLE ORDERS_HASH;

SHOW TABLE STATUS LIKE 'orders_hash';

-- TABLE SCHEMA
SELECT
  TABLE_NAME,
  GROUP_CONCAT(PARTITION_NAME)
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'test'
GROUP BY TABLE_NAME;

/*
+----------------+-----------------------+
| PARTITION_NAME | PARTITION_DESCRIPTION |
+----------------+-----------------------+
| p0             | 1,3,4,17              |
| p1             | 2,12,14               |
| p2             | 6,8,20                |
| p3             | 5,7,9,11,16           |
| p4             | 10,13,15,18           |
+----------------+-----------------------+
*/

-- TABLE NAME
SELECT
  PARTITION_NAME,
  PARTITION_DESCRIPTION
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'orders_list'
      AND TABLE_SCHEMA = 'test';

/*
+----------------+-----------------------+
| PARTITION_NAME | PARTITION_DESCRIPTION |
+----------------+-----------------------+
| p0             | 1,3,4,17              |
| p1             | 2,12,14               |
| p2             | 6,8,20                |
| p3             | 5,7,9,11,16           |
| p4             | 10,13,15,18           |
+----------------+-----------------------+

*/


-- EXPLAIN PARTITIONS

EXPLAIN PARTITIONS SELECT * FROM orders_range ;

/*
*************************** 1. row ***************************
id: 1
select_type: SIMPLE
table: orders_range
partitions: p0,p1,p2,p3,p4
type: ALL
possible_keys: NULL
key: NULL
key_len: NULL
ref: NULL
rows: 5
Extra: NULL
1 row in set (0.00 sec)

 */

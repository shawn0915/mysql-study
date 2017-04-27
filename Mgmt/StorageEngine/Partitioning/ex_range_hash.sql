-- RANGE HASH

/*
The orders_range_hash table is partitioned by RANGE and subpartitioned by HASH. In other words,
each of the RANGE partitions is divided into HASH (sub)partitions for a total of 5 * 2 = 10 subpartitions.
*/

-- orders_range_hash
CREATE TABLE orders_range_hash (
  id INT AUTO_INCREMENT,
  customer_surname VARCHAR(30),
  store_id INT,
  salesperson_id INT,
  order_date DATE,
  note VARCHAR(500),
  INDEX idx (id)
) ENGINE = InnoDB
  PARTITION BY RANGE(id)
  SUBPARTITION BY HASH(store_id)
  SUBPARTITIONS 2 (
  PARTITION p0 VALUES LESS THAN(10000),
  PARTITION p1 VALUES LESS THAN(20000),
  PARTITION p2 VALUES LESS THAN(30000),
  PARTITION p3 VALUES LESS THAN(40000),
  PARTITION p4 VALUES LESS THAN(50000)
  );


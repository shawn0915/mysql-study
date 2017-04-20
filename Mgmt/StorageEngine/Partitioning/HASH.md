# HASH

```mysql
CREATE TABLE orders_hash (
  id INT AUTO_INCREMENT PRIMARY KEY, customer_surname VARCHAR(30),
  store_id INT, salesperson_id INT, order_date DATE,
  note VARCHAR(500)) ENGINE = InnoDB
  PARTITION BY HASH(id) PARTITIONS 4;
```




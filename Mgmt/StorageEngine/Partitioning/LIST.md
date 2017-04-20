# LIST

```mysql
CREATE TABLE orders_list (
  id INT AUTO_INCREMENT, customer_surname VARCHAR(30), store_id INT,
  salesperson_id INT, order_date DATE, note VARCHAR(500),
  INDEX idx (id)) ENGINE = InnoDB
  PARTITION BY LIST(store_id) (
  PARTITION p0 VALUES IN (1, 3, 4, 17),
  PARTITION p1 VALUES IN (2, 12, 14),
  PARTITION p2 VALUES IN (6, 8, 20),
  PARTITION p3 VALUES IN (5, 7, 9, 11, 16),
  PARTITION p4 VALUES IN (10, 13, 15, 18)
  );
```











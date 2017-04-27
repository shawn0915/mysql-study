-- KEY

-- orders_key
CREATE TABLE orders_key (
  id INT AUTO_INCREMENT,
  customer_surname VARCHAR(30),
  store_id INT,
  salesperson_id INT,
  order_date DATE,
  note VARCHAR(500),
  INDEX idx (id)
) ENGINE = InnoDB
  PARTITION BY KEY(order_date) PARTITIONS 4;


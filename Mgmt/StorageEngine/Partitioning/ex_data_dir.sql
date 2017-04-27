CREATE TABLE entries (
  id      INT,
  entered DATE
) PARTITION BY RANGE (YEAR(entered)) (
  PARTITION p0 VALUES LESS THAN (2000) DATA DIRECTORY = '/data/mysql/data/p0',
  PARTITION p1 VALUES LESS THAN MAXVALUE DATA DIRECTORY = '/data/mysql/data/p1'
  );
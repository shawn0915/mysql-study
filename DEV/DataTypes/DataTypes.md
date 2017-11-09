# Data Types
数据类型

## Numeric

- Integer
- Floating-Point
- Fixed-Point
- BIT

## Character(String)

- Text
  - VARCHAR
    - MAX 65,535 characters
- Integer
  - ENUM
  - SET

## Binary

- Binary
- BLOB
  - MAX 65,535 bytes

## Temporal

- DATE
- TIME
- DATETIME
- TIMESTAMP
- YEAR

## Spatial Data Types

- Entity
- Space
- Definable location

> MyISAM supports both spatial and non-spatial indexes.

## JSON

```mysql
CREATE TABLE t1 (
a JSON,
b INT,
g INT GENERATED ALWAYS AS (a->"$.id"),
h INT GENERATED ALWAYS AS (a->"$.storeid"),
INDEX i (g),
INDEX j (h)
);
-- 
SELECT
CONCAT(a->"$.fname", ' ', a->"$.lname") AS name,
a->"$.id" AS id,
a->"$.storeid" AS store
FROM t1
WHERE g > 500
ORDER BY a->"$.storeid", a->"$.lname";
```

## * NULL


## REF

- [refman-data-types](https://dev.mysql.com/doc/refman/5.6/en/data-types.html)
- [mysql-json](https://dev.mysql.com/doc/refman/5.7/en/json.html)



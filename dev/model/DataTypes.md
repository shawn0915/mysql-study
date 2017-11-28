# Data Types
数据类型

## Content

- [Numeric](#numeric)
- [String](#string)
- [Binary](#binary)
- [Temporal](#temporal)
- [Spatial](#spatial)
- [JSON](#json)

## Numeric

- Integer
- Floating-Point
- Fixed-Point
- BIT

## String
Character

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

## Spatial

- Entity
- Space
- Definable location

> MyISAM supports both spatial and non-spatial indexes.

## NULL

The NULL value means "no data."

## JSON
Support from MySQL 5.7.8

- [sql_demo_json](../../scripts/sql_dev/DataType_json.sql)


## Reference

- [refman-56-data-types](https://dev.mysql.com/doc/refman/5.6/en/data-types.html)
- [refman-57-data-types](https://dev.mysql.com/doc/refman/5.7/en/data-types.html)
- [NULL Values](https://dev.mysql.com/doc/refman/5.7/en/null-values.html)
- [mysql-json](https://dev.mysql.com/doc/refman/5.7/en/json.html)
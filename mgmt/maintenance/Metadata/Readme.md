# Metadata

> INFORAMTION_SCHEMA

- Table Information
- Partitioning
- Privileges
- Character Set Support
- Constraints and Indexes
- Server Settings and Status
- Routines and Related Information
- Innodb

> INFORMATION_SCHEMA Tables

```mysql
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'information_schema'
ORDER BY TABLE_NAME;
```

> INFORMATION_SCHEMA Table Columns

```mysql
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'INFORMATION_SCHEMA'
      AND TABLE_NAME = 'VIEWS';
```

> INFORMATION_SCHEMA: Examples

```mysql
-- engines
SELECT TABLE_NAME, ENGINE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'sakila';

SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE DATA_TYPE = 'set';

SELECT CHARACTER_SET_NAME, COLLATION_NAME
FROM INFORMATION_SCHEMA.COLLATIONS
WHERE IS_DEFAULT = 'Yes';

SELECT TABLE_SCHEMA, COUNT(*)
FROM INFORMATION_SCHEMA.TABLES
GROUP BY TABLE_SCHEMA;
```

> Creating Shell Commands with INFORMATION_SCHEMA Tables

```mysql
SELECT CONCAT("mysqldump -uroot -p ",
              TABLE_SCHEMA," ", TABLE_NAME, " >> ",
              TABLE_SCHEMA,".bak.sql")
FROM TABLES 
WHERE TABLE_NAME LIKE 'Country%';
```
```bash
mysqldump -uroot -p sakila country >> sakila.bak.sql
```

```mysql
SELECT CONCAT('CREATE TABLE ', TABLE_SCHEMA, '.',
TABLE_NAME, '_backup LIKE ', TABLE_SCHEMA, '.',
TABLE_NAME, ';') 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'sakila';
```
```mysql
CREATE TABLE sakila.actor_backup LIKE sakila.actor;
CREATE TABLE sakila.actor_info_backup LIKE sakila.actor_info;
CREATE TABLE sakila.address_backup LIKE sakila.address;
CREATE TABLE sakila.bas_area_backup LIKE sakila.bas_area;
CREATE TABLE sakila.category_backup LIKE sakila.category;
CREATE TABLE sakila.city_backup LIKE sakila.city;
CREATE TABLE sakila.country_backup LIKE sakila.country;
CREATE TABLE sakila.customer_backup LIKE sakila.customer;
CREATE TABLE sakila.customer_list_backup LIKE sakila.customer_list;
CREATE TABLE sakila.daily_hit_counter_backup LIKE sakila.daily_hit_counter;
CREATE TABLE sakila.film_backup LIKE sakila.film;
CREATE TABLE sakila.film_actor_backup LIKE sakila.film_actor;
CREATE TABLE sakila.film_category_backup LIKE sakila.film_category;
CREATE TABLE sakila.film_list_backup LIKE sakila.film_list;
CREATE TABLE sakila.film_text_backup LIKE sakila.film_text;
CREATE TABLE sakila.inventory_backup LIKE sakila.inventory;
CREATE TABLE sakila.language_backup LIKE sakila.language;
CREATE TABLE sakila.nicer_but_slower_film_list_backup LIKE sakila.nicer_but_slower_film_list;
CREATE TABLE sakila.payment_backup LIKE sakila.payment;
CREATE TABLE sakila.rental_backup LIKE sakila.rental;
CREATE TABLE sakila.sales_by_film_category_backup LIKE sakila.sales_by_film_category;
CREATE TABLE sakila.sales_by_store_backup LIKE sakila.sales_by_store;
CREATE TABLE sakila.staff_backup LIKE sakila.staff;
CREATE TABLE sakila.staff_list_backup LIKE sakila.staff_list;
CREATE TABLE sakila.store_backup LIKE sakila.store;

```



# REF

- [refman-information-schema](https://dev.mysql.com/doc/refman/5.6/en/information-schema.html)



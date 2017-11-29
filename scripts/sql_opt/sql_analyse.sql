/*
优化表的数据类型
 */
use sakila;
select * from country procedure analyse();


USE sakila;
-- PROCEDURE ANALYSE(100, 256)
SELECT city_id, city, country_id FROM City PROCEDURE ANALYSE(250,1024);
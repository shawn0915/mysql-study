GRANT ALL ON sakila.* TO 'shawn'@'%';
-- 匹配sakila开头的schema
GRANT ALL ON `sakila%`.* TO 'shawn'@'%';

GRANT EXECUTE, ALTER ROUTINE ON PROCEDURE sakila.record_count TO 'shawn'@'%';
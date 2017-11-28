GRANT ALL ON sakila.* TO 'shawn'@'%';
-- 匹配sakila开头的schema
GRANT ALL ON `sakila%`.* TO 'shawn'@'%';

GRANT EXECUTE, ALTER ROUTINE ON PROCEDURE sakila.record_count TO 'shawn'@'%';


/*
privilege -- TRIGGER
 */

CREATE TRIGGER;
DROP TRIGGER;

/*
privilege -- EVENT
You must have the **SUPER** privilege to set the global event_scheduler variable.
 */

create, modify, or delete events
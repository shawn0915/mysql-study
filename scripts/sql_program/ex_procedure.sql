USE sakila;

DELIMITER //
CREATE PROCEDURE record_count()
  BEGIN
    SELECT
      'Country count ',
      COUNT(*)
    FROM Country;
    SELECT
      'City count ',
      COUNT(*)
    FROM City;
    SELECT
      'CountryLanguage count',
      COUNT(*)
    FROM CountryLanguage;
  END//
DELIMITER ;

/*
CALL statement
 */
CALL record_count();

-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------

USE test;

CREATE TABLE actor(actor_id int, first_name varchar(10), last_name varchar(10));

-- loop leave
CREATE PROCEDURE actor_insert()
  BEGIN
    set @x = 0;
    ins: LOOP
      set @x = @x + 1;
      IF @x = 10 THEN
        leave ins;
      ELSEIF mod(@x,2) = 0 THEN
        ITERATE ins;
      END IF;
      INSERT INTO actor(actor_id,first_name,last_name) VALUES (@x+200,'TEST',@x);
    END LOOP ins;
  END;
$$

CALL actor_insert();

-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------

USE test;

create table test_table(
  tid int ,
  tname varchar(20)
);

DROP PROCEDURE IF EXISTS insert_many_rows;

delimiter //
create PROCEDURE insert_many_rows (in loops int)
  BEGIN
    DECLARE v1 int;
    set v1 = loops;
    WHILE v1 > 0 DO
      insert into test_table VALUES ( v1, 'qqqqqqqqqqwwwwwwwwww');
      set v1 = v1 - 1;
    end WHILE;
  END;
//

DELIMITER ;

CALL insert_many_rows(10);


-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------

USE test;

DELIMITER $$
DROP PROCEDURE IF EXISTS P_TEST $$

CREATE PROCEDURE P_TEST()
  BEGIN
    SELECT NOW() FROM DUAL;
  END;

$$
DELIMITER ;

CALL P_TEST();

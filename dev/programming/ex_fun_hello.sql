USE sakila;


-- function hello
DELIMITER //

CREATE FUNCTION hello()
  RETURNS VARCHAR(20)
NO SQL
  BEGIN
    RETURN 'Hello MySQL.';
  END //

DELIMITER ;

SELECT hello(); -- Hello MySQL.
SELECT sakila.hello(); -- Hello MySQL.


-- function sayhello
DROP FUNCTION if EXISTS sayhello;
DELIMITER //

CREATE FUNCTION sayhello(username VARCHAR(10))
  RETURNS VARCHAR(20)
  NO SQL

  BEGIN
    RETURN concat('Hello, ', username);
  END //

DELIMITER ;


SELECT sakila.sayhello('Rachel');


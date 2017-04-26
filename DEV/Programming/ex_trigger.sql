USE sakila;

CREATE TRIGGER City_AD
AFTER DELETE
  ON City
FOR EACH ROW
  INSERT INTO city_backup (city_id, city)
  VALUES (OLD.city_id, OLD.city);


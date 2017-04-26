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
USE sakila;

DELIMITER //
CREATE FUNCTION pay_check(gross_pay FLOAT(9, 2), tax_rate FLOAT(3, 2))
  RETURNS FLOAT(9, 2)
NO SQL
  BEGIN
    DECLARE net_pay FLOAT(9, 2) DEFAULT 0;
    SET net_pay = gross_pay - gross_pay * tax_rate;
    RETURN net_pay;
  END//
DELIMITER ;
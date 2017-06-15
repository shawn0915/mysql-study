SELECT
  `ID`,
  `USER`,
  `HOST`,
  `DB`,
  `COMMAND`,
  `TIME`,
  `STATE`,
  LEFT(`INFO`, 51200) AS `Info`
FROM `information_schema`.`PROCESSLIST`;

SHOW PROCESSLIST ;
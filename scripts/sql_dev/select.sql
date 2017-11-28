/*
schema base info

mysql56
mysql57 disable
 */

SELECT
  TABLE_SCHEMA,
  `ENGINE`,
  COUNT(*),
  SUM(data_length) total_size
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
GROUP BY TABLE_SCHEMA, 'ENGINE';

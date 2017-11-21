/*
查看一组变量的值，上一次查询的值，以及它们之间的差值

mysql56
mysql57 disable
 */ 

SELECT STRAIGHT_JOIN
  lower(gs0.variable_name) AS variable_name,
  gs0.variable_value AS value_0,
  gs1.variable_value AS value_1,
  (gs1.variable_value - gs0.variable_value) AS diff,
  (gs1.variable_value - gs0.variable_value) / 10 per_sec,
  (gs1.variable_value - gs0.variable_value) * 60 / 10 per_min
FROM (
       SELECT
         variable_name,
         variable_value
       FROM information_schema.global_status
       UNION ALL
       SELECT
         '',
         sleep(10) -- 暂停10s
       FROM dual
     ) AS gs0
  JOIN information_schema.global_status gs1 USING (variable_name)
WHERE gs1.variable_value <> gs0.variable_value
;
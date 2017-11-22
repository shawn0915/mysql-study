/*
Data Type: JSON
 */
CREATE TABLE t1 (
  a JSON,
  b INT,
  g INT GENERATED ALWAYS AS (a->"$.id"),
  h INT GENERATED ALWAYS AS (a->"$.storeid"),
  INDEX i (g),
  INDEX j (h)
);


SELECT
  CONCAT(a->"$.fname", ' ', a->"$.lname") AS name,
  a->"$.id" AS id,
  a->"$.storeid" AS store
FROM t1
WHERE g > 500
ORDER BY a->"$.storeid", a->"$.lname";
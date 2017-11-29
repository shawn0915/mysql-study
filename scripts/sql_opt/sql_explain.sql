/*
EXPLAIN
 */
EXPLAIN EXTENDED
SHOW WARNINGS
EXPLAIN PARTITIONS


EXPLAIN FORMAT = JSON
SELECT city, country_id FROM city;

/*
{
"query_block": {
"select_id": 1,
"table": {
"table_name": "city",
"access_type": "ALL",
"rows": 600,
"filtered": 100
}
}
}
 */

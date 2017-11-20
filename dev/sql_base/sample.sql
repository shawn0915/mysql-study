-- system time
SELECT now();
SELECT now() FROM dual;

SELECT unix_timestamp(); -- 1493281295
SELECT from_unixtime(unix_timestamp()); -- 2017-04-27 16:21:46

-- set var
SET @name = 'shawn';
SELECT @name;

-- random
SELECT rand();
SELECT floor(10 * rand());

-- format
SELECT format(1234567.89, 2); -- 1,234,567.89
SELECT format(1234567.89, 4); -- 1,234,567.8900

-- lpad 补位
SELECT lpad('1',3,'0'); -- 001

-- md5
SELECT md5('1'); -- c4ca4238a0b923820dcc509a6f75849b
SELECT md5('123456'); -- e10adc3949ba59abbe56e057f20f883e
SELECT md5(password(123456)); -- f322b258626e505ee870bfb67ea3646f

SELECT password('123456'); -- *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9

-- sha1
SELECT sha1('1'); -- 356a192b7913b04c54574d18c28d46e6395428ab
SELECT sha1('123456'); -- 7c4a8d09ca3762af61e59520943dc26494f8941b





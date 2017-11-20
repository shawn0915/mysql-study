-- 计数器表
create table daily_hit_counter (
day date not null,
slot tinyint UNSIGNED not null,
cnt int UNSIGNED not null,
PRIMARY KEY (day, slot)
);

-- 每隔一段时间开始一个新的计数器（每天）
INSERT INTO daily_hit_counter(day, slot, cnt)
VALUES(CURRENT_DATE,RAND()*100,1)
ON DUPLICATE KEY UPDATE cnt = cnt + 1;

-- 合并所有结果的0号槽，并删除所有其他的槽
UPDATE daily_hit_counter AS c
	INNER JOIN(
		SELECT day, SUM(cnt) as cnt,MIN(slot) as mslot
		from daily_hit_counter
		GROUP BY DAY
	) AS x USING(day)
SET c.cnt = IF(c.slot = x.mslot, x.cnt, 0),
		c.slot = IF(c.slot = x.mslot, 0, c.slot);

DELETE FROM daily_hit_counter WHERE slot <> 0 AND cnt = 0;


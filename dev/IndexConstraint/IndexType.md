type显示的是访问类型，是较为重要的一个指标，结果值从好到坏依次是：

```
system > const > eq_ref > ref > fulltext > ref_or_null > index_merge > unique_subquery > index_subquery > range > index > ALL
```

一般来说，得保证查询至少达到range级别，最好能达到ref。

possible_keys

指出MySQL能使用哪个索引在该表中找到行。如果是空的，没有相关的索引。这时要提高性能，可通过检验WHERE子句，看是否引用某些字段，或者检查字段不是适合索引。

key

显示MySQL实际决定使用的键。如果没有索引被选择，键是NULL。

key_len

显示MySQL决定使用的键长度。如果键是NULL，长度就是NULL。文档提示特别注意这个值可以得出一个多重主键里mysql实际使用了哪一部分。

ref

显示哪个字段或常数与key一起被使用。

rows

这个数表示mysql要遍历多少数据才能找到，在innodb上是不准确的。

Extra

如果是Only index，这意味着信息只用索引树中的信息检索出的，这比扫描整个表要快。

如果是where used，就是使用上了where限制。

如果是impossible where 表示用不着where，一般就是没查出来啥。
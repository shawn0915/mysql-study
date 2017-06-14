# sysbench常用参数说明

```bash
--mysql-host=localhost #数据库host
--mysql-port=3306 #数据库端口 
--mysql-user=your_username #数据库用户名 
--mysql-password=your_password #数据库密码 
--mysql-db=your_db_for_test #数据库名 
--oltp-tables-count=10 #模拟的表的个数，规格越高该值越大 
--oltp-table-size=6000000 #模拟的每张表的行数，规格越高该值越大 
--num-threads=50 #模拟的并发数量，规格越高该值越大 
--max-requests=100000000 #最大请求次数 
--max-time=20 #最大测试时间（与--max-requests只要有一个超过，则退出） 
--report-interval=1 #每1秒打印一次当前的QPS等值 
--test=/tmp/sysbench-0.5/sysbench/tests/db/oltp.lua #选用的测试脚本(lua)，此脚本可以从sysbench-0.5源代码文件目录下找 [prepare | run | cleanup] #prepare准备数据，run执行测试，cleanup清理数据
```
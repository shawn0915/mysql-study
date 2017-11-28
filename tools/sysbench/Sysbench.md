# Sysbench
v0.5

## Install

- Build Requirements

```bash
yum install -y automake libtool* mysql-devel
```

## Usage

```bash
sysbench --test=oltp
--mysql-table-engine=innodb
--oltp-table-size=9000000
--num-threads=100
--max-requests=1000
--mysql-host=
--mysql-port=
--mysql-user=
--mysql-password=
--mysql-db=
--mysql-socket=/tmp/mysql.sock
run
```

## Reference

- [akopytov/sysbench](https://github.com/akopytov/sysbench)
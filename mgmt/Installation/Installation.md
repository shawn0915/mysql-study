# Installation

## Operating System

- Unix (AIX/Solaris)
- Linux (RHEL/CentOS/ubuntu/SUSE)
- Windows
- OS X

## RHEL7

```bash
yum install -y mysql-community-server-5.7.20-1.el7.x86_64.rpm mysql-community-client-5.7.20-1.el7.x86_64.rpm mysql-community-common-5.7.20-1.el7.x86_64.rpm mysql-community-libs-5.7.20-1.el7.x86_64.rpm mysql-community-libs-compat-5.7.20-1.el7.x86_64.rpm
```

## Docker

mysql-docker

```bash
# build
docker build --rm --no-cache=true -t "shawnyan/docker:mysql57" .
# run
docker run --name mysql57 -p 33306:3306 -e MYSQL_ROOT_PASSWORD=password -d shawnyan/docker:mysql57
# connect
docker exec -it mysql57 mysql -uroot -p
```

## 字符集 character set

- utf8
- utf8mb4
- gbk

## REF

- [installing](https://dev.mysql.com/doc/refman/5.6/en/installing.html)
- [binary-installation](https://dev.mysql.com/doc/refman/5.6/en/binary-installation.html)
- [windows-installation](https://dev.mysql.com/doc/refman/5.6/en/windows-installation.html)
- [mysql-docker](https://github.com/mysql/mysql-docker)

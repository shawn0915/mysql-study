SET NAMES 'utf8';

-- convert
alter table t1 convert to character set utf8mb4;

# vim /etc/my.cnf
# [mysqld]
# init-connect='SET NAMES utf8mb4'
# character-set-server=utf8mb4
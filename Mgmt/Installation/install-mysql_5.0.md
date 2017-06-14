
```bash
groupadd mysql
useradd -r -g mysql mysql
cd /usr/local
tar zxvf /path/to/mysql-VERSION-OS.tar.gz
ln -s full-path-to-mysql-VERSION-OS mysql
cd mysql
chown -R mysql .
chgrp -R mysql .
scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data
chown -R root .
chown -R mysql data

cp support-files/my-small.cnf /etc/my.cnf
bin/mysqld_safe --user=mysql &
```





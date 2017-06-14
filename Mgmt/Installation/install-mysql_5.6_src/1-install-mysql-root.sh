#!/bin/bash

echo "***** DEL MARIADB *****"
rpm -qa | grep mariadb | xargs rpm -e --nodeps

echo "***** INSTALL MYSQL DEPS *****"
yum install -y gcc.x86_64 gcc-c++.x86_64 cmake ncurses-devel perl perl-Data-Dumper glibc.x86_64

echo "***** Done! *****"

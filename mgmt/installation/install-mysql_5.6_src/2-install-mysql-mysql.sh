#!/bin/bash

echo "***** INSTALL MYSQL 5.6.30 *****"

PKG_DIR=`pwd`
INSTALL_DIR="/opt/mysql"
DATA_DIR="/data/mysql/data"
PORT="3306"
#USER_NAME="mysql"
USER_NAME=`whoami`

# Install
cd ${PKG_DIR}
tar zxvf mysql-5.6.30.tar.gz
cd mysql-5.6.30
cmake . -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DMYSQL_TCP_PORT=${PORT} -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DMYSQL_DATADIR=${DATA_DIR}
make && make install

# Init MySQL
mkdir -pv ${DATA_DIR}
cd ${INSTALL_DIR}/scripts
./mysql_install_db --user=${USER_NAME} --basedir=${INSTALL_DIR} --datadir=${DATA_DIR}

echo "***** Done! *****"

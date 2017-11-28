#!/bin/bash

echo "***** START MYSQL *****"

INSTALL_DIR=/opt/mysql

${INSTALL_DIR}/bin/mysqld_safe &

echo "***** Done! *****"

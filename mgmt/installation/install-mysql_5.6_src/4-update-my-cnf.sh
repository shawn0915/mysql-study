#!/bin/bash

# Def Var
PWD=`pwd`
CNF_DIR=${PWD}
MYSQL_HOME="/opt/mysql"
MY_CNF="my-master.cnf"

# Updata my.cnf
cd ${MYSQL_HOME}
if [ -d my.cnf ]; then
	mv my.cnf my.cnf.org
fi

cd ${CNF_DIR}
cp -v ${MY_CNF} ${MYSQL_HOME}/my.cnf
cat ${MYSQL_HOME}/my.cnf

echo "***** Done *****"

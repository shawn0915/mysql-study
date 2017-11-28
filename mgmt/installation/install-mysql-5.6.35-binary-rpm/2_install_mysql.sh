#!/bin/bash

# Ps. Need sudo privilege.

# PARAMETER:RPM|BINARY
if [ 'RPM' == "$1" ] || [ 'rpm' == "$1" ] || [ 'BINARY' == "$1" ] || [ 'binary' == "$1" ] ; then
	echo "MODE:$1"
else
	echo "Usage:sh install-mysql.sh RPM|BINARY | tee install-mysql.log" ; exit
fi

# Def
GROUP='mysql'
USER='mysql'
PWD_DEFAULT='password'
PWD_MYSQL='password'
CUSTOM_MYCNF="my_5.6_shawn.cnf"
if [ ! -f ${CUSTOM_MYCNF} ] ; then
	echo "${CUSTOM_MYCNF} is not exists." ; exit
fi
if [ 'BINARY' == "$1" ] || [ 'binary' == "$1" ] ; then
	# BINARY
	DIR_NAME='mysql-5.6.35-linux-glibc2.5-x86_64'
	PKG_NAME="${DIR_NAME}.tar.gz"
	MYSQL_INSTALL='/usr/local'
	MYSQL_HOME="${MYSQL_INSTALL}/mysql"
	mkdir -pv ${MYSQL_INSTALL};
	if [ -f "${PKG_NAME}" ];then echo "PKG_NAME=${PKG_NAME}"
	else echo 'Package is not exists.' ; exit
	fi	
else
	# RPM
	PKG_NAME="MySQL-5.6.35-1.el7.x86_64.rpm-bundle.tar"
	MYSQL_HOME="/usr/bin"
	if [ -f "${PKG_NAME}" ];then echo "PKG_NAME=${PKG_NAME}"
	else echo 'Package is not exists.' ; exit
	fi	
fi
MYSQL_DATA='/data/mysql/data'
MYSQL_LOG='/data/log/mysql'

# Remove Deps
echo "Remove mariadb ..."
rpm -qa | grep mariadb | xargs rpm -e --nodeps
echo "Remove mysql-libs ..."
yum remove -y mysql-libs

## Create System User : mysql
#echo "Create user mysql ..."
#groupadd ${GROUP}
#useradd -g ${GROUP} ${USER}
##echo ${PWD_DEFAULT} | passwd --stdin ${USER}
id ${USER}

# create group if not exists
egrep "^${GROUP}" /etc/group >& /dev/null
if [ $? -ne 0 ] ; then
	groupadd ${GROUP} ; echo "Create Group : ${GROUP}"
fi

# drop user if exists
userdel -frZ ${USER} ;

# create user if not exists
egrep "^${USER}" /etc/passwd >& /dev/null
if [ $? -ne 0 ] ; then
	useradd -g ${GROUP} ${USER} ; echo "`id ${USER}`"
fi

# passwd user
echo "${PWD_DEFAULT}" | passwd --stdin ${USER}


# Make Directory
mk_dir()
{
if [ ! -d $1 ] ; then
	mkdir -pv $1 ; chown ${USER}.${GROUP} $1 ; ls -al $1
fi
}

mk_dir ${MYSQL_DATA};
mk_dir ${MYSQL_LOG};
mk_dir ${MYSQL_LOG}/audit_log;
mk_dir ${MYSQL_LOG}/record;
# priv for record
chmod 777 ${MYSQL_LOG}/record ; chmod +t ${MYSQL_LOG}/record

# Installing MySQL
echo "Installing MySQL ..."
yum install -y perl-Data-Dumper libaio

if [ 'BINARY' == "$1" ] || [ 'binary' == "$1" ] ; then
	# BINARY
	tar zxvf ${PKG_NAME} -C ${MYSQL_INSTALL}
	ln -s ${MYSQL_INSTALL}/${DIR_NAME} ${MYSQL_INSTALL}/mysql
	chown -R ${USER}.${GROUP} ${MYSQL_INSTALL}/{${DIR_NAME},mysql}
	ls -al ${MYSQL_INSTALL}/{${DIR_NAME},mysql}
else
	# RPM
	tar xvf ${PKG_NAME}
	yum install -y MySQL*rpm
fi

# Update my.cnf
echo "Update my.cnf ..."
if [ -f /etc/my.cnf ] ; then
	rm -f /etc/my.cnf
fi
cp -v ${CUSTOM_MYCNF} /etc/my.cnf

if [ -f /usr/my.cnf ] ; then
	rm -f /usr/my.cnf
fi

# Modify Env
echo "Modify Env ..."
echo -e "
export MYSQL_HOME=${MYSQL_HOME}
export WHOAMI=\`whoami\`
export DATE=\`date +\"%y%m%d_%H%M%S\"\`
alias mysql=\"mysql --tee ${MYSQL_LOG}/record/record_\${DATE}_\${WHOAMI}.log\"
" >> /etc/bashrc
if [ 'BINARY' == "$1" ] || [ 'binary' == "$1" ] ; then
	echo -e "export PATH=\$PATH:\$MYSQL_HOME/bin" >> /etc/bashrc  # BINARY
else
	echo -e "export PATH=\$PATH:\$MYSQL_HOME" >> /etc/bashrc  # RPM
fi
source /etc/bashrc ; tail -n 5 /etc/bashrc
echo -e "
MYSQL_HOME=${MYSQL_HOME}
WHOAMI=${WHOAMI}
DATE=${DATE}
`which mysql`
"

# Init MySQL
if [ 'BINARY' == "$1" ] || [ 'binary' == "$1" ] ; then
	# BINARY
	/usr/local/mysql/scripts/mysql_install_db --user=${USER} --basedir=/usr/local/mysql
else
	# RPM
	mysql_install_db --user=${USER}
fi

# Start MySQL
mysqld_safe &
sleep 1 ; echo -e "\n"

# mysql_secure_installation
echo 'mysql_secure_init...'
#su - ${USER} -c mysql_secure_installation

#/usr/bin/mysqladmin -u root password ${PWD_MYSQL}

#mysql -uroot -p${PWD_MYSQL} -e "
#-- set password for root
#SET PASSWORD = PASSWORD('password');
#-- remove_anonymous_users
#DELETE FROM mysql.user WHERE User='';
#-- remove_remote_root
#DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
#-- remove_test_database
#-- - Dropping test database...
#DROP DATABASE test;
#-- - Removing privileges on test database...
#DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
#-- reload_privilege_tables
#FLUSH PRIVILEGES;
#"

if [ ! -e /usr/bin/expect ]
 then  yum install -y expect
fi
echo '#!/usr/bin/expect
set timeout 60
set password [lindex $argv 0]
spawn mysql_secure_installation
expect {
"enter for none" { send "\r"; exp_continue}
"Y/n" { send "Y\r" ; exp_continue}
"ew password" { send "$password\r"; exp_continue}
"Cleaning up" { send "\r"}
}
interact ' > mysql_secure_installation.exp
chmod u+x mysql_secure_installation.exp
./mysql_secure_installation.exp ${PWD_MYSQL}

echo 'Done!' ; exit 
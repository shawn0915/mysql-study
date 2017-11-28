# Audit Log

- MySQL Audit
  - MySQL Enterprise Audit
    - `--audit_log, --audit_log_file`
- MariaDB Audit

## MariaDB audit log

- 运行过程中安装插件

```mysql
INSTALL PLUGIN server_audit SONAME 'server_audit.so';

SHOW VARIABLES LIKE 'server_audit%';

UNINSTALL PLUGIN server_audit;
```

- 写入配置文件，并防止运行期间卸载

```bash
vim /etc/my.cnf
```

```yaml
plugin_load = audit_log.so
audit_log = FORCE_PLUS_PERMANENT;
```

- 停止服务，安装审计插件

```bash
vim /etc/my.cnf
```

```yaml
[mysqld]
# AUDIT PLUGIN
plugin-load=server_audit.so
server_audit_file_path=/data/log/mysql/audit_log
server_audit_file_rotate_size=50000000
server_audit_file_rotations=200
server_audit_logging=ON
server_audit_query_log_limit=102400
```

- audit log format

```mysql
<AUDIT_RECORD TIMESTAMP="2012-10-12T09:35:15"
  NAME="Connect" CONNECTION_ID="4" STATUS="0"
  USER="root" PRIV_USER="root" OS_LOGIN="" PROXY_USER=""
  HOST="localhost" IP="127.0.0.1" DB=""/>
<AUDIT_RECORD TIMESTAMP="2012-10-12T09:38:33"
  NAME="Query" CONNECTION_ID="4" STATUS="0"
  SQLTEXT="INSERT INTO tbl VALUES(1, 2)"/>
```
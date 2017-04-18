# audit log

## mariadb audit log

> 运行过程中安装插件

```mysql
INSTALL PLUGIN server_audit SONAME 'server_audit.so';

SHOW VARIABLES LIKE 'server_audit%';

UNINSTALL PLUGIN server_audit;
```

> 写入配置文件，并防止运行期间卸载

```
vim /etc/my.cnf

plugin_load = audit_log.so
audit_log = FORCE_PLUS_PERMANENT;
```

> 停止服务，安装审计插件
```
vim /etc/my.cnf

# AUDIT PLUGIN
plugin-load=server_audit=server_audit.so
server_audit_file_path=/data/mysql/logs/audit_log
server_audit_file_rotate_size=50000000
server_audit_file_rotations=200
server_audit_logging=ON
server_audit_query_log_limit=102400
```
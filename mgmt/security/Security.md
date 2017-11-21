# MySQL Security


- Networks Security
  - Firewall
  - authorized clients
  - root access
  - mysql_secure_installation
- Operating System Security
  - 防火墙
  - 网络
  - 账户权限
- File Systems
  - MySQL programs
  - Database directories and files
  - Log, status, and configuration files
- MySQL Security

## User Management

- 初始化root密码
  - MySQL 5.7安装后随机生成的root密码
```bash
grep 'temporary password' /var/log/mysqld.log
``` 
- [MySQL User Account Management](UserManagement/Readme.md)
- [Grant](UserManagement/Grant.md)

## SSL Protocol

- Uses different encryption algorithms to secure data over a public network
- Detects any data change, loss, or replay
- Incorporates algorithms that provide identity verification using the X509 standard

> [SSL Protocol](SSL/Readme.md)

## Audit



## REF

- MySQL Security
  - [security](https://dev.mysql.com/doc/refman/5.6/en/security.html)
  - [faqs-security](https://dev.mysql.com/doc/refman/5.6/en/faqs-security.html)
  - [privilege-system](https://dev.mysql.com/doc/refman/5.6/en/privilege-system.html)
  - [user-account-management](https://dev.mysql.com/doc/refman/5.6/en/user-account-management.html)
  - [secure-connections](https://dev.mysql.com/doc/refman/5.6/en/secure-connections.html)

- Audit
  - [MySQL Enterprise Audit](https://www.mysql.com/products/enterprise/audit.html)
  - [audit-log](https://dev.mysql.com/doc/refman/5.5/en/audit-log.html)


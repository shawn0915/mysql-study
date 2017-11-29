# MySQL Security


- Networks Security
  - Firewall
  - authorized clients
  - root access
  - mysql_secure_installation
- Operating System Security
  - Firewall
  - Network
  - Privilege
- File Systems
  - MySQL programs
  - Database directories and files
  - Log, status, and configuration files
- MySQL Security
  - [SSL Protocol](ssl/SSL.md)

## User Management

- 初始化root密码
  - MySQL 5.7安装后随机生成的root密码
```bash
grep 'temporary password' /var/log/mysqld.log
``` 
- [MySQL User Account Management](UserManagement/Readme.md)
- [Grant](UserManagement/Grant.md)




## Reference

- [security](https://dev.mysql.com/doc/refman/5.6/en/security.html)
- [faqs-security](https://dev.mysql.com/doc/refman/5.6/en/faqs-security.html)
- [privilege-system](https://dev.mysql.com/doc/refman/5.6/en/privilege-system.html)
- [user-account-management](https://dev.mysql.com/doc/refman/5.6/en/user-account-management.html)
- [secure-connections](https://dev.mysql.com/doc/refman/5.6/en/secure-connections.html)
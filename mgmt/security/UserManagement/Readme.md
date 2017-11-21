# MySQL User Account Management

## User Account Verification

- Authentication 鉴权
  - Verifies the user's identity
- Authorization 授权
  - Verifies the user's privileges

## Viewing User Account Settings

```mysql
-- User Account Settings
SELECT user, host, password
FROM mysql.user WHERE user='root';

-- user info, privileges
SELECT * FROM mysql.user;
```

## Native Authentication

- Username
- Password
- Client host

## User Account

```mysql
-- create user
CREATE USER 'shawn'@'localhost' IDENTIFIED BY '123456';
-- set password
SET PASSWORD FOR 'shawn'@'localhost' = PASSWORD('NewPass');
```
```bash
mysqladmin -u root -p -h localhost password `NewPassword`
```
```mysql
SELECT Host, User FROM mysql.user
WHERE Password = '';

SELECT User FROM mysql.user GROUP BY password
HAVING count(user)>1;

-- expire
ALTER USER shawn@localhost PASSWORD EXPIRE;
```
```mysql
-- rename
RENAME USER 'shawn'@'localhost' TO 'shawnyan'@'localhost';
-- drop
DROP USER 'shawnyan'@'localhost';
```

## Pluggable Authentication

- mysql_native_password
  - 41-byte-wide hash
- mysql_old_password
  - used before MySQL4.1.1
- sha256_password
  - SHA-256 hashing

## PAM Authentication Plugin

- an Enterprise Edition plugin that authenticates MySQL accounts against the operating system
- /etc/pam.d
```mysql
CREATE USER user@host
IDENTIFIED WITH authentication_pam
AS 'pam_service, os_group=mysql_user';

CREATE USER ''@'' 
IDENTIFIED WITH authentication_pam
AS 'mysql-pam, sales=m_sales, finance=m_finance';
```

## Password Validation Plugin

- validate_password
- validate_password_policy

## Administrative Privileges

- FILE
- PROCESS
  - SHOW PROCESSLIST
- SUPER
- ALL




## REF

- [user-account-management](https://dev.mysql.com/doc/refman/5.6/en/user-account-management.html)
- [cleartext-authentication-plugin](https://dev.mysql.com/doc/refman/5.6/en/cleartext-authentication-plugin.html)
- [privilege-system](https://dev.mysql.com/doc/mysql-security-excerpt/5.6/en/privilege-system.html)
- [privileges-provided](https://dev.mysql.com/doc/refman/5.6/en/privileges-provided.html)





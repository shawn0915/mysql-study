# Management

**重中之重是保障数据安全, 有效的备份是最后一颗救命稻草**

## Content

- [Architecture](#architecture)
- [Deploy](#deploy)
- [Optimize](#optimize)
- [Monitor](#monitor)
- [Storage Engine](storageEngine/StorageEngines.md)
- [Partitioning](partitioning/Partitioning.md)
- [Tools](tools/Tools.md)


## Architecture
架构

- 硬件架构
  - x86_64
- 系统架构
  - [Memory](Architecture/Memory.md)
  - [Disk](Architecture/Disk.md)
- 网络拓扑
  - [Communication Protocols](Architecture/ComProtocols.md)

## Deploy
部署

- [Installation](Installation/Readme.md)
- [Configuration](Configuration/Readme.md)
- [Maintenance](Maintenance/Readme.md)
  - Log
  - Metadata


## Optimize

- [服务器配置](Optimize/Server.md)
- [优化MySQL性能](Optimize/Readme.md)

## Monitor

- Server
- Instance
- Plugin
- Log

## 变更 Change

- online ddl change => 锁表


## 测试 Testing

- 基准测试
- 性能测试

## 安全 Security

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
- [MySQL安全](Security/Readme.md)

## 诊断、排错 TroubleShooting




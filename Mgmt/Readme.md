# Mgmt

## 部署 Deploy

- [Installation](Installation/Readme.md)
- [Configuration](Configuration/Readme.md)
- [Maintenance](Maintenance/Readme.md)

## 架构 Architecture

- 硬件架构
  - x86_64
- 系统架构
  - [Memory](Architecture/Memory.md)
  - [Disk](Architecture/Disk.md)
- 网络拓扑
- [存储引擎 Engine](Engines/Readme.md)


##  性能优化 Optimize

- 硬件
- 操作系统
```bash
虚拟内存

将 /proc/sys/vm/swappiness 修改成很小的值，如0或1。除非虚拟内存完全满了，否则不要使用交换区。
[root@localhost ~]# cat /proc/sys/vm/swappiness 
30
```
```bash
磁盘I/O
禁止操作系统更新文件的atime属性

echo -e "LABEL=/data  /data  xfs  noatime  1  2" >> /etc/fstab
mount -oremount /data
```
- [优化MySQL性能](Optimize/Readme.md)

## 监控 Monitor

## 变更 Change

- online ddl change => 锁表


## 测试

- 性能测试

## 安全 Security

- 主机安全
  - 防火墙
  - 网络
  - 账户权限
- [MySQL安全](Security/Readme.md)

## 诊断、排错 TroubleShooting


## 工具 Tools

[Tools](Tools/Readme.md)


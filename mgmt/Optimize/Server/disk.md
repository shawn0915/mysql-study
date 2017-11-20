# DISK I/O


> 禁止操作系统更新文件的atime属性
```bash
echo -e "LABEL=/data  /data  xfs  noatime  1  2" >> /etc/fstab
mount -oremount /data
```
#!/bin/bash

# CHECK OS STATUS

#################### Base ####################
## Version
cat /etc/redhat-release
uname -r

## Architecture
uname -m

## Kernel
uname -r
# cat /proc/version
## kernel pram
sudo sysctl -a

## Uptime
uptime
w

## Hostname
hostnamectl
#sudo hostnamectl set-hostname vm-db01

## Language
localectl
#sudo localectl set-locale LANG=en_US.UTF-8

## Time
### Datetime
date
date +%Y%m%d_%H%M%S
# date -s "29 Jan 2018 11:14:00"
# date +%T -s "14:17:50"

### Timezone
timedatectl
#sudo timedatectl set-timezone Asia/Shanghai

### Time Sync
#### chrony
systemctl status chronyd
# systemctl enable chronyd
# systemctl restart chronyd
chronyc sources -v
chronyc sourcestats -v
#cat /etc/ntp/step-tickers
#chronyc -a makestep

#### ntp
systemctl status ntpd
# systemctl enable ntpd
# systemctl restart ntpd

## make sure sync time server
cat /etc/ntp.conf | grep -v '^#\|^$'
ntpq -p


#################### Security ####################
## SELinux
#sudo setenforce 0
#sudo sed -i.bak "s/SELINUX=enforcing/SELINUX=permissive/g" /etc/selinux/config
sestatus
getenforce
grep 'SELINUX' /etc/selinux/config | grep -v '^#\|^$'

## Firewall
#sudo firewall-cmd --list-all
#sudo systemctl stop firewalld
#sudo systemctl disable firewalld
systemctl status firewalld


#################### PROFORMANCE ####################
## CPU
### logical
grep -c '^processor' /proc/cpuinfo
### physics
cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l

sar -u
#sar -u 1
#sar -u 10 3

## Memory
### Memory
free -b
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
sar -r

### SWAP
#告诉内核除非虚拟内存满了，否则不要使用交换区，修改值为0或1
cat /proc/sys/vm/swappiness
sar -w
#sar -w 10 3

## Disk
### Mounted Filesystems
df -h --total
df -i --total
#linux命令df中df -h和df -i的区别 https://yq.aliyun.com/ziliao/48382

### LVM
sudo lsblk
sudo lsblk -f
sudo blkid
sudo pvs
sudo vgs
sudo lvs

sudo fdisk -l | grep 'Disk /dev'

### Disk IO
iostat -d -k
sar -b
#sar -b 10 3
# mount -o noatime -o nodiratime

### Disk Scheduler
more /sys/block/sda/queue/scheduler

## Network
### Net Status
ip a
ip -s link
ss -antpl
ss -anupl

#sudo dstat -t -c -d -D dm-2,dm-0 --disk-tps --disk-util --aio -m -g -s -l -n -N eth33 --tcp 5

### Net Type
nmcli conn show

### Net IO
sar -n DEV
#sar -n DEV 1
sudo ethtool ens33

### IPv6
# 0-enable, 1-disable
cat /proc/sys/net/ipv6/conf/all/disable_ipv6

# sudo cat >> /etc/sysctl.conf << EOF
# net.ipv6.conf.all.disable_ipv6 = 1
# net.ipv6.conf.default.disable_ipv6 = 1
# EOF
# sudo sysctl -p
# cat /etc/sysctl.conf | grep -v "^$\|^#"
## https://blog.csdn.net/bluishglc/article/details/41390785



#################### STATUS ####################
## Process and Threading
ps -eLf | grep mysqld | wc -l

perf top --sort comm,dso -p `pidof mysqld`


#################### System Log ####################
## Journal
#sudo journalctl -f -n 100
#sudo journalctl -f -n 100 --since 14:00
sudo journalctl --verify

## Message
#sudo tail -f /var/log/messages
sudo grep 'soft lockup' /var/log/messages*

#################### Others ####################
cat /proc/sys/kernel/watchdog_thresh
cat /etc/security/limits.conf | grep -v '^#\|^$'
crontab -l
systemctl status postfix

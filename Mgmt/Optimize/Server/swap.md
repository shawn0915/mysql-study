# SWAP
> 虚拟内存

将 /proc/sys/vm/swappiness 修改成很小的值，如0或1。除非虚拟内存完全满了，否则不要使用交换区。
```bash
[root@localhost ~]# cat /proc/sys/vm/swappiness 
30
```
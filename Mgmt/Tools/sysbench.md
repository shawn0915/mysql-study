# Sysbench


## Code

[sysbench](https://github.com/akopytov/sysbench)

## Install

```bash
yum install -y automake libtool*
./autogen.sh
./configure
make
```

## Test

> fileio test
- prepare
```bash
sysbench --test=fileio --file-num=16 --file-total-size=2G prepare
```

- run
```bash
sysbench --test=fileio --file-total-size=2G --file-test-mode=rndrd --max-time=180 --max-requests=100000000 \
--num-threads=16 --init-rng=on --file-num=16 --file-extra-flags=direct --file-fsync-freq=0 --file-block-size=16384 run
```

- run result
```bash
sysbench 1.0:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Initializing random number generator from current time


Extra file open flags: 3
16 files, 128MiB each
2GiB total file size
Block size 16KiB
Number of IO requests: 100000000
Read/Write ratio for combined random IO test: 1.50
Calling fsync() at the end of test, Enabled.
Using synchronous I/O mode
Doing random read test
Initializing worker threads...

Threads started!


File operations:
    reads/s:                      186.33
    writes/s:                     0.00
    fsyncs/s:                     0.00

Throughput:
    read, MiB/s:                  2.91
    written, MiB/s:               0.00

General statistics:
    total time:                          180.1092s
    total number of events:              33559
    total time taken by event execution: 2880.1654s
    response time:
         min:                                  0.42ms
         avg:                                 85.82ms
         max:                                928.45ms
         approx.  95 percentile:             277.21ms

Threads fairness:
    events (avg/stddev):           2097.4375/65.47
    execution time (avg/stddev):   180.0103/0.03

[root@localhost sysbench]#



随机读取的性能为	2.91 MiB/s
随机读的IOPS为	33559/180.1092=186.33

Ps.测试环境为虚拟机

```

- clean up
```bash
sysbench --test=fileio --file-num=16 --file-total-size=2G cleanup
```
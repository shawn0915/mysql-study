# Operation Log
操作日誌

```bash
vim /etc/bashrc
```
```yaml
export WHOAMI=`whoami`
export DATE=`date +"%y%m%d_%H%M%S"`
alias mysql="mysql --tee /data/logs/mysql_record/record_${DATE}_${WHOAMI}.log"
```
```bash
source /etc/bashrc
```
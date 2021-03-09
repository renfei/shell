# Shell
我收藏的Shell小脚本

### sh/xsync.sh
xsync - 自动化的 rsync，为了更方便的在 Linux 集群中同步文件，对 rsync 进行自动化脚本处理。建议先对集群内机器做秘钥无密码登陆，这样同步更方便。

参数：文件名 机器名1 机器名2...
#### 案例
将 ```/opt/test/file``` 发送给机器 ```rf01``` ```rf02``` ```rf03``` ```rf04```：
```bash
cd /opt/test/
./xsync.sh file rf01 rf02 rf03 rf04
```


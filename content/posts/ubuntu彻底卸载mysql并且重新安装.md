---
title: ubuntu彻底卸载mysql并且重新安装
categories:
- 数据库
tags:
- mysql
- ubuntu
abbrlink: b0669918
date: 2019-03-02 13:47:20
---

  
  
首先删除mysql:

```
sudo apt-get remove mysql-*
```

然后清理残留的数据

```
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
```

它会跳出一个对话框，你选择yes就好了
然后安装mysql

```
sudo apt-get install mysql-client mysql-server
```

安装的时候会提示要设置root密码，如果你没有在卸载的时候去清理残留数据是不会提示你去设置root密码的
检查mysql是不是在运行

```
sudo service mysql status
```

一般安装完成之后都是会自动运行的。
如果没有运行你可以

```
sudo service mysql start
```

查看端口
```
sudo netstat -tap | grep mysql
```
运行它

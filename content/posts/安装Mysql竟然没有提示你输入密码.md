---
title: 安装mysql竟然没让你输入密码
categories:
- 数据库
tags:
- mysql
- 数据库
abbrlink: 136d9777
date: 2019-03-01 13:20:44
---

  
Mysql5.7这个版本的root密码在/etc/mysql/debian.cnf这个文件里面 使用sudo cat /etc/mysql/debian.cnf命令打开，你大概会看到如下内容，其中就包括Mysql的默认登陆名与密码
  
```
[client]
host     = localhost
user     = debian-sys-maint
password = M1WVft5X8S80rhE0
socket   = /var/run/mysqld/mysqld.sock
[mysql_upgrade]
host     = localhost
user     = debian-sys-maint
password = M1WVft5X8S80rhE0
socket   = /var/run/mysqld/mysqld.sock

```


1、使用 mysql -u用户名 -p密码进行登陆，


```
mysql -udebian-sys-maint -pM1WVft5X8S80rhE0
```


2、修改root用户密码


```
show databases；
use mysql;
update user set authentication_string=PASSWORD("密码") where user='root';
update user set plugin="mysql_native_password";
flush privileges;
quit;
```


注:由于mysql5.7没有password字段，密码存储在authentication_string字段中

3、重新启动Mysql

```
/etc/init.d/mysql restart
```



4、再次使用root用户登陆


```
登陆成功
```


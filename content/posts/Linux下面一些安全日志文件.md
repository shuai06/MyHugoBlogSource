---
title: Linux下面一些安全日志文件
categories:
- Linux
tags:
- Linux
- 日志
abbrlink: 62677
date: 2020-03-20 11:57:43
keywords:
description:
---


  
```
文件 /var/run/utmp 记录现在登入的用户

文件 /var/log/wtmp 记录用户所有的登入和登出

文件 /var/log/lastlog 记录每一个用户最后登入时间

文件 /var/log/btmp 记录错误的登入尝试（注：可以查看电脑是否正在被爆破）

文件 /var/log/auth.log 需要身份确认的操作(可能存在)

```


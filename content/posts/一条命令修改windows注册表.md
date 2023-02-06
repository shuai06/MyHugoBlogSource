---
title: 一条命令修改windows注册表
top: false
cover: false
categories:
- 渗透测试
tags:
- 渗透测试
- 注册表
abbrlink: 48777
date: 2021-01-17 14:32:08
keywords:
summary:
img:
password:
---

> 在网上看到大佬们的文章，我也在此记录以下



这里以修改windows远程桌面端口3389为33333为例子。

修改注册表，命令如下：

```shell
REG ADD “HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp” /v “PortNumber” /t REG_DWORD /d 3333 /f
```


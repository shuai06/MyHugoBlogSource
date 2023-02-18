---
title: Apache Zeppelin 未授权任意命令执行漏洞
top: false
cover: false
categories:
- 渗透测试
tags:
- Apache Zeppelin
- 未授权任意命令执行
- 漏洞复现
abbrlink: 38991
date: 2021-05-28 16:33:06
keywords:
summary:
img:
password:
---

### 漏洞描述

Apache Zeppelin 存在未授权的用户访问命令执行接口，导致了任意用户都可以执行恶意命令获取服务器权限



### Fofa

```bash
icon_hash="960250052"
```



### 漏洞复现

![先点击这里创建一个note](http://image.geoer.cn/zeppelin_click.jpg)



![继续填写，选择sh](http://image.geoer.cn/zeppelin_click2.jpg)





![命令执行成功](http://image.geoer.cn/zeppelin_success.jpg)










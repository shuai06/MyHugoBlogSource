---
title: IDEA控制台乱码(Tomcat日志乱码)解决办法
comments: true
date: 2022-01-12 15:32:51
tags: ["Java", "日常小问题", "工具"]
categories:
- Java学习
cover: https://image.geoer.cn/img/image-20220112153430975.png
top_img:
description:
---



1.打开 `File->Setting->Editor->File Encodings`，将`Global Encoding`、`Project Encoding`、`Default encodeing for properties files`这三项都设置成UTF-8，然后点击OK。如下图：

![image-20220112153430975](https://image.geoer.cn/img/image-20220112153430975.png)





2.打开 `Help->Edit Custom VM Options`

加上下面一行：

```
-Dfile.encoding=UTF-8
```

![image-20220112153623173](https://image.geoer.cn/img/image-20220112153623173.png)



3.打开 `Edit Configrations`

将`vm option`为` -Dfile.encoding=utf-8`，点击OK

![image-20220112153728537](https://image.geoer.cn/img/image-20220112153728537.png)



4.重启IDEA

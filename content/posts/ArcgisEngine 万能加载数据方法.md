---
title: ArcEngine"万能""加载数据方法
categories:
- GIS
tags:
- ArcEngine
- GIS
abbrlink: eb2e44a3
date: 2018-11-01 13:41:00
---


  
**下面介绍一种“万能”加载数据的办法：** 

```c#
// 加载很多种数据
ICommand command = new ControlsAddDataCommandClass();
command.OnCreate(mainMapControl.Object);
command.OnClick();
mainMapControl.ActiveView.Refresh();
```


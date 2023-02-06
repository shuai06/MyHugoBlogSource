---
title: ArcEngine同步数据视图与布局视图
categories:
- GIS
tags:
- ArcEngine
- GIS
abbrlink: 4c9b4c5b
date: 2018-11-01 13:47:44
---

  

```C#
// 数据视图与布局视图同步
private void mainMapControl_OnAfterScreenDraw(object sender, IMapControlEvents2_OnAfterScreenDrawEvent e)
{
    IActiveView pActiveView = (IActiveView)mainPageLayoutControl1.ActiveView.FocusMap;
    IDisplayTransformation displayTransformation = pActiveView.ScreenDisplay.DisplayTransformation;
    displayTransformation.VisibleBounds = mainMapControl.Extent;
    mainPageLayoutControl1.ActiveView.Refresh();
    CopyToPageLayout();  // 调用下面的函数

}

```


```c#
// CopyToPageLayout() 布局视图与数据视图同步
private void CopyToPageLayout()
{
    IObjectCopy pObjectCopy = new ObjectCopyClass();
    object copyFromMap = mainMapControl.Map;
    object copiedMap = pObjectCopy.Copy(copyFromMap);   // 复制地图到copiedMap中
    object copyToMap = mainPageLayoutControl1.ActiveView.FocusMap;
    pObjectCopy.Overwrite(copiedMap, ref copyToMap);   // 复制地图
    mainPageLayoutControl1.ActiveView.Refresh();

}
```
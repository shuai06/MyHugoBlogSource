---
title: 递归求具有n个元素的整型数组R的平均值
top: false
cover: false
abbrlink: 9010
date: 2021-05-12 19:36:40
categories:
- 编程
tags: ["C语言题", "笔记"]
keywords:
summary:
img:
password:
---



#### 递归求具有n个元素的整型数组R的平均值

今天做题的时候遇到这个不会的题，虽然题很简单单还是太菜了，记录下来，这还是问了一个小学妹之后才懂了，自卑ing... ...



```c
int get_agv(int R[], int n)
{
	if(n==1)
		return R[0];
	else
		return (R[n-1] + get_agv(R, n-1)*(n-1))/n;	   // n-1  用来约分母(约前面一个数的分母)， 把分母写在横线的下面比较容易看出来
}


void main()
{
	int R[5] = {22,44,66,88,10};
	printf("平均值: %d\n", get_agv(R, 5));
}

```



最后一句：return (R[n-1] + get_agv(R, n-1)*<font color=red>(n-1</font>))/n;中的n-1是用来约分母的(约前面一个数的分母)，比如下面这样更直观一点

![示意图](http://image.xpshuai.cn/%E6%B1%82%E5%B9%B3%E5%9D%87%E5%80%BC%E9%A2%98.jpg)




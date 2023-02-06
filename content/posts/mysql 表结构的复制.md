---
title: mysql表结构复制
categories:
- 数据库
tags:
- mysql，数据库
abbrlink: f0858aa6
date: 2019-03-02 15:17:44
---


  
﻿**复制结构：仿照student表结构复制一张new_student表,新表是空的：**

```
create table new_student like student;
```
**复制数据：但是没主键，结构不重要：**

```
create table new_student2 as
(    
	select * from student
);
```
**复制表结构与数据，一模一样：**
```
insert into new_student3 select * from student;
```


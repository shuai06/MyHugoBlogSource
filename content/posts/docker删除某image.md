---
title: docker删除镜像和容器
categories:
- docker
tags:
- docker
abbrlink: 329caef9
date: 2018-03-09 13:47:44
---


  
先查看容器运行状态

```
docker ps -a
```

找到image对应的容器，先stop
```
# id
docker stop d751d48a6d0a

```

再删除容器
```
docker rm d751d48a6d0a
```

最后才能删除镜像
```
 docker rmi fce289e99eb9
 
 
 # 查看镜像，删除ok
 docker images
```



- 注：rm与rmi的区别
```
rm Remove one or more containers
rmi Remove one or more images
```
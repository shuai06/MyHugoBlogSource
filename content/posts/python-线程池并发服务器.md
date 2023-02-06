---
title: python-线程池并发服务器
categories:
- Python
tags:
- Python
- 线程池
abbrlink: 36711
date: 2020-02-24 11:11:44
keywords:
description:
---


  
server

```python

# 使用线程池来实现并发服务器

import socket
from multiprocessing.dummy import Pool


def worker(conn):
    while True:
        recv_data = conn.recv(1000)
        if  not recv_data:
            break
        print("客户端{}发送了{}".format(conn, recv_data.decode()))
        conn.send(recv_data)
    conn.close()


if __name__ == '__main__':
    server = socket.socket()
    server.bind(('127.0.0.1', 8888))
    server.listen(1000)
    pool = Pool(3)
    while True:
        conn, addr = server.accept()
        print("客户端{}连接成功".format(addr))
        pool.apply_async(func=worker, args=(conn,))

```


client
  
```python
import socket


c = socket.socket()

c.connect(('127.0.0.1',8888))

while True:
    msg = input('>>>')
    if msg:
        c.send(msg.encode())   # 只能发送 bytes 类型的数据   encode将中文的变成byte的
        print(c.recv(1024))
    else:
        break

c.close()

```


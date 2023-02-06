---
title: python-可重复利用的线程
categories:
- Python
tags:
- Python
- 线程池
abbrlink: 20484
date: 2020-02-24 11:10:38
keywords:
description:
---








  
```python

import threading
import queue


class MyThread(threading.Thread):
    def __init__(self):
        super().__init__()
        self.queue = queue.Queue()
        self.daemon = True  # 守护进程
        self.start()   #

    def run(self):   # 只有run里的才是子线程执行的
        while True:
            func, args, kwargs = self.queue.get()  # 从队列当中获取任务
            func(*args, **kwargs)
            self.queue.task_done()

    def apply_async(self, func, args=(), kwargs={}):
        self.queue.put((func, args, kwargs))

    def join(self, timeout=None):    # 等待所有提交的任务执行完毕
        self.queue.join()        # 解阻塞

def print_one():
    print('111111111')

def print_two():
    print('222222222222')


if __name__ == '__main__':
    t = MyThread()
    t.apply_async(print_one)
    t.apply_async(print_two, args=(1,2), kwargs={"a":1,'b':2})

    t.join()   # 线程的join   等待队列结束



```


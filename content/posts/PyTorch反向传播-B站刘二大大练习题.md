---
title: PyTorch反向传播(B站刘二大大练习题)
comments: true
mathjax: true
date: 2022-08-15 08:34:09
tags: ["深度学习", "PyTorch"]
categories:
- AI
cover:
top_img:
description:
---
<script type="text/javascript" src="/js/src/bai.js"></script>


```python
"""
刘二练习题，仿照demo简单实现反向传播
"""
import torch


x_data = [1.0, 2.0, 3.0]  # 输入
y_data = [2.0, 4.0, 6.0]  # 输出

w = torch.Tensor([1.0])  # 权重w
w.requires_grad = True  # 设置True，表示需要计算梯度


# 前馈
def forward(x):
    return x * w


# 单个样本的损失
def loss(x, y):
    y_pred = forward(x)
    return (y_pred - y) ** 2


print("预测值(训练之前)：", 4, forward(4).item())

# 训练
for epoch in range(100):
    for x, y in zip(x_data, y_data):
        l = loss(x, y)  # 前向传播，计算loss
        l.backward()  # 反向传播
        print("\t 梯度：", x, y, w.grad.item())  # .item()是直接把值拿出来产生标量
        # 只要一做backward的时候，计算图就会被释放了
        w.data = w.data - 0.01 * w.grad.data  # 梯度下降，更新权重。   w.grad也是一个tensor，所以要取他的data（这里只是修改数值，用.data的时候不会生成计算图）。这里的0.01 是学习率

        w.grad.data.zero_()  # 更新完之后，对梯度清零

    print("进度：", epoch, l.item())

print("预测值(训练之后)：", 4, forward(4).item())


```
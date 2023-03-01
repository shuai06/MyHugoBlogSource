---
title: 使用PyTorch预测糖尿病(B站刘二大大练习题)
comments: true
mathjax: true
date: 2022-08-14 20:56:46
tags: ["深度学习", "PyTorch"]
categories:
- AI
cover:
top_img:
description:
---
<script type="text/javascript" src="/js/src/bai.js"></script>


数据集：
![](https://geoer666-1257264766.cos.ap-beijing.myqcloud.com/20220814205751.png)



```python
"""
解决糖尿病预测的问题

"""
import torch
import numpy as np


# 1.读取数据
data = np.loadtxt("./data/diabetes.csv.gz", delimiter=",", dtype=np.float32)
x_data = torch.from_numpy(data[:-1, :-1])  # x不取最后一列
y_data = torch.from_numpy(data[:-1, [-1]])  # y取所有行和最后一列， [-1]代表是矩阵


# 2.设计模型
class Model(torch.nn.Module):
    def __init__(self):
        super(Model, self).__init__()
        self.linear1 = torch.nn.Linear(8, 6)  # 不断降维
        self.linear2 = torch.nn.Linear(6, 4)
        self.linear3 = torch.nn.Linear(4, 1)
        self.sigmoid = torch.nn.Sigmoid()
        self.active = torch.nn.ReLU()

    def forward(self, x):
        x = self.active(self.linear1(x))  # o1
        x = self.active(self.linear2(x))  # o2
        x = self.sigmoid(self.linear3(x))  # y heat
        return x


model = Model()

# 3.构造损失和优化器
criterion = torch.nn.BCELoss(size_average=True)
optimizer = torch.optim.SGD(model.parameters(), lr=0.1)


# 4.训练
for epoch in range(1000):
    # 这里forward 并非mini-batch的设计，只是mini-batch的风格
    y_pred = model(x_data)
    loss = criterion(y_pred, y_data)
    print(epoch, loss.item())

    # backward
    optimizer.zero_grad()
    loss.backward()

    # update
    optimizer.step()

# 测试集
test_data = torch.from_numpy(data[[-1], :-1])
pred_test = torch.from_numpy(data[[-1], [-1]])

print("test_pred = ", model(test_data).item())
print("infact_pred = ", pred_test.item())



```
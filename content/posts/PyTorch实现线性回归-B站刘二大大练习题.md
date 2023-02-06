---
title: PyTorch实现线性回归(B站刘二大大练习题)
comments: true
mathjax: true
date: 2022-08-15 08:35:43
tags: ["PyTorch"]
categories:
- AI
cover:
top_img:
description:
---
<script type="text/javascript" src="/js/src/bai.js"></script>

```python
"""
使用pytorch实现简单线性回归
"""
import torch


# 1.准备数据集
x_data = torch.Tensor([[1.0], [2.0], [3.0]])  # 3行1列的tensor
y_data = torch.Tensor([[2.0], [4.0], [6.0]])


# 2.使用类来设计模型
class LinearModel(torch.nn.Module):  # Module构造出来的对象，会自动构建反向传播过程
    def __init__(self):
        super(LinearModel, self).__init__()
        self.linear = torch.nn.Linear(1, 1)  # torch.nn.Linear构造一个对象，参数是权重和偏差，也是继承子Module的会自动进行反向传播
        # (in_features: size, out_features: size of each out feature, bias=True:要不要偏置量)

    def forward(self, x):  # 实现这个方法
        # 计算 y heat
        y_pred = self.linear(x)  # linear是前面建立的对象，可调用的callable的对象（def __call__(self, *args, **kwargs)）
        return y_pred


model = LinearModel()  # model是callable的  model(x)
# 3.构建损失和优化器
criterion = torch.nn.MSELoss(size_average=False)
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)  # 梯度下降
# optimizer = torch.optim.Adam(model.parameters(), lr=0.01)  # 梯度下降
# 可以尝试不同的优化器

# 4.训练
for epoch in range(100):
    y_pred = model(x_data)  # 1.前向传播，计算y heat
    loss = criterion(y_pred, y_data)  # 2.计算损失
    print(epoch, loss)  # 打印

    optimizer.zero_grad()  # 梯度会自动计算，务必梯度清零！
    loss.backward()    # 3.反向传播
    optimizer.step()   # 4.更新 update

# 打印权重和偏置
print("w=", model.linear.weight.item())  # model下面的linear，下面的weight
print("b=", model.linear.bias.item())

# 测试模型
x_test = torch.Tensor([[4.0]])
y_test = model(x_test)
print("y_pred=", y_test.data)


```
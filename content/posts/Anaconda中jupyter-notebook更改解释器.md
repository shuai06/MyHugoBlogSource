---
title: Anaconda中jupyter notebook更改解释器
comments: true
mathjax: true
date: 2022-09-03 10:43:30
tags:
categories:
- Python
cover:
top_img:
description:
---
<script type="text/javascript" src="/js/src/bai.js"></script>

1.激活指定虚拟环境
```python
conda activate dlenv
```

2.安装ipykerbel
```python
conda install ipykernel
```

3.向ipykernel注入指定虚拟环境
```python
# python -m ipykernel install --user --name "要注入的虚拟环境"--display-name "显示名称"
python -m ipykernel install --user --name dlenv --display-name "dlenv"

```

4.打开jupyter notebook，即可选择刚加入的虚拟环境了
![](http://image.geoer.cn/20220903104654.png)





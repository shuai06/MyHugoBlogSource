#!/bin/zsh

git add .
read -p "输入commit信息" commitMsg
if [ -z $commitMsg];then
    commitMsg="feat(*):添加一篇文章但是忘了写备注"
fi
git commit -m "$commitMsg"
git push -u origin main

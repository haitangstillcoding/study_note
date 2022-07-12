::获取日期时间
set date_time=%date:~0,10%%time:~0,5%
::输入提交次数
set /p message=Please input message:
:: 添加
git add .
:: 提交
git commit -m "%message%|%date_time%"
:: 推送到远程分支master
git push origin main:main
::关闭cmd窗口
exit

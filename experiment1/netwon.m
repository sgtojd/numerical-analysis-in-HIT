function [x,iter] = netwon(fx, x0, err, maxiter, a)
%NETWON 利用牛顿法解方程数值解
% 输入:fx 求解函数(只有一个变量) x0 初值
%      err 误差 maxiter 最大循环次数 a 默认为1，可针对重根选择
% 输出:x 计算结果 iter 循环次数
syms x
dfx = diff(fx);
iter = 0;
x = x0;
if nargin == 4 
    a = 1;
end
while abs(x - x0) >= err || iter == 0
    x0 = x;
    fx1 = eval(subs(fx,x0));
    dfx1 = eval(subs(dfx,x0));
    x = x0 - a*fx1/dfx1;
    iter = iter + 1;
    if iter >= maxiter
        error('无法收敛，重新选择初值');
    end
end
end
function [x,iter] = cutline(fx, x1, x2, err, maxiter)
%CUTLINE 利用割线法解方程数值解
% 输入:fx 求解函数(只有一个变量) x1 x2 初值
%      err 误差 maxiter 最大循环次数 
% 输出:x 计算结果 iter 循环次数
syms x
iter = 0;
while abs(x1 - x2) >= err
    fx1 = eval(subs(fx,x1));
    fx2 = eval(subs(fx,x2));
    x = x2 - fx2*(x2 - x1)/(fx2 - fx1);
    x1 = x2;
    x2 = x;
    iter = iter + 1;
    if iter >= maxiter
        error('无法收敛，重新选择初值');
    end
end
end


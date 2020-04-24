function [x1,iter] = nnetwon(fx, x0, err, maxiter)
%NNETWON 利用拟牛顿法解方程组数值解
% 输入:fx 求解函数 x0 初值
%      err 误差 maxiter 最大循环次数
% 输出:x 计算结果 iter 循环次数
% 初始化
if numel(x0) == 2
    syms x y
    temp = [x y];
elseif numel(x0) == 3
    syms x y z
    temp = [x y z];
else
    error('自变量过多');
end
x1 = x0;
iter = 0;
dfx = jacobian(fx);
h = inv(eval(subs(dfx,temp,x0')));
fx1 = eval(subs(fx,temp,x0'));
% 秩1拟牛顿法迭代
while max(abs(x0 - x1)) >= err || iter == 0
    x0 = x1;
    r = -h*fx1;
    x1 = x0 + r;
    fx2 = eval(subs(fx,temp,x1'));
    dy = fx2 - fx1;
    h = h + (r-h*dy)*((r)'*h)/((r)'*h*dy);
    fx1 = fx2;
    iter = iter + 1;
    if iter >= maxiter
        error('无法收敛，重新选择初值');
    end
end
end
%% 初始化
clc;clear;close all
err = 0.5*10^-10; % 误差
maxiter = 100; % 最大迭代次数
%% 二分法计算方程 sin(x)-x^2/2=0
fun = @(x)sin(x)-x^2/2; % 函数
a = 1;b = 2; % 范围
[iter1,result1] = divide2(a,b,fun,err);
%% 牛顿法求求解根
syms x
% 求解xe^x-1=0,x0=0.5
x0 = 0.5; fun = x*exp(x)-1;
[x21,iter21] = netwon(fun,x0,err,maxiter);
% 求解x^3-x-1=0,x0=1
x0 = 1; fun = x^3-x-1;
[x22,iter22] = netwon(fun,x0,err,maxiter);
% 求解(x-1)^2*(2*x-1)=0,x0=0.45和0.65
x0 = [0.45,0.65]; fun = (x-1)^2*(2*x-1);
[x23,iter23] = netwon(fun,x0(1),err,maxiter);
[x24,iter24] = netwon(fun,x0(2),err,maxiter);
%% 割线法计算f(x)=xe^x-1=0在[0,1]解
x0 = [0.4,0.6]; fun = x*exp(x)-1;
[x31,iter31] = cutline(fun,x0(1),x0(2),err,maxiter);
[x32,iter32] = netwon(fun,x0(1),err,maxiter);
%% 改进牛顿法求解(x-1)^2*(2*x-1)=0,x0=0.55
x0 = 0.55; fun1 = (x-1)^2*(2*x-1);
[x4,iter4] = netwon(fun1,x0,err,maxiter,2);
%% 拟牛顿法解方程组
syms x y z;
x0 = [1;1;1];
fun = [x*y-z^2-1;x*y*z+y^2-x^2-2;exp(x)+z-exp(y)-3];
[x5,iter5] = nnetwon(fun, x0, err, maxiter);


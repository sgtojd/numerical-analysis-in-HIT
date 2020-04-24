%% ��ʼ��
clc;clear;close all
err = 0.5*10^-10; % ���
maxiter = 100; % ����������
%% ���ַ����㷽�� sin(x)-x^2/2=0
fun = @(x)sin(x)-x^2/2; % ����
a = 1;b = 2; % ��Χ
[iter1,result1] = divide2(a,b,fun,err);
%% ţ�ٷ�������
syms x
% ���xe^x-1=0,x0=0.5
x0 = 0.5; fun = x*exp(x)-1;
[x21,iter21] = netwon(fun,x0,err,maxiter);
% ���x^3-x-1=0,x0=1
x0 = 1; fun = x^3-x-1;
[x22,iter22] = netwon(fun,x0,err,maxiter);
% ���(x-1)^2*(2*x-1)=0,x0=0.45��0.65
x0 = [0.45,0.65]; fun = (x-1)^2*(2*x-1);
[x23,iter23] = netwon(fun,x0(1),err,maxiter);
[x24,iter24] = netwon(fun,x0(2),err,maxiter);
%% ���߷�����f(x)=xe^x-1=0��[0,1]��
x0 = [0.4,0.6]; fun = x*exp(x)-1;
[x31,iter31] = cutline(fun,x0(1),x0(2),err,maxiter);
[x32,iter32] = netwon(fun,x0(1),err,maxiter);
%% �Ľ�ţ�ٷ����(x-1)^2*(2*x-1)=0,x0=0.55
x0 = 0.55; fun1 = (x-1)^2*(2*x-1);
[x4,iter4] = netwon(fun1,x0,err,maxiter,2);
%% ��ţ�ٷ��ⷽ����
syms x y z;
x0 = [1;1;1];
fun = [x*y-z^2-1;x*y*z+y^2-x^2-2;exp(x)+z-exp(y)-3];
[x5,iter5] = nnetwon(fun, x0, err, maxiter);


clc;clear,close all
%% 初始化
fun = @(x)1./(1+25*x.^2);
N = 10;a = -1;b = 1;
xi = linspace(a,b,N+1); % 用于拟合参数xi,yi 
yi = fun(xi);
xr = linspace(a,b,1001);
yr = fun(xr); % 真实值
%% 拉格朗日法
ye = lagrange(xi,yi,xr); % 估计
figure,plot(xr,yr,xr,ye,'--');grid on;
xlabel('x');ylabel('y');title('拉格朗日插值结果');legend('实际值','拟合值');
%% 分段线性插值
ye = lineNear(xi,yi,xr);
figure,plot(xr,yr,xr,ye,'--');grid on;
xlabel('x');ylabel('y');title('分段线性插值结果');legend('实际值','拟合值');
%% 三次样条插值
yd1 = myspline(xi,yi,xr,[25/338 -25/338],1);     % 第一边界条件
yd2 = myspline(xi,yi,xr,[925/4394 925/4394],2);  % 第二边界条件
figure,plot(xr,yr,xr,yd1,'--',xr,yd2,'-.');grid on;
xlabel('x');ylabel('y');title('三次样条插值结果');
legend('真值','第一边界条件','第二边界条件');
figure,plot(xr,yr-yd1,'--',xr,yr-yd2,'-.');grid on;
xlabel('x');ylabel('error');title('三次样条插值误差');
legend('第一边界条件差值','第二边界条件差值');
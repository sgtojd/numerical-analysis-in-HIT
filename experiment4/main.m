clc;clear;close all;
%% 初始化
xi = [3 4 5 6 7 8 9];
yi = [2.01 2.98 3.50 5.02 5.47 6.02 7.05];
x = 3:0.01:9;
%% 多项式形式拟合
y_2 = nearin(xi,yi,2,x,1);y_3 = nearin(xi,yi,3,x,1);
y_6 = nearin(xi,yi,6,x,1);y_7 = nearin(xi,yi,7,x,1);
figure,plot(xi,yi,'.',x,y_2,x,y_3,'--',x,y_6,':',x,y_7,'-.','LineWidth',1.2...
    ,'MarkerSize',15);
grid on;xlabel('x');ylabel('y');title('最小二乘法拟合结果1');
legend('真实值','一次多项式','二次多项式','五次多项式','六次多项式');
%% 指数函数形式拟合
y_e = nearin(xi,yi,7,x,2);
figure,plot(xi,yi,'.',x,y_2,x,y_3,'--',x,y_e,':');
grid on;xlabel('x');ylabel('y');title('最小二乘法拟合结果2');
legend('真实值','一次多项式','二次多项式','指数模型');
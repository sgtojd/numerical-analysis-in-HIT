clc;clear;close all;
%% ��ʼ��
xi = [3 4 5 6 7 8 9];
yi = [2.01 2.98 3.50 5.02 5.47 6.02 7.05];
x = 3:0.01:9;
%% ����ʽ��ʽ
y_2 = nearin(xi,yi,2,x,1);y_3 = nearin(xi,yi,3,x,1);
y_5 = nearin(xi,yi,5,x,1);y_6 = nearin(xi,yi,6,x,1);
figure,plot(xi,yi,'.',x,y_2,x,y_3,'--',x,y_5,':',x,y_6,'-.','LineWidth',1.2...
    ,'MarkerSize',15);
grid on;
xlabel('x','FontSize',12);ylabel('y','FontSize',12);
legend('��ʵֵ','һ�ζ���ʽ','���ζ���ʽ','��ζ���ʽ','���ζ���ʽ',...
    'Location','northwest','FontSize',12);
title('��С���˷���Ͻ��1','FontSize',15);
%% ָ��������ʽ
y_e = nearin(xi,yi,7,x,2);
figure,plot(xi,yi,'.',x,y_2,x,y_3,'--',x,y_e,':','LineWidth',1.2...
    ,'MarkerSize',15);
grid on;
xlabel('x','FontSize',12);ylabel('y','FontSize',12);
legend('��ʵֵ','һ�ζ���ʽ','���ζ���ʽ','ָ��ģ��',...
    'Location','northwest','FontSize',12);
title('��С���˷���Ͻ��2','FontSize',15);
%% ������
er_2 = vecnorm(nearin(xi,yi,2,xi,1)-yi)/7;
er_3 = vecnorm(nearin(xi,yi,3,xi,1)-yi)/7;
er_5 = vecnorm(nearin(xi,yi,5,xi,1)-yi)/7;
er_6 = vecnorm(nearin(xi,yi,6,xi,1)-yi)/7;
er_e = vecnorm(nearin(xi,yi,2,xi,2)-yi)/7;
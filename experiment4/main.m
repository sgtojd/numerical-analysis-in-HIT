clc;clear;close all;
%% ��ʼ��
xi = [3 4 5 6 7 8 9];
yi = [2.01 2.98 3.50 5.02 5.47 6.02 7.05];
x = 3:0.01:9;
%% ����ʽ��ʽ���
y_2 = nearin(xi,yi,2,x,1);y_3 = nearin(xi,yi,3,x,1);
y_6 = nearin(xi,yi,6,x,1);y_7 = nearin(xi,yi,7,x,1);
figure,plot(xi,yi,'.',x,y_2,x,y_3,'--',x,y_6,':',x,y_7,'-.','LineWidth',1.2...
    ,'MarkerSize',15);
grid on;xlabel('x');ylabel('y');title('��С���˷���Ͻ��1');
legend('��ʵֵ','һ�ζ���ʽ','���ζ���ʽ','��ζ���ʽ','���ζ���ʽ');
%% ָ��������ʽ���
y_e = nearin(xi,yi,7,x,2);
figure,plot(xi,yi,'.',x,y_2,x,y_3,'--',x,y_e,':');
grid on;xlabel('x');ylabel('y');title('��С���˷���Ͻ��2');
legend('��ʵֵ','һ�ζ���ʽ','���ζ���ʽ','ָ��ģ��');
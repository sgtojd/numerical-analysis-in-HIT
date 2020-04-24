clc;clear,close all
%% ��ʼ��
fun = @(x)1./(1+25*x.^2);
N = 10;a = -1;b = 1;
xi = linspace(a,b,N+1); % ������ϲ���xi,yi 
yi = fun(xi);
xr = linspace(a,b,1001);
yr = fun(xr); % ��ʵֵ
%% �������շ�
ye = lagrange(xi,yi,xr); % ����
figure,plot(xr,yr,xr,ye,'--');grid on;
xlabel('x');ylabel('y');title('�������ղ�ֵ���');legend('ʵ��ֵ','���ֵ');
%% �ֶ����Բ�ֵ
ye = lineNear(xi,yi,xr);
figure,plot(xr,yr,xr,ye,'--');grid on;
xlabel('x');ylabel('y');title('�ֶ����Բ�ֵ���');legend('ʵ��ֵ','���ֵ');
%% ����������ֵ
yd1 = myspline(xi,yi,xr,[25/338 -25/338],1);     % ��һ�߽�����
yd2 = myspline(xi,yi,xr,[925/4394 925/4394],2);  % �ڶ��߽�����
figure,plot(xr,yr,xr,yd1,'--',xr,yd2,'-.');grid on;
xlabel('x');ylabel('y');title('����������ֵ���');
legend('��ֵ','��һ�߽�����','�ڶ��߽�����');
figure,plot(xr,yr-yd1,'--',xr,yr-yd2,'-.');grid on;
xlabel('x');ylabel('error');title('����������ֵ���');
legend('��һ�߽�������ֵ','�ڶ��߽�������ֵ');
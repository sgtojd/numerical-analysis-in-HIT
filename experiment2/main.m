clc;clear;close all;
%% ����1
A = [10^-8 2 3;-1 3.712 4.623;-2 1.072 5.643];
b = [1 2 3];
x11 = gaussCal(A,b); % ��˹��ȥ��
x12 = gaussExCal(A,b); % ��˹����Ԫ��ȥ��
%% ����2
A = [4 -2 4;-2 17 10;-4 10 9];
b = [10 3 7];
x21 = gaussCal(A,b); % ��˹��ȥ��
x22 = gaussExCal(A,b); % ��˹����Ԫ��ȥ��


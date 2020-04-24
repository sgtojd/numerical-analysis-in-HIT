function [x,iter] = netwon(fx, x0, err, maxiter, a)
%NETWON ����ţ�ٷ��ⷽ����ֵ��
% ����:fx ��⺯��(ֻ��һ������) x0 ��ֵ
%      err ��� maxiter ���ѭ������ a Ĭ��Ϊ1��������ظ�ѡ��
% ���:x ������ iter ѭ������
syms x
dfx = diff(fx);
iter = 0;
x = x0;
if nargin == 4 
    a = 1;
end
while abs(x - x0) >= err || iter == 0
    x0 = x;
    fx1 = eval(subs(fx,x0));
    dfx1 = eval(subs(dfx,x0));
    x = x0 - a*fx1/dfx1;
    iter = iter + 1;
    if iter >= maxiter
        error('�޷�����������ѡ���ֵ');
    end
end
end
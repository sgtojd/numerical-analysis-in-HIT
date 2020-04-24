function [x1,iter] = nnetwon(fx, x0, err, maxiter)
%NNETWON ������ţ�ٷ��ⷽ������ֵ��
% ����:fx ��⺯�� x0 ��ֵ
%      err ��� maxiter ���ѭ������
% ���:x ������ iter ѭ������
% ��ʼ��
if numel(x0) == 2
    syms x y
    temp = [x y];
elseif numel(x0) == 3
    syms x y z
    temp = [x y z];
else
    error('�Ա�������');
end
x1 = x0;
iter = 0;
dfx = jacobian(fx);
h = inv(eval(subs(dfx,temp,x0')));
fx1 = eval(subs(fx,temp,x0'));
% ��1��ţ�ٷ�����
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
        error('�޷�����������ѡ���ֵ');
    end
end
end
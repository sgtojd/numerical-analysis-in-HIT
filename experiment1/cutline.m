function [x,iter] = cutline(fx, x1, x2, err, maxiter)
%CUTLINE ���ø��߷��ⷽ����ֵ��
% ����:fx ��⺯��(ֻ��һ������) x1 x2 ��ֵ
%      err ��� maxiter ���ѭ������ 
% ���:x ������ iter ѭ������
syms x
iter = 0;
while abs(x1 - x2) >= err
    fx1 = eval(subs(fx,x1));
    fx2 = eval(subs(fx,x2));
    x = x2 - fx2*(x2 - x1)/(fx2 - fx1);
    x1 = x2;
    x2 = x;
    iter = iter + 1;
    if iter >= maxiter
        error('�޷�����������ѡ���ֵ');
    end
end
end


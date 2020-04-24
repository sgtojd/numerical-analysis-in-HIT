function [result,count] = divide2(a,b,fun,err)
%DIVIDE2 ���ַ���ⷽ�̸�
%   ���룺a bȡֵ��Χ fun��⺯�� errֹͣ���
%   �����result�������� count��������
count = 0;
if fun(a)*fun(b) < 0
    while abs(b - a)>= err
        result = (a+b)/2;
        fa = fun(a);
        fb = fun(b);
        fmid = fun(result);
        count = count + 1;
        if fa*fmid == 0
            break;
        elseif fa*fmid < 0
            b = result;  
        elseif fa*fmid > 0
            a = result;
        end
    end
else
    error('������ţ�ٷ�����');
end
end


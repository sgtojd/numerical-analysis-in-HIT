function y = nearin(xi,yi,n,x,label)
%MEARIN ��С���˷��������
%   ���룺xi yi ��ϲ��� n ��϶���ʽ��������Ŀ
%         x ������� label Ϊ1����ʽģ�� Ϊ2ָ��ģ��
%   �����y ��Ͻ��
if label == 2
    n = 2;
    yi = log(yi);
end
phi = xi'.^(0:n-1);
b = dot(repmat(yi',1,n),phi)';
A = zeros(n,n);
for i = 1:n
    A(i,:) = dot(repmat(phi(:,i),1,n),phi);
end
a = A\b;
y = polyval(fliplr(a'),x);
if label == 2
    y = exp(y);
end
end


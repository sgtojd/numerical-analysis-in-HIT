function ye = lagrange(xi,yi,x)
%LAGRANGE �����������ն���ʽ�����ֵ
%   ���룺xi yi���ڲ�ֵ����� x��Ҫ�������
%   �����ye��ֵ���Ƶ���
num = numel(xi);
ye = zeros(numel(x),1);
for i = 1:num
    tempx = xi;
    tempx(i) = [];
    li = prod(x'-tempx,2)./prod(xi(i)-tempx);
    ye = ye + li*yi(i);
end
ye = ye';
end


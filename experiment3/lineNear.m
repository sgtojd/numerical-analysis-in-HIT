function ye = lineNear(xi,yi,x)
%LINENEAR �ֶ��������
%   ���룺xi yi���ڲ�ֵ����� x��Ҫ�������
%   �����ye��ֵ���Ƶ���
[~,posi] = sort(abs(x-xi'));
posi = posi(1:2,:);
yrange = yi(posi);
xrange = xi(posi);
k = (yrange(1,:)-yrange(2,:))./(xrange(1,:)-xrange(2,:));
b = (xrange(2,:).*yrange(1,:)-xrange(1,:).*yrange(2,:))./(xrange(2,:)-xrange(1,:));
ye = k.*x+b;
end


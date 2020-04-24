function ye = lineNear(xi,yi,x)
%LINENEAR 分段线性拟合
%   输入：xi yi用于插值点的数 x需要计算的数
%   输出：ye插值估计的数
[~,posi] = sort(abs(x-xi'));
posi = posi(1:2,:);
yrange = yi(posi);
xrange = xi(posi);
k = (yrange(1,:)-yrange(2,:))./(xrange(1,:)-xrange(2,:));
b = (xrange(2,:).*yrange(1,:)-xrange(1,:).*yrange(2,:))./(xrange(2,:)-xrange(1,:));
ye = k.*x+b;
end


function ye = lagrange(xi,yi,x)
%LAGRANGE 利用拉格朗日多项式拟合数值
%   输入：xi yi用于插值点的数 x需要计算的数
%   输出：ye插值估计的数
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


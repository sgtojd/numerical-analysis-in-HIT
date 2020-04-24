function y = nearin(xi,yi,n,x,label)
%MEARIN 最小二乘法拟合数据
%   输入：xi yi 拟合参数 n 拟合多项式基函数数目
%         x 输入参数 label 为1多项式模型 为2指数模型
%   输出：y 拟合结果
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


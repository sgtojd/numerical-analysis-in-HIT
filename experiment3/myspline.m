function yd = myspline(xi,yi,xr,edg,label)
%MYSPLINE 自编三次样条插值函数
%   输入：xi yi 给定划分和函数值 xr 待插值范围
%        edg 边界条件 label 标记量
%        label == 1第一边界条件 label == 2第二边界条件 
% 初始化参数
dff0 = edg(1);dffn = edg(2);N = numel(xi)-1;
h = xi(2:N+1) - xi(1:N);
lam = h(2:N)./(h(2:N)+h(1:N-1));
miu = 1 - lam;
df2 = 6*((yi(3:N+1)-yi(1:N-1))./((h(1:N-1)+h(2:N)).*h(2:N))-...
    (yi(2:N)-yi(1:N-1))./(h(1:N-1).*h(2:N))); % 二阶差商
% 构建系数矩阵A和值d,求解AM=d
if label == 2
    df2(1) = df2(1)-miu(1)*dff0;
    df2(N-1) = df2(N-1)-lam(N-1)*dffn;
    d = df2';
    A = zeros(N-1,N-1);
    for i = 1:N-1
        switch i
            case 1
                A(i,1:2)=[2 lam(1)];
            case N-1
                A(i,N-2:N-1)=[miu(N-1) 2];
            otherwise
                A(i,i-1:i+1)=[miu(i) 2 lam(i)];
        end
    end
    M = (A\d)';
    M = [dff0 M dffn];
elseif label == 1
    d0 = 6*((yi(2)-yi(1))/h(1)-dff0)/h(1);
    dn = 6*(dffn-(yi(N+1)-yi(N))/h(N))/h(N);
    d = ([d0,df2,dn])';
    A = zeros(N+1,N+1);
    for i = 1:N+1
        switch i
            case 1
                A(i,1:2)=[2 1];
            case N+1
                A(i,N:N+1)=[1 2];
            otherwise
                A(i,i-1:i+1)=[miu(i-1) 2 lam(i-1)];
        end
    end
    M = (A\d)';
end
% 分段进行求解
A = M(1:N)/6./h;
B = M(2:N+1)/6./h;
C = (yi(2:N+1)-yi(1:N)-h.^2.*(M(2:N+1)-M(1:N))/6)./h;
D = yi(1:N)-h.^2.*M(1:N)/6;
yd = zeros(1,numel(xr));
for num = 1:N
    temp = (A(num)*(xi(num+1)-xr).^3+B(num)*(xr-xi(num)).^3+...+
        C(num)*(xr-xi(num))+D(num)).*(xr<xi(num+1) & xr>=xi(num));
    yd = yd + temp;
end
yd(xr == xi(end)) = yi(end);
end


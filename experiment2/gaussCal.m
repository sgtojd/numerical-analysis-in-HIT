function x = gaussCal(A,b)
%GAUSSCAL 高斯消元法求线性方程组
%   输入：A b线性方程组系数和值
%   输出：x 求解结果
num = numel(b);
x = zeros(numel(b),1);
Ab = [A,b];
for j = 1 : num-1
    for i = j: num-1
        if Ab(j,j) == 0 
         error('消元元素为0，请换行');
        end
        m = Ab(i+1,j)/Ab(j,j);
        Ab(i+1,j:end)=Ab(i+1,j:end)-m*Ab(j,j:end);
    end
end
x(num) =  Ab(num,num+1)/Ab(num,num);
for i = 1 : num-1
    x(num-i) = (Ab(num-i,num+1)-Ab(num-i,num-i+1:num)*x(num-i+1:end))/Ab(num-i,num-i);
end
end


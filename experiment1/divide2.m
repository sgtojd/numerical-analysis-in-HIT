function [result,count] = divide2(a,b,fun,err)
%DIVIDE2 二分法求解方程根
%   输入：a b取值范围 fun求解函数 err停止误差
%   输出：result计算根结果 count迭代次数
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
    error('不满足牛顿法条件');
end
end


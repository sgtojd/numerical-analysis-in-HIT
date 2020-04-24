function x = gaussExCal(A,b)
%GAUSSEXCAL ��˹����Ԫ��Ԫ�������Է�����
%   ���룺A b���Է�����ϵ����ֵ
%   �����x �����
num = numel(b);
x = zeros(numel(b),1);
Ab = [A,b];
for j = 1 : num-1
    temp = max(abs(A(j:end,j)));
    if temp == 0
        error('���������');
    end
    [posi1,~] = (find(abs(A(j:end,j)) == temp));
    temp = Ab(posi1(1)+j-1,:);
    Ab(posi1(1)+j-1,:) = Ab(j,:);
    Ab(j,:) = temp;
    for i = j: num-1
        m = Ab(i+1,j)/Ab(j,j);
        Ab(i+1,j:end)=Ab(i+1,j:end)-m*Ab(j,j:end);
    end
end
x(num) =  Ab(num,num+1)/Ab(num,num);
for i = 1 : num-1
    x(num-i) = (Ab(num-i,num+1)-Ab(num-i,num-i+1:num)*x(num-i+1:end))/Ab(num-i,num-i);
end


function s = randuniform(M,b,r,first,num)

%实验1  均匀分布随机数的产生，统计特性分析及计算机仿真
% 较简单的伪随机序列产生方法是采用数论中基于数环理论的线性同余法（乘同余法、混合同余法），
% 其迭代公式的一般形式为f(x) = (r*x + b)  Mod M，其离散形式为s(n + 1) = [r*s(n) + b]  Mod M。
% 其中，s(n)为n时刻的随机数种子，r为扩展因子，b为固定扰动项，M为循环模，Mod M表示对M取模。
% 通常公式中参数常用取值为s(0) =12357，r = 2045，b = 1，M =1048576。
% % 
% % M = 1048576;
% % b = 1;
% % r = 2045;
% % s = zeros(1,10000);
% % s(1) = 12357;
%%调用示例： s = randuniform(M,b,r,first,num) 

s = zeros(1,num);
s(1) = first;

for i = 2 : num
    s(i) = mod(s(i-1)*r+b,M);
end
s = s/M;



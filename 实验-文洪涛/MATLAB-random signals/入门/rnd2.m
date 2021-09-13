function [s] = rnd2(m,a,num)
% 用中心极限定理方法生成高斯随机数
% m：均值，a：标准差，num：数据点数

% 生成一路独立的均匀分布随机数
x = rand(1,num*12);
% 12个相加
y = reshape(x,12,num);
y1 = sum(y)-6;
% 线性变换，加上均值和标准差，返回两路高斯。
s = a*y1+m;
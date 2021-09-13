function [s1,s2] = rnd1(m,a,num)
% 生成高斯随机数
% mn：均值，a：标准差，num：数据点数
num=100;
m=0;
a=1;
% 生成两路独立的均匀分布随机数
x1 = rand(1,num);
x2 = rand(1,num);

% 变换
y1 = sqrt(-2*log(x1)).*cos(2*pi*x2);
y2 = sqrt(-2*log(x1)).*sin(2*pi*x2);

% 线性变换，加上均值和标准差，返回两路高斯。
s1 = a*y1+m;
s2 = a*y2+m;



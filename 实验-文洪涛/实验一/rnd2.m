function [s]= rnd2(m,a,num);
% %% 
% % 用中心极限定理方法生成高斯随机数
% % m：均值，a：标准差，num：数据点数  
% % 生成一路独立的均匀分布随机数
% % x = rand(1,num*12);
% % figure
% % hist(x,100);
% % 12个相加
% % y = reshape(x,12,num);
% y=rand(12,num);
% y1 = sum(y)-6;
% % 线性变换，加上均值和标准差，返回两路高斯。
% s = a*y1+m;
% figure
% hist(s,100);
% end
%% 
% x=rand(1,num);
% y=rand(1,num);
M=1048576;
b=1;
r=2045;
first1=12357;
first2=12359;
x=randuniform(M,b,r,first1,num);
y=randuniform(M,b,r,first2,num);
y1=sqrt((-2)*log(x)).*cos(2*pi*y);
s=a*y1+m;
figure
hist(s,100);
title('变换法高斯');

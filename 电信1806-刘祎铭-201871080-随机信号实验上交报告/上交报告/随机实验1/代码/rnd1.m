function [s]= rnd1(m,a,num)
%% 
% 用中心极限定理方法生成高斯随机数
% m：均值，a：标准差，num：数据点数  
% 生成一路独立的均匀分布随机数

M=1048576;
b=1;
r=2045;
first=12357;
x=randuniform(M,b,r,first,num*12);
% x = rand(1,num*12);
y = reshape(x,12,num);
y1 = sum(y)-6;
% 线性变换，加上均值和标准差，返回两路高斯。
s = a*y1+m;
%% 
% s=zeros(1,num);
% x=randuniform(1048576,2045,1,12357,num*12);
% for i=1:num
% y=sum(x(1+12*(i-1):1+12*(i-1)+11)-1/2)/sqrt(12/12);
% s(i)=a*y+m;
% end


%%
figure
hist(s,100);
title('中心极限定理高斯');



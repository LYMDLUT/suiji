%% task1_1
%% 配置环境
clc;
clear all;
close all;
%% 产生随机数
% 参数
M=1048576;
b=2;
r=2103;
s=zeros(1,10000);
s(1)=12388;

for i=2:10000
    s(i)=mod(s(i-1)*r+b,M);
end

s=s/M;

%% 画线和画点
% 画线
figure
plot(s)
title('全部数据连线')
% 画点
figure
plot(s,'.')
title('全部数据画点')
%% 统计量
%求各阶矩
n=zeros(1,4);
for i=1:4
    n(i)=mean(s.^i);
end
n
%直方图
figure
hist(s)
Max=max(s)
Min=min(s)
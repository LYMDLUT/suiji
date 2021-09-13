%% task1_2
%% 配置环境
clc;
clear all;
close all;
%% 产生高斯随机变量
s=rnd2(3,2,10000);
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
n=zeros(1,4);
for i=1:4
    n(i)=mean(s.^i);
end
n

figure
hist(s,100)
Max=max(s)
Min=min(s)
%% task1_1
%% 配置环境
clear all;
close all;
clc;
%% 产生随机数
% 参数
M=1048576;
b=1;
r=2045;
first=12357;
num=10000;
s=randuniform(M,b,r,first,num);%自编
y=rand(1,num);%对照
%% 画线和画点
% 画线
figure,subplot(2,1,1),plot(s)  %全部
title('全部数据连线');
subplot(2,1,2),plot(s(1:100)) %前100个数据
title('前100个数据连线');
% 画点
figure,subplot(2,1,1),plot(s,'.')  %全部
title('全部数据画点');
subplot(2,1,2),plot(s(1:100),'*') %前100个数据
title('前100个数据画点');
%% 统计量
%求各阶矩
n=zeros(1,4);
for i=1:10000
    n(1)=n(1)+s(i);
    n(2)=n(2)+s(i)^2;
    n(3)=n(3)+s(i)^3;
    n(4)=n(4)+s(i)^4;
end
n=n/10000;
disp(['自编随机数的各阶矩',num2str(n),'。']);
%% 对比求各阶矩
m=zeros(1,4);
for i=1:10000
    m(1)=m(1)+y(i);
    m(2)=m(2)+y(i)^2;
    m(3)=m(3)+y(i)^3;
    m(4)=m(4)+y(i)^4;
end
m=m/10000;
disp(['对照随机数的各阶矩',num2str(m),'。']);
%直方图
figure,subplot(2,1,1),hist(s);title('自编随机数的分布');
subplot(2,1,2),hist(s,100);
title('自编随机数的100份分布');
figure,subplot(2,1,1),hist(y);title('对照随机数的分布');
subplot(2,1,2),hist(y,100);
title('对照随机数的100份分布');
Max=max(s);disp(['自编最大值',num2str(Max),'。']);
Min=min(s);disp(['自编最小值',num2str(Min),'。']);
Max1=max(y);disp(['对照最大值',num2str(Max1),'。']);
Min1=min(y);disp(['对照最小值',num2str(Min1),'。']);
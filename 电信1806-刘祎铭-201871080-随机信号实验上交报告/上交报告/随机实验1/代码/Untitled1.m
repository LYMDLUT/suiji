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
figure,subplot(2,2,1),plot(s)  %全部
title('全部数据连线');
subplot(2,2,2),plot(s(1:100)) %前100个数据
title('前100个数据连线');
% 画点
subplot(2,2,3),plot(s,'.')  %全部
title('全部数据画点');
subplot(2,2,4),plot(s(1:100),'*') %前100个数据
title('前100个数据画点');
suptitle('自编代码生成数据展示')
% 画线
figure,subplot(2,2,1),plot(y)  %全部
title('全部数据连线');
subplot(2,2,2),plot(y(1:100)) %前100个数据
title('前100个数据连线');
% 画点
subplot(2,2,3),plot(y,'.')  %全部
title('全部数据画点');
subplot(2,2,4),plot(y(1:100),'*') %前100个数据
title('前100个数据画点');
suptitle('对照库函数代码生成数据展示')
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
disp(['对照库函数随机数的各阶矩',num2str(m),'。']);
%直方图
figure,subplot(2,1,1),hist(s);title('自编分10个区间的直方图');
subplot(2,1,2),hist(s,100);
title('自编分100个区间的直方图');
figure,subplot(2,1,1),hist(y);title('对照库函数分10个区间的直方图');
subplot(2,1,2),hist(y,100);
title('对照库函数分100个区间的直方图');
Max=max(s);disp(['自编最大值',num2str(Max),'。']);
Min=min(s);disp(['自编最小值',num2str(Min),'。']);
Max1=max(y);disp(['对照库函数最大值',num2str(Max1),'。']);
Min1=min(y);disp(['对照库函数最小值',num2str(Min1),'。']);

[f,xi]=ksdensity(s);
figure,subplot(2,1,1),plot(xi,f);
title('利用MATLAB函数ksdensity估计的概率密度')

% 预设的[0 ,1]均匀分布概率图
t=-0.2:1/10000000:1.2;
ff=ones(size(t)).*(t<=1&t>=0)+0*(t<0&t>=-0.2)+0*(t<=1.2&t>1);
subplot(2,1,2),plot(t,ff);
title('预设的[0 ,1]均匀分布理论概率图')

suptitle('自编代码生成数据概率图与理论概率比较')
[f,xi]=ksdensity(y);
figure,subplot(2,1,1),plot(xi,f);
title('利用MATLAB函数ksdensity估计的概率密度')

% 预设的[0 ,1]均匀分布概率图
t=-0.2:1/10000000:1.2;
ff=ones(size(t)).*(t<=1&t>=0)+0*(t<0&t>=-0.2)+0*(t<=1.2&t>1);
subplot(2,1,2),plot(t,ff);

title('预设的[0 ,1]均匀分布理论概率图')

suptitle('对照库函数代码生成数据概率图与理论概率比较')


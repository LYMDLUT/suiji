%% task1_1
%% 准备环境
clear all
close all
clc
%% 均匀分布随机数的产生
% 生成 1000 数据
% function s = randuniform(M,b,r,first,num)
num = 1000;

M = 1048576;b = 1;r = 2045;first = 12357;
s = zeros(1,num);
s(1) = first;

for i = 2 : num
    s(i) = mod(s(i-1)*r+b,M);
end
s = s/M;


%% 展示数据
%% 画线和画点
% 画线
figure,
subplot(2,2,1),plot(s)  %全部
title('全部数据连线')
subplot(2,2,2),plot(s(1:100)) %前100个数据
title('前100个数据连线')

% 画点
subplot(2,2,3),plot(s,'.')  %全部
title('全部数据画点')
subplot(2,2,4),plot(s(1:100),'*') %前100个数据
title('前100个数据画点')
suptitle('自编代码生成数据展示')
%% 画直方图
figure,subplot(2,1,1),hist(s)
title('分10个区间的直方图')

subplot(2,1,2),hist(s,100)
title('分100个区间的直方图')

suptitle('自编代码生成数据直方图展示')

%% 估计随机数的分布
[f,xi]=ksdensity(s);
figure,subplot(2,1,1),plot(xi,f);
title('利用MATLAB函数ksdensity估计的概率密度')

% 预设的[0 ,1]均匀分布概率图
t=0:1/100:1;
subplot(2,1,2),plot(t,ones(size(t)));
title('预设的[0 ,1]均匀分布理论概率图')

suptitle('自编代码生成数据概率图与理论概率比较')

%% 求随机数的均值、均方值、一维三阶原点矩、一维四阶原点矩

m = zeros(1,4);        %生成[0 0 0 0]
for i = 1 : num
    m(1) = m(1) + s(i);    % 均值
    m(2) = m(2) + s(i)^2;  % 二阶矩
    m(3) = m(3) + s(i)^3;  %三阶
    m(4) = m(4) + s(i)^4;  %四阶
end
m=m/num;
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(m(1))] );
disp(['均方值 = ',num2str(m(2))] );
disp(['三阶原点矩 = ',num2str(m(3))] );
disp(['四阶原点矩 = ',num2str(m(4))] );

%% ====== 对比：Matlab内置函数调用 ====== 
disp('========以下对比Matlab库函数生成的数据========')
disp('========        按任意键继续         ========')
% pause;
%% 生成 num 点数据
sm = rand(1,num); 

%% 展示数据
%% 画线和画点
% 画线
figure,
subplot(2,2,1),plot(sm)  %全部
title('全部数据连线')
subplot(2,2,2),plot(sm(1:100)) %前100个数据
title('前100个数据连线')

% 画点
subplot(2,2,3),plot(sm,'.')  %全部
title('全部数据画点')
subplot(2,2,4),plot(sm(1:100),'*') %前100个数据
title('前100个数据画点')

suptitle('MATLAB内置函数生成数据展示')
%% 画直方图
figure,
subplot(2,1,1),hist(sm)
title('分10个区间的直方图')

subplot(2,1,2),hist(sm,100)
title('分100个区间的直方图')
suptitle('MATLAB内置函数生成数据展示')
%% 估计随机数的分布
[f,xi]=ksdensity(sm);
figure,plot(xi,f);
title('利用MATLAB函数ksdensity估计的概率密度')

suptitle('MATLAB内置函数生成数据展示')
%% 求随机数的均值、均方值、一维三阶原点矩、一维四阶原点矩

m = zeros(1,4);        %生成[0 0 0 0]
for i = 1 : num
    m(1) = m(1) + sm(i);    % 均值
    m(2) = m(2) + sm(i)^2;  % 二阶矩
    m(3) = m(3) + sm(i)^3;  %三阶
    m(4) = m(4) + sm(i)^4;  %四阶
end
m=m/num;
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(m(1))] );
disp(['均方值 = ',num2str(m(2))] );
disp(['三阶原点矩 = ',num2str(m(3))] );
disp(['四阶原点矩 = ',num2str(m(4))] );


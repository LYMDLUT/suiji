%% task1_2
%% 配置环境
clear all;
close all;
clc;
%% 产生高斯随机变量
m=3;
a=2;
num=10000;
s=rnd1(m,a,num);
y=rnd2(m,a,num);
%% 画线和画点
% 画线
figure,subplot(2,2,1),plot(s);
title('中心极限累加法全部数据连线');
% 画点
subplot(2,2,2),plot(s,'.');
title('中心极限累加法全部数据画点');
% 画线
subplot(2,2,3),plot(y);
title('变换法全部数据连线');
% 画点
subplot(2,2,4),plot(y,'.');
title('变换法全部数据画点');

%% 求随机数的均值、均方值、一维三阶原点矩、一维四阶原点矩
n=zeros(1,4);
for i=1:10000
    n(1)=n(1)+s(i);
    n(2)=n(2)+s(i)^2;
    n(3)=n(3)+s(i)^3;
    n(4)=n(4)+s(i)^4;
end
n=n/10000;
disp(['中心极限累加法生成数据的数字特征'])
disp(['均值 = ',num2str(n(1))] );
disp(['均方值 = ',num2str(n(2))] );
disp(['三阶原点矩 = ',num2str(n(3))] );
disp(['四阶原点矩 = ',num2str(n(4))] );
m1=zeros(1,4);
for i=1:10000
    m1(1)=m1(1)+y(i);
    m1(2)=m1(2)+y(i)^2;
    m1(3)=m1(3)+y(i)^3;
    m1(4)=m1(4)+y(i)^4;
end
m1=m1/10000;
disp(['变换法生成数据的数字特征'])
disp(['均值 = ',num2str(m1(1))] );
disp(['均方值 = ',num2str(m1(2))] );
disp(['三阶原点矩 = ',num2str(m1(3))] );
disp(['四阶原点矩 = ',num2str(m1(4))] );
%% 最大最小值
Max=max(s);disp(['中心极限累加法最大值',num2str(Max),'。']);
Min=min(s);disp(['中心极限累加法最小值',num2str(Min),'。']);
Max1=max(y);disp(['变换法最大值',num2str(Max1),'。']);
Min1=min(y);disp(['变换法最小值',num2str(Min1),'。']);
%% 
disp('中心极限累加法')
meanValue = mean(s);
stdValue  = std(s);
disp('----------')
disp(['预设参数，均值为：',num2str(m),',标准差为：',num2str(a)]);
disp(['计算参数，均值为：',num2str(meanValue),',标准差为：',num2str(stdValue)]);

meanErr = (meanValue - m)/(m)*100;
stdErr  = (stdValue - a)/(a)*100;

disp(['相对误差分别为：',num2str(meanErr),' %, 和：',num2str(stdErr),' %'])
disp('两者相近。从直方图和低阶矩上看，基本符合要求。')
%% 验证均值和方差
disp('变换法')
meanValue = mean(y);
stdValue  = std(y);
disp('----------')
disp(['预设参数，均值为：',num2str(m),',标准差为：',num2str(a)]);
disp(['计算参数，均值为：',num2str(meanValue),',标准差为：',num2str(stdValue)]);

meanErr = (meanValue - m)/(m)*100;
stdErr  = (stdValue - a)/(a)*100;

disp(['相对误差分别为：',num2str(meanErr),' %, 和：',num2str(stdErr),' %'])
disp('两者相近。从直方图和低阶矩上看，基本符合要求。')
%% 
[zxg1,n1]=xcorr(s,'coeff');
[zxg2,n2]=xcorr(y,'coeff');
figure,subplot(2,1,1),plot(n1,zxg1);
title('中心极限累加法高斯相关');
subplot(2,1,2),plot(n2,zxg2);
title('变换法高斯相关');
[f,xi]=ksdensity(s);
figure,subplot(3,1,1),plot(xi,f);
title('中心极限累加法利用MATLAB函数ksdensity估计的概率密度')
[f,xi]=ksdensity(y);
subplot(3,1,2),plot(xi,f);
title('变换法利用MATLAB函数ksdensity估计的概率密度')
xlim([-6,12]);
t=-50:1/100:50;
k=1/(sqrt(2*pi)*a)*exp(-(t-m).^2/(2*a*a));
subplot(3,1,3),plot(t,k);
title('预设的N（m，a）高斯分布理论概率图')
xlim([-6,12]);
suptitle('自编代码生成数据概率图与理论概率比较')
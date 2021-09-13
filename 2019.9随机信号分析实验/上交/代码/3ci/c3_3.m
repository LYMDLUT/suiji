%% task3_3
%% 配置环境
clear all
clc
close all
%% 产生随机信号
N=10000;f0=10000;deltf=500;fs=22000;M=50;
X=NarrowBand(N,f0,deltf,fs,M);
X=X/sqrt(var(X));                       %归一化方差
figure;subplot(2,1,1);plot(X);
title('窄带信号的时域波形')
% 功率谱
subplot(2,1,2);plot(periodogram(X));
title('窄带信号功率谱密度')       
%% 取得窄带随机信号的包络、相位、包络平方
[At, Ph, At2]=EnvelopPhase(X,f0,fs);
%% 时域波形及直方图
figure;subplot(321);plot(At);
title('包络样本连线');
subplot(323);plot(Ph);
title('相位样本连线');
subplot(325);plot(At2);
title('包络平方值样本连线');
qj1 =0:0.05:4;
subplot(322);hist(At,qj1);
title('包络样本值的分布直方图（瑞利）');
qj2=-pi/2:0.05:pi/2;
subplot(324);hist(Ph,qj2);
title('相位样本值的分布直方图（均匀）');
qj3=0:0.2:16;
subplot(326);hist(At2,qj3);
title('包络平方值的分布直方图（指数）');
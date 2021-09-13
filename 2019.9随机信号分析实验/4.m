clear all
close all
% clf
clc
[s,Fs1]=audioread('201746013_sound1.wav');
[sLag,FS2]=audioread('201746013_sound2.wav');
num=length(s);
subplot(2,1,1);plot(s)
title('数据源信号')
hold on
subplot(2,1,2);plot(sLag,'r')

title('信号及其延迟信号');
[x,lags]=xcorr(s,sLag,'coeff');
figure;plot(lags,x)
title('两路同源信号的互相关，峰值处最相关');
[mx,indx] = max (x);
TLag = abs(num - indx);
t_all=num/8192;
t_lag=t_all*(TLag/num);
disp(['经计算相关函数，估计延迟点数为：',num2str(TLag),'。'])
disp(['经计算相关函数，估计延迟时间为：',num2str(t_lag),'。'])
[x,lags]=xcorr(s,sLag,10000,'coeff');
figure;plot(lags,x)
title('两路同源信号的互相关，峰值处最相关');
s_lag=sLag(1:TLag);
figure;plot(s_lag);
title('延迟段信号');
alpha=0.05;
judge(s_lag,alpha)
%延迟段信号均值
%mean(s_lag)
[y,xi]=ksdensity(s_lag,[0:0.01:1]);
plot(xi,y*0.01)
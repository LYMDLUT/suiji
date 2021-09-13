%% task2_1
%% 配置环境
clc;
clear all;
close all;
%% 生成随机信号
N=1024;fs=1000;                     %序列长度和采样频率
t=(0:N-1)/fs;                       %时间序列
fai=random('unif',0,1,1,2)*2*pi;      %产生2个[0，2pi]内均匀随机数
xn=cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N);%产生含噪声的随机序列`
figure,plot(xn);
title('随机信号时域波形')
%% 直接法谱估计
Sx1=abs(fft(xn)).^2/N;
f=(0:N/2-1)*fs/N;
figure
plot(f,10*log10(Sx1(1:N/2))); 
xlabel('f（Hz）');
ylabel('Sx1(f)(dB/Hz)');
title('周期图法估计功率谱');
%% 内置函数periodogram计算功率谱
Sx2=periodogram(xn);
figure
plot(f,10*log10(Sx2(1:N/2)));
xlabel('f(Hz)');
ylabel('Sx2(f)(dB/Hz)');
title('periodogram函数估计功率谱');
%% 比较二者误差
Sx22=Sx2';
err=Sx1(1:2:N)-Sx22(1:N/2);
figure
plot(f,10*log10(10*log10(err)));
xlabel('f(Hz)');
ylabel('Sx1(f)-Sx2(f) (dB/Hz)');
title('周期图法谱估计与periodogram法谱估计的误差');
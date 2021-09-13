%% 实验II：系统对随机信号响应的统计特性分析、功率谱分析及应用实验
clear all 
close all
clc
%% 生成随机信号样本
%两个带随机相位的单谱信号与白噪声之和
N=1024;fs=1000;                     %序列长度和采样频率
t=(0:N-1)/fs;                       %时间序列
fai=random('unif',0,1,1,2)*2*pi;    %产生1*2的[0，2pi]内均匀随机数random（a,b,c,d）ab为上下限，cd为维度
xn=cos(2*pi*30*t+fai(1))+3*cos(2*pi*100*t+fai(2))+randn(1,N);
                                    %产生含噪声的随机序列，信号频率为30hz和100hz
 %% 显示数据
 figure(1),plot(xn);
title('随机信号时域波形')
%% 直接法谱估计
Sx1=abs(fft(xn)).^2/N;              %对输入信号xn快速傅里叶变换估计功率谱
f=(0:N/2-1)*fs/N;                   %频率轴坐标
figure(2)
subplot(211);
plot(f,10*log10(Sx1(1:N/2)));grid on; %用dB/Hz做功率谱单位，画图
xlabel('f（Hz）');
ylabel('Sx1(f)(dB/Hz)');
title('周期图法估计功率谱');
%% 与内置函数对比
Sx2=periodogram(xn);
subplot(212);
plot(f,10*log10(Sx2(1:N/2)));grid on;
xlabel('f(Hz)');
ylabel('Sx2(f)(dB/Hz)');
title('periodogram函数估计功率谱');

%% 间接法谱估计
Rxx=xcorr(xn,'biased');                     %估计自相关函数Rxx
Sx1=abs(fft(Rxx));                          %对自相关函数Rxx进行FFT得到功率谱
f=(0:N-1)*fs/N/2;                           %频率轴坐标
figure(3);
plot(f,10*log10(Sx1(1:N)));grid on;          %用dB/Hz做功率谱单位，画图
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('自相关函数法估计功率谱');

%% 
Sx3=pwelch(xn,window,128,Nseg,fs,'onesided')*fs/2;
figure(3);                                  %Welch函数估计功率谱
plot(f,10*log10(Sx3));grid on;
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('Welch法估计功率谱');




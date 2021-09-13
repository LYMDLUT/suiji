clear all %清空工作区与全局变量
close all %关闭所有窗口
clc %清空命令区域
N=1024;fs=1000; %设置随机信号点数及采样频率
t=(0:N-1)/fs;
fai=random('unif',0,1,1,2)*2*pi; % 产生2 个0 到2pi 的随机均匀数
xn=2*cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N);
 %X（n）表达式
Rxx=xcorr(xn,'biased'); %求X（n）的自相关
Sx=abs(fft(Rxx)); %对相关函数傅里叶变换求得功率谱密度
f=(0:N-1)*fs/N/2;
plot(f,10*log10(Sx(1:N)));
title('自相关函数法功率谱估计') %图的标题
hold on
figure %画图
N=1024;fs=1000; %设置随机信号点数及采样频率
t=(0:N-1)/fs;
fai=random('unif',0,1,1,2)*2*pi; % 产生2 个0 到2pi 的随机均匀数
xn=2*cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N);
%Xn 的表达式
Nseg=256;
window=hanning(Nseg); %汉宁窗
noverlap=Nseg/2;
f1=(0:Nseg/2)*fs/Nseg;
Sx1=psd(xn,Nseg,fs,window,noverlap,'none');%psd 函数估计功率谱密度
subplot(2,1,1);plot(f1,10*log10(Sx1));
title('Psd 函数估计功率谱'); %图的标题
Sx2=pwelch(xn,window,128,Nseg,fs,'onesided')*fs/2;
%pwelch 方法估计功率谱密度
subplot(2,1,2);plot(f1,10*log10(Sx2));
title('pwelch 函数估计功率谱'); %图的标题

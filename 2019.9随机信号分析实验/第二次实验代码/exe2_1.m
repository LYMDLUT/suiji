clear all %清空工作区与全局变量
close all %关闭所有窗口
clc %清空命令区域
N=1024;fs=1000; %设置随机信号点数及采样频率
t=(0:N-1)/fs;
fai=random('unif',0,1,1,2)*2*pi; %产生2 个0 到2pi 的随机均匀数
xn=2*cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N); 
%题干中表达式
figure; %画图
subplot(2,1,1);plot(xn);
title('输入信号的时域图'); %图的标题
axis([0 1010 -10 10]) %规定图的区间
Sx=abs(fft(xn)); %估计其频域
subplot(2,1,2);plot(Sx);
axis([0 1010 0 2000]) %规定图的区间
title('输入信号的频域图'); %图的标题
Sx1=abs(fft(xn).^2)/N; %利用直接法估计其功率谱密度
f=(0:N/2-1)*fs/N; %坐标轴的横坐标
figure; %画图
subplot(2,1,1),plot(f,10*log10(Sx1(1:N/2)));
xlabel('f(Hz)'); %横坐标
ylabel('Sx1(f)(dB/Hz)'); %纵坐标
title('直接法估计随机信号功率谱');
Sx2=periodogram(xn); %调用periodogram 函数估计功率谱密度
subplot(212);
plot(f,10*log10(Sx2(1:N/2)));grid on;
xlabel('f(Hz)'); %横坐标
ylabel('Sx2(f)(dB/Hz)'); %纵坐标
title('periodogram 函数估计功率谱'); %图的标题

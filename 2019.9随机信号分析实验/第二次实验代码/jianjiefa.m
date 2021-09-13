clear all
close all
clc
N=1024;fs=1000;                             %序列长度和采样频率
t=(0:N-1)/fs;                               %时间序列
fai=random('unif',0.1,1,2)*2*pi;            %产生2个[0，2pi]内均匀随机数
xn=cos(2*pi*30*t+fai(1))+3*cos(2*pi*100*t+fai(2))+randn(1,N);
                                            %产生含噪声的随机序列
figure,plot(xn);
title('随机信号时域波形')
Rxx=xcorr(xn,'biased');                     %估计自相关函数Rxx
Sx1=abs(fft(Rxx));                          %对Rxx进行FFT得到功率谱
f=(0:N-1)*fs/N/2;                           %频率轴坐标
figure(1);
plot(f,10*log10(Sx1(1:N)));grid on;          %用dB/Hz做功率谱单位，画图
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('自相关函数法估计功率谱');








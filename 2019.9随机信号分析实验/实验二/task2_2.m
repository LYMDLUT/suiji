%% task2_2
%% 配置环境
clc;
clear all;
close all;
%% 生成随机信号
N=1024;fs=1000;                     %序列长度和采样频率
t=(0:N-1)/fs;                       %时间序列
fai=random('unif',0,1,1,2)*2*pi;      %产生2个[0，2pi]内均匀随机数
xn=cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N);%产生含噪声的随机序列
figure,plot(xn);
title('随机信号时域波形')
%% 间接法谱估计
Rx=xcorr(xn,'biased');              %估计自相关函数Rx
Sx1=abs(fft(Rx));                   %对Rx进行FTT得到功率谱
f=(0:N-1)*fs/N/2;                   %频率轴坐标        
figure;
plot(f,10*log10(Sx1(1:N)));         %画功率谱
xlabel('f(Hz)');
ylabel('Sx1(f)(dB/Hz)');
title('自相关函数法估计功率谱');
%% 内置函数psd
Nseg=256;                                   %分段间隔为256
window=hanning(Nseg);                       %汉宁窗
noverlap=Nseg/2;                            %重叠点数为128
f=(0:Nseg/2)*fs/Nseg;                       %频率轴坐标
Sx2=mypsd(xn,Nseg,fs,window,noverlap,'none'); %psd函数估计功率谱
figure;
plot(f,10*log10(Sx2));grid on;              %画功率谱
xlabel('f(Hz)');
ylabel('Sx2(f)(dB/Hz)');
title('psd函数估计功率谱');
%% 内置函数pwelch
Sx3=pwelch(xn,window,128,Nseg,fs,'onesided')*fs/2;  %Welch函数估计功率谱
figure;                                  
plot(f,10*log10(Sx3));grid on;
xlabel('f(Hz)');
ylabel('Sx3(f)(dB/Hz)');
title('pwelch函数估计功率谱');
%% 比较三者的误差
% Sx1:1*2047,Sx2:129*1,Sx3:129*1
Sx11=Sx1';
err1=Sx11(1:16:N*2-1)-Sx2(1:N/8);
ff=f(1:length(f)-1);
figure;subplot(311);plot(ff,10*log10(err1));
xlabel('f(Hz)');
ylabel('Sx1(f)-Sx2(f) (dB/Hz)');
title('间接法谱估计与psd函数估计的误差');
err2=Sx11(1:16:N*2-1)-Sx3(1:N/8);
subplot(312);plot(ff,10*log10(err2));
xlabel('f(Hz)');
ylabel('Sx1(f)-Sx3(f) (dB/Hz)');
title('间接法谱估计与pwelch函数估计的误差');
err3=Sx2-Sx3;
subplot(313);plot(f,10*log10(err3));
xlabel('f(Hz)');
ylabel('Sx2(f)-Sx3(f) (dB/Hz)');
title('psd函数估计与pwelch函数估计的误差');
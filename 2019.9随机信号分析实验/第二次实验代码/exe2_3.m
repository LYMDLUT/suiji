clear all %清空工作区与全局变量
close all %关闭所有窗口
clc %清空命令区域
N=500; %样本长度N=500，对应时长25ms
xt=random('norm',0,1,1,N); %产生1*N 个高斯随机数
ht=fir1(101,[0.3 0.4]);
%101 阶带通滤波器，数字截止频率为0.3kHz 和0.4kHz
HW=fft(ht,2*N); %2N 点滤波器频率响应（系统传输函数）
Rxx=xcorr(xt,'biased'); %直接法估计白噪声的自相关函数
Sxx=abs(fft(xt,2*N).^2)/(N);
HW2=abs(HW).^2; %系统的功率传输函数
Syy=Sxx.*HW2; %信号的功率谱
Ryy=fftshift(ifft(Syy)); %求信号的自相关
w=(1:N)/N; %功率谱密度的横轴坐标
t=(-N:N-1)/N*(N/20000); %自相关函数的横轴坐标
[x1,lags]=xcorr(xt,'coeff'); %求输入信号的自相关
fj = conv(xt,ht,'same'); %求系统函数与输入信号的卷积
Ry1=xcorr(fj,'biased'); %求输出函数的自相关
Sy2=fft(Ry1); %求得输出函数的功率谱密度
figure;
subplot(2,2,1);plot(xt); %画图
title('输入信号的时域图'); %图的标题
Sx=abs(fft(xt)); %对输入函数进行傅里叶变换
subplot(2,2,2);plot(Sx); %画图
title('输入信号的频域图'); %图的标题
subplot(2,2,3);plot(lags,x1); %画图
title('输入信号的自相关'); %图的标题
subplot(2,2,4);plot(w,abs(Sxx(1:N))); %画图
title('输入信号的功率谱密度'); %图的标题
figure;
subplot(3,1,1); plot(ht); %画图
title('系统传输函数的时域图'); %图的标题
subplot(3,1,2);plot(HW); %画图
title('系统传输函数的频域图'); %图的标题
subplot(3,1,3);plot(w,abs(HW2(1:N))); %画图
title('系统的功率传输函数'); %图的标题
figure;
subplot(2,1,1);plot(t,Ryy); %画图
title('输出信号的自相关函数'); %图的标题
subplot(2,1,2);plot(w,abs(Syy(1:N))); %画图
title('输出信号的功率谱密度'); %图的标题
figure;
subplot(2,1,1);plot(Ry1); %画图
title('卷积计算得到输出信号自相关'); %图的标题
subplot(2,1,2);plot(w,abs(Sy2(1:N))); %画图
title('卷积计算得到的输出功率谱密度'); %图的标题

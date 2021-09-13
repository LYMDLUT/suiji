%% task2_3
%% 配置环境
clc;
clear all;
close all;
%% 生成随机信号样本
N=500;
xn=rnd2(0,1,N);

%% 设计滤波器
%冲激响应
ht=fir1(100,[0.3 0.4]);                     %100阶带通滤波器，数字截止频率为0.3和0.4
%传递函数
HW=fft(ht,2*N);                             %2N点滤波器频率响应（系统传输函数）
%% 估计输入信号的自相关和功率谱
%自相关
Rx=xcorr(xn,'biased');                      %直接法估计白噪声的自相关函数
% 功率谱
Gx=abs(fft(xn,2*N).^2)/(2*N);               %周期图法估计白噪声的功率谱
%% 系统求解
Gw=abs(HW).^2;                              %系统的功率传输函数
Gy=Gx.*Gw;                                  %输出信号的功率谱
Ry=fftshift(ifft(Gy));                      %用IFFT求输出信号的自相关函数
                                                   %函数fftshift对数组进行移位
%% figure-输入信号
w=(1:N)/N;                                  %功率谱密度横轴坐标
t=(-N:N-1)/N*(N/20000);                     %自相关函数横轴坐标
figure,subplot(311)
plot(xn);
title('随机信号时域波形')
subplot(312);plot(Rx)
title('输入自相关函数Rx')
subplot(313);plot(w,abs(Gx(1:N)));
xlabel('归一化频率f');ylabel('Gx(f)');title('输入信号功率谱密度');
%% figure-系统本身
figure
subplot(211),plot(ht)
title('冲激响应函数ht')
subplot(212);plot(w,abs(Gw(1:N)));
xlabel('归一化频率f');ylabel('H2(f)');title('系统的功率传输函数');

%% figure-信号过系统
figure
subplot(411);plot(w,abs(Gx(1:N)));
xlabel('归一化频率f');ylabel('Gx(f)');title('输入信号功率谱密度');
subplot(412);plot(w,abs(Gw(1:N)));
xlabel('归一化频率f');ylabel('H2(f)');title('系统的功率传输函数');
subplot(413);plot(w,abs(Gy(1:N)));
xlabel('归一化频率f');ylabel('Gy(f)');title('输出信号的功率谱密度');
subplot(414);plot(t,Ry);
xlabel('归一化频率f');ylabel('Ry(f)');title('输出信号的自相关函数');
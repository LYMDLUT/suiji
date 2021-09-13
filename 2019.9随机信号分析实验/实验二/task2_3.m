%% task2_3
%% 配置环境
clc;
clear all;
close all;
%% 产生高斯白噪声
N=500;
xt=random('norm',0,1,1,N);
%% 设计带通滤波器
ht=fir1(100,[0.3 0.4]);
HW=fft(ht,2*N);
%% 仿真
Rx=xcorr(xt,'biased');
Sx=abs(fft(xt,2*N).^2)/(2*N);
HW2=abs(HW).^2;
Sy=Sx.*HW2;
Ry=fftshift(ifft(Sy));
%% 画曲线
w=(1:N)/N;
t=(-N:N-1)/N*(N/20000);
subplot(4,1,1);plot(w,abs(Sx(1:N)));
xlabel('归一化频率f');ylabel('Sx(f)');title('输入信号功率谱密度');
subplot(4,1,2);plot(w,abs(HW2(1:N)));
xlabel('归一化频率f');ylabel('Hw(f)');title('系统的功率传输函数');
subplot(4,1,3);plot(w,abs(Sy(1:N)));
xlabel('归一化频率f');ylabel('Sy(f)');title('输出信号功率谱密度');
subplot(4,1,4);plot(t,Ry);
xlabel('时间τ');ylabel('Ry(τ)');title('输出信号的自相关函数');

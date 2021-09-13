N=500;                                      %样本长度N=500，对应时长25ms
xt=random('norm',0,1,1,N);                  %产生1*N个高斯随机数
% 显示时域波形
figure,plot(xt);
title('随机信号时域波形')
%冲激响应
ht=fir1(101,[0.3 0.4]);                     % 101阶带通滤波器，数字截止频率为0.3和0.4
% 显示冲激响应函数ht
figure,plot(ht)
title('冲激响应函数ht')
%传递函数
HW=fft(ht,2*N);                             %2N点滤波器频率响应（系统传输函数）
% 显示传递函数HW
figure,plot((1:N)/N,abs(HW(1:N)));
title('传递函数HW')
Rxx=xcorr(xt,'biased');                     %直接法估计白噪声的自相关函数
% 显示自相关函数Rxx
figure,stem(Rxx)
title('输入自相关函数Rxx')
Sxx=abs(fft(xt,2*N).^2)/(2*N);              %周期图法估计白噪声的功率谱
HW2=abs(HW).^2;                             %系统的功率传输函数
Syy=Sxx.*HW2;                               %输出信号的功率谱
Ryy=fftshift(ifft(Syy));                    %用IFFT求输出信号的自相关函数
                                                   %函数fftshift对数组进行移                                                   
w=(1:N)/N;                                  %功率谱密度横轴坐标
t=(-N:N-1)/N*(N/20000);                     %自相关函数横轴坐标
subplot(4,1,1);plot(w,abs(Sxx(1:N)));       %输入信号功率谱密度
xlabel('归一化频率f');ylabel('Sxx(f)');title('输入信号功率谱密度');
subplot(4,1,2);plot(w,abs(HW2(1:N)));       %系统的功率传输函数
xlabel('归一化频率f');ylabel('H2(f)');title('系统的功率传输函数');
subplot(4,1,3);plot(w,abs(Syy(1:N)));       %输出信号的功率谱密度
xlabel('归一化频率f');ylabel('Syy(f)');title('输出信号的功率谱密度');
subplot(4,1,4);plot(t,Ryy);                 %输出信号的自相关函数
xlabel('归一化频率f');ylabel('Ryy(f)');title('输出信号的自相关函数');
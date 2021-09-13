N=1024;fs=1000;                     %序列长度和采样频率
t=(0:N-1)/fs;                       %时间序列
fai=random('unif',0,1,1,2)*2*pi;    %产生2个[0，2pi]内均匀随机数
xn=cos(2*pi*30*t+fai(1))+3*cos(2*pi*100*t+fai(2))+randn(1,N);
                                    %产生含噪声的随机序列
figure,plot(xn);
title('随机信号时域波形')
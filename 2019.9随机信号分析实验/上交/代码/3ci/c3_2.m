
N=10000;f0=10000;deltf=500;fs=22000;M=200;
X=NarrowBand(N,f0,deltf,fs,M);

figure;subplot(311);plot(X);
title('窄带随机信号时域波形')
% 自相关函数
subplot(312)
[Rx,lag]=xcorr(X,'biased');
plot(lag,Rx);
title('窄带随机信号自相关函数')
% 功率谱
subplot(313);plot(periodogram(X));
title('窄带随机信号功率谱密度')

[Ac As]=Lowfsignal(X,f0,fs);

Rac=xcorr(Ac,'biased');                    
Ras=xcorr(As,'biased');                     
Gwac=abs(fft(Rac));
Gwas=abs(fft(Ras));
Gxw=abs(fft(Rx));
N1=2*N-1;
f=fs/N1:fs/N1:fs/2;                         %频率轴的变换


% 时域波形及自相关
figure,subplot(411);plot(Ac);
title('Ac(t)时域波形')
subplot(412);plot(Rac);
title('Ac(t)的自相关函数');
subplot(413);plot(As);
title('As(t)时域波形')
subplot(414);plot(Ras);
title('As(t)自相关函数');

%功率谱密度
figure,subplot(311);plot(f,10*log10(Gxw(1:(N1-1)/2)));          %功率谱纵坐标改为采用db/Hz
title('窄带随机信号的功率谱密度');
subplot(312);plot(f,10*log10(Gwac(1:(N1-1)/2)));
title('Ac(t)的功率谱密度');
subplot(313);plot(f,10*log10(Gwas(1:(N1-1)/2)));
title('As(t)的功率谱密度');

N=10000;f0=10000;deltf=500;fs=22000;M=200;
X=NarrowBand(N,f0,deltf,fs,M);

figure;subplot(311);plot(X);
title('խ������ź�ʱ����')
% ����غ���
subplot(312)
[Rx,lag]=xcorr(X,'biased');
plot(lag,Rx);
title('խ������ź�����غ���')
% ������
subplot(313);plot(periodogram(X));
title('խ������źŹ������ܶ�')

[Ac As]=Lowfsignal(X,f0,fs);

Rac=xcorr(Ac,'biased');                    
Ras=xcorr(As,'biased');                     
Gwac=abs(fft(Rac));
Gwas=abs(fft(Ras));
Gxw=abs(fft(Rx));
N1=2*N-1;
f=fs/N1:fs/N1:fs/2;                         %Ƶ����ı任


% ʱ���μ������
figure,subplot(411);plot(Ac);
title('Ac(t)ʱ����')
subplot(412);plot(Rac);
title('Ac(t)������غ���');
subplot(413);plot(As);
title('As(t)ʱ����')
subplot(414);plot(Ras);
title('As(t)����غ���');

%�������ܶ�
figure,subplot(311);plot(f,10*log10(Gxw(1:(N1-1)/2)));          %�������������Ϊ����db/Hz
title('խ������źŵĹ������ܶ�');
subplot(312);plot(f,10*log10(Gwac(1:(N1-1)/2)));
title('Ac(t)�Ĺ������ܶ�');
subplot(313);plot(f,10*log10(Gwas(1:(N1-1)/2)));
title('As(t)�Ĺ������ܶ�');
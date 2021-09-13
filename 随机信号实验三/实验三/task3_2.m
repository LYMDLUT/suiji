%% ׼������
clear all
close all
clc
%% ����խ������ź�
N=10000;f0=10000;deltf=500;fs=22000;M=200;  %���ò�������
X=NarrowBand(N,f0,deltf,fs,M);        %���ò���խ������źŵĺ���
%% չʾխ������
%ʱ��
figure,
subplot(2,1,1);plot(X);
title('ʱ����')
% ������
subplot(2,1,2);plot( periodogram( X));
title('խ���źŹ������ܶ�')

%����غ���
[Rx,lag]=xcorr(X,'biased');                       %խ������ź�����������غ���
figure,plot(lag,Rx);
title('խ���ź�����غ���')

%% ȡ��Ac(t)��As(t)����
[Ac, As]=Lowfsignal(X,f0,fs);                %���ò���Ac(t)��As(t)�ĺ���


%% չʾAc(t)��As(t)����ʱ����
%Ac(t)
figure,
subplot(2,1,1);plot(Ac);
title('Ac(t)ʱ����')
% As(t)
subplot(2,1,2);plot(As);
title('As(t)ʱ����')

%% չʾխ����Ac(t)��As(t)��������غ���
Rac=xcorr(Ac,'biased');                     %��Ƶ����Ac(t)����������غ���
Ras=xcorr(As,'biased');                     %��Ƶ����As(t)����������غ���
Racs=xcorr(As,Ac,'biased');                 %��Ƶ����As(t)����������غ���
Racw=abs(fft(Rac));                         %��Ƶ����Ac(t)�����Ĺ������ܶ�
Rasw=abs(fft(Ras));                         %��Ƶ����As(t)�����Ĺ������ܶ�
Rxw=abs(fft(Rx));                           %խ������ź������Ĺ������ܶ�
N1=2*N-1;
f=fs/N1:fs/N1:fs/2;                         %Ƶ����ı任

% ����غ���
figure,subplot(4,1,1);plot(Rx);
title('խ������ź�����������غ���');
subplot(4,1,2);plot(Rac);
title('��Ƶ����Ac(t)����������غ���');
subplot(4,1,3);plot(Ras);
title('��Ƶ����As(t)����������غ���');
subplot(4,1,4);plot(Racs);
title('��Ƶ����As(t)Ac(t)�����Ļ���غ���');

%% չʾխ����Ac(t)��As(t)�����������ܶ�
%�������ܶ�
figure,subplot(4,1,1);plot(f,10*log10(Rxw(1:(N1-1)/2)+eps));
title('խ������ź������Ĺ������ܶ�');
subplot(4,1,2);plot(f,10*log10(Racw(1:(N1-1)/2)+eps));

title('��Ƶ����Ac(t)�����Ĺ������ܶ�');
subplot(4,1,3);plot(f,10*log10(Rasw(1:(N1-1)/2)+eps));

title('��Ƶ����As(t)�����Ĺ������ܶ�');

xxx=[10*log10(Racw(1:(N1-1)/2)+eps)',10*log10(Rasw(1:(N1-1)/2)+eps)'];
[p,q]=chi2test(xxx);

AL=10*log10(Racw(1:(N1-1)/2)+eps);
ALL=10*log10(Rasw(1:(N1-1)/2)+eps);
Av=AL(1:9000)-ALL(1:9000);
subplot(4,1,4);plot(Av);

p
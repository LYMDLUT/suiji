clear all %��չ�������ȫ�ֱ���
close all %�ر����д���
clc %�����������
N=1024;fs=1000; %��������źŵ���������Ƶ��
t=(0:N-1)/fs;
fai=random('unif',0,1,1,2)*2*pi; % ����2 ��0 ��2pi �����������
xn=2*cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N);
 %X��n�����ʽ
Rxx=xcorr(xn,'biased'); %��X��n���������
Sx=abs(fft(Rxx)); %����غ�������Ҷ�任��ù������ܶ�
f=(0:N-1)*fs/N/2;
plot(f,10*log10(Sx(1:N)));
title('����غ����������׹���') %ͼ�ı���
hold on
figure %��ͼ
N=1024;fs=1000; %��������źŵ���������Ƶ��
t=(0:N-1)/fs;
fai=random('unif',0,1,1,2)*2*pi; % ����2 ��0 ��2pi �����������
xn=2*cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N);
%Xn �ı��ʽ
Nseg=256;
window=hanning(Nseg); %������
noverlap=Nseg/2;
f1=(0:Nseg/2)*fs/Nseg;
Sx1=psd(xn,Nseg,fs,window,noverlap,'none');%psd �������ƹ������ܶ�
subplot(2,1,1);plot(f1,10*log10(Sx1));
title('Psd �������ƹ�����'); %ͼ�ı���
Sx2=pwelch(xn,window,128,Nseg,fs,'onesided')*fs/2;
%pwelch �������ƹ������ܶ�
subplot(2,1,2);plot(f1,10*log10(Sx2));
title('pwelch �������ƹ�����'); %ͼ�ı���

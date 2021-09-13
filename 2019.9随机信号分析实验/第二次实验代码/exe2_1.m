clear all %��չ�������ȫ�ֱ���
close all %�ر����д���
clc %�����������
N=1024;fs=1000; %��������źŵ���������Ƶ��
t=(0:N-1)/fs;
fai=random('unif',0,1,1,2)*2*pi; %����2 ��0 ��2pi �����������
xn=2*cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N); 
%����б��ʽ
figure; %��ͼ
subplot(2,1,1);plot(xn);
title('�����źŵ�ʱ��ͼ'); %ͼ�ı���
axis([0 1010 -10 10]) %�涨ͼ������
Sx=abs(fft(xn)); %������Ƶ��
subplot(2,1,2);plot(Sx);
axis([0 1010 0 2000]) %�涨ͼ������
title('�����źŵ�Ƶ��ͼ'); %ͼ�ı���
Sx1=abs(fft(xn).^2)/N; %����ֱ�ӷ������书�����ܶ�
f=(0:N/2-1)*fs/N; %������ĺ�����
figure; %��ͼ
subplot(2,1,1),plot(f,10*log10(Sx1(1:N/2)));
xlabel('f(Hz)'); %������
ylabel('Sx1(f)(dB/Hz)'); %������
title('ֱ�ӷ���������źŹ�����');
Sx2=periodogram(xn); %����periodogram �������ƹ������ܶ�
subplot(212);
plot(f,10*log10(Sx2(1:N/2)));grid on;
xlabel('f(Hz)'); %������
ylabel('Sx2(f)(dB/Hz)'); %������
title('periodogram �������ƹ�����'); %ͼ�ı���

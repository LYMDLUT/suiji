%% task2_1
%% ���û���
clc;
clear all;
close all;
%% ��������ź�
N=1024;fs=1000;                     %���г��ȺͲ���Ƶ��
t=(0:N-1)/fs;                       %ʱ������
fai=random('unif',0,1,1,2)*2*pi;      %����2��[0��2pi]�ھ��������
xn=cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N);%�������������������`
figure,plot(xn);
title('����ź�ʱ����')
%% ֱ�ӷ��׹���
Sx1=abs(fft(xn)).^2/N;
f=(0:N/2-1)*fs/N;
figure
plot(f,10*log10(Sx1(1:N/2))); 
xlabel('f��Hz��');
ylabel('Sx1(f)(dB/Hz)');
title('����ͼ�����ƹ�����');
%% ���ú���periodogram���㹦����
Sx2=periodogram(xn);
figure
plot(f,10*log10(Sx2(1:N/2)));
xlabel('f(Hz)');
ylabel('Sx2(f)(dB/Hz)');
title('periodogram�������ƹ�����');
%% �Ƚ϶������
Sx22=Sx2';
err=Sx1(1:2:N)-Sx22(1:N/2);
figure
plot(f,10*log10(10*log10(err)));
xlabel('f(Hz)');
ylabel('Sx1(f)-Sx2(f) (dB/Hz)');
title('����ͼ���׹�����periodogram���׹��Ƶ����');
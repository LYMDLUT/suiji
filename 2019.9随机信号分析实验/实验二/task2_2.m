%% task2_2
%% ���û���
clc;
clear all;
close all;
%% ��������ź�
N=1024;fs=1000;                     %���г��ȺͲ���Ƶ��
t=(0:N-1)/fs;                       %ʱ������
fai=random('unif',0,1,1,2)*2*pi;      %����2��[0��2pi]�ھ��������
xn=cos(2*pi*30*t+fai(1))+5*cos(2*pi*100*t+fai(2))+randn(1,N);%�������������������
figure,plot(xn);
title('����ź�ʱ����')
%% ��ӷ��׹���
Rx=xcorr(xn,'biased');              %��������غ���Rx
Sx1=abs(fft(Rx));                   %��Rx����FTT�õ�������
f=(0:N-1)*fs/N/2;                   %Ƶ��������        
figure;
plot(f,10*log10(Sx1(1:N)));         %��������
xlabel('f(Hz)');
ylabel('Sx1(f)(dB/Hz)');
title('����غ��������ƹ�����');
%% ���ú���psd
Nseg=256;                                   %�ֶμ��Ϊ256
window=hanning(Nseg);                       %������
noverlap=Nseg/2;                            %�ص�����Ϊ128
f=(0:Nseg/2)*fs/Nseg;                       %Ƶ��������
Sx2=mypsd(xn,Nseg,fs,window,noverlap,'none'); %psd�������ƹ�����
figure;
plot(f,10*log10(Sx2));grid on;              %��������
xlabel('f(Hz)');
ylabel('Sx2(f)(dB/Hz)');
title('psd�������ƹ�����');
%% ���ú���pwelch
Sx3=pwelch(xn,window,128,Nseg,fs,'onesided')*fs/2;  %Welch�������ƹ�����
figure;                                  
plot(f,10*log10(Sx3));grid on;
xlabel('f(Hz)');
ylabel('Sx3(f)(dB/Hz)');
title('pwelch�������ƹ�����');
%% �Ƚ����ߵ����
% Sx1:1*2047,Sx2:129*1,Sx3:129*1
Sx11=Sx1';
err1=Sx11(1:16:N*2-1)-Sx2(1:N/8);
ff=f(1:length(f)-1);
figure;subplot(311);plot(ff,10*log10(err1));
xlabel('f(Hz)');
ylabel('Sx1(f)-Sx2(f) (dB/Hz)');
title('��ӷ��׹�����psd�������Ƶ����');
err2=Sx11(1:16:N*2-1)-Sx3(1:N/8);
subplot(312);plot(ff,10*log10(err2));
xlabel('f(Hz)');
ylabel('Sx1(f)-Sx3(f) (dB/Hz)');
title('��ӷ��׹�����pwelch�������Ƶ����');
err3=Sx2-Sx3;
subplot(313);plot(f,10*log10(err3));
xlabel('f(Hz)');
ylabel('Sx2(f)-Sx3(f) (dB/Hz)');
title('psd����������pwelch�������Ƶ����');
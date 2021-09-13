%% ʵ��II��ϵͳ������ź���Ӧ��ͳ�����Է����������׷�����Ӧ��ʵ��
clear all 
close all
clc
%% ��������ź�����
%�����������λ�ĵ����ź��������֮��
N=1024;fs=1000;                     %���г��ȺͲ���Ƶ��
t=(0:N-1)/fs;                       %ʱ������
fai=random('unif',0,1,1,2)*2*pi;    %����1*2��[0��2pi]�ھ��������random��a,b,c,d��abΪ�����ޣ�cdΪά��
xn=cos(2*pi*30*t+fai(1))+3*cos(2*pi*100*t+fai(2))+randn(1,N);
                                    %������������������У��ź�Ƶ��Ϊ30hz��100hz
 %% ��ʾ����
 figure(1),plot(xn);
title('����ź�ʱ����')
%% ֱ�ӷ��׹���
Sx1=abs(fft(xn)).^2/N;              %�������ź�xn���ٸ���Ҷ�任���ƹ�����
f=(0:N/2-1)*fs/N;                   %Ƶ��������
figure(2)
subplot(211);
plot(f,10*log10(Sx1(1:N/2)));grid on; %��dB/Hz�������׵�λ����ͼ
xlabel('f��Hz��');
ylabel('Sx1(f)(dB/Hz)');
title('����ͼ�����ƹ�����');
%% �����ú����Ա�
Sx2=periodogram(xn);
subplot(212);
plot(f,10*log10(Sx2(1:N/2)));grid on;
xlabel('f(Hz)');
ylabel('Sx2(f)(dB/Hz)');
title('periodogram�������ƹ�����');

%% ��ӷ��׹���
Rxx=xcorr(xn,'biased');                     %��������غ���Rxx
Sx1=abs(fft(Rxx));                          %������غ���Rxx����FFT�õ�������
f=(0:N-1)*fs/N/2;                           %Ƶ��������
figure(3);
plot(f,10*log10(Sx1(1:N)));grid on;          %��dB/Hz�������׵�λ����ͼ
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('����غ��������ƹ�����');

%% 
Sx3=pwelch(xn,window,128,Nseg,fs,'onesided')*fs/2;
figure(3);                                  %Welch�������ƹ�����
plot(f,10*log10(Sx3));grid on;
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('Welch�����ƹ�����');




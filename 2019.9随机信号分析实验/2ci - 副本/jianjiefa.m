clear all
close all
clc

N=1024;fs=1000;                             %���г��ȺͲ���Ƶ��
t=(0:N-1)/fs;                               %ʱ������
fai=random('unif',0.1,1,2)*2*pi;            %����2��[0��2pi]�ھ��������
xn=cos(2*pi*30*t+fai(1))+3*cos(2*pi*100*t+fai(2))+randn(1,N);
                                            %�������������������
                                            
figure(1),plot(xn);
title('����ź�ʱ����')

Rxx=xcorr(xn,'biased');                     %��������غ���Rxx
Sx1=abs(fft(Rxx));                          %��Rxx����FFT�õ�������
f=(0:N-1)*fs/N/2;                           %Ƶ��������
figure(2);
plot(f,10*log10(Sx1(1:N)));grid on;          %��dB/Hz�������׵�λ����ͼ
                                            %GUIGUIGIUIGUIGUIGUIGUIGUI6
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('����غ��������ƹ�����');


Nseg=256;                                   %�ֶμ��Ϊ256
window=hanning(Nseg);                       %������
noverlap=Nseg/2;                            %�ص�����Ϊ128
f=(0:Nseg/2)*fs/Nseg;                       %Ƶ��������



Nseg=256;                                   %�ֶμ��Ϊ256
window=hanning(Nseg);                       %������
noverlap=Nseg/2;                            %�ص�����Ϊ128
f=(0:Nseg/2)*fs/Nseg;                       %Ƶ��������
Sx2=mypsd(xn,Nseg,fs,window,noverlap,'none');  %psd�������ƹ�����
figure(3);
plot(f,10*log10(Sx2));grid on;             %GUIGUIGIUIGUIGUIGUIGUIGUI7
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('psd�������ƹ�����');



Sx3=pwelch(xn,window,128,Nseg,fs,'onesided')*fs/2;
figure(4);                                  %Welch�������ƹ�����
plot(f,10*log10(Sx3));grid on;              %GUIGUIGIUIGUIGUIGUIGUIGUI8
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('Welch�������ƹ�����');
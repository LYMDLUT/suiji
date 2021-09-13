clear all %��չ�������ȫ�ֱ���
close all %�ر����д���
clc %�����������
N=500; %��������N=500����Ӧʱ��25ms
xt=random('norm',0,1,1,N); %����1*N ����˹�����
ht=fir1(101,[0.3 0.4]);
%101 �״�ͨ�˲��������ֽ�ֹƵ��Ϊ0.3kHz ��0.4kHz
HW=fft(ht,2*N); %2N ���˲���Ƶ����Ӧ��ϵͳ���亯����
Rxx=xcorr(xt,'biased'); %ֱ�ӷ����ư�����������غ���
Sxx=abs(fft(xt,2*N).^2)/(N);
HW2=abs(HW).^2; %ϵͳ�Ĺ��ʴ��亯��
Syy=Sxx.*HW2; %�źŵĹ�����
Ryy=fftshift(ifft(Syy)); %���źŵ������
w=(1:N)/N; %�������ܶȵĺ�������
t=(-N:N-1)/N*(N/20000); %����غ����ĺ�������
[x1,lags]=xcorr(xt,'coeff'); %�������źŵ������
fj = conv(xt,ht,'same'); %��ϵͳ�����������źŵľ��
Ry1=xcorr(fj,'biased'); %����������������
Sy2=fft(Ry1); %�����������Ĺ������ܶ�
figure;
subplot(2,2,1);plot(xt); %��ͼ
title('�����źŵ�ʱ��ͼ'); %ͼ�ı���
Sx=abs(fft(xt)); %�����뺯�����и���Ҷ�任
subplot(2,2,2);plot(Sx); %��ͼ
title('�����źŵ�Ƶ��ͼ'); %ͼ�ı���
subplot(2,2,3);plot(lags,x1); %��ͼ
title('�����źŵ������'); %ͼ�ı���
subplot(2,2,4);plot(w,abs(Sxx(1:N))); %��ͼ
title('�����źŵĹ������ܶ�'); %ͼ�ı���
figure;
subplot(3,1,1); plot(ht); %��ͼ
title('ϵͳ���亯����ʱ��ͼ'); %ͼ�ı���
subplot(3,1,2);plot(HW); %��ͼ
title('ϵͳ���亯����Ƶ��ͼ'); %ͼ�ı���
subplot(3,1,3);plot(w,abs(HW2(1:N))); %��ͼ
title('ϵͳ�Ĺ��ʴ��亯��'); %ͼ�ı���
figure;
subplot(2,1,1);plot(t,Ryy); %��ͼ
title('����źŵ�����غ���'); %ͼ�ı���
subplot(2,1,2);plot(w,abs(Syy(1:N))); %��ͼ
title('����źŵĹ������ܶ�'); %ͼ�ı���
figure;
subplot(2,1,1);plot(Ry1); %��ͼ
title('�������õ�����ź������'); %ͼ�ı���
subplot(2,1,2);plot(w,abs(Sy2(1:N))); %��ͼ
title('�������õ�������������ܶ�'); %ͼ�ı���

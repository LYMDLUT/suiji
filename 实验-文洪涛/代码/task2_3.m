%% task2_3
%% ���û���
clc;
clear all;
close all;
%% ������˹������
N=500;
xt=random('norm',0,1,1,N);
%% ��ƴ�ͨ�˲���
ht=fir1(100,[0.3 0.4]);
HW=fft(ht,2*N);
%% ����
Rx=xcorr(xt,'biased');
Sx=abs(fft(xt,2*N).^2)/(2*N);
HW2=abs(HW).^2;
Sy=Sx.*HW2;
Ry=fftshift(ifft(Sy));
%% ������
w=(1:N)/N;
t=(-N:N-1)/N*(N/20000);
subplot(4,1,1);plot(w,abs(Sx(1:N)));
xlabel('��һ��Ƶ��f');ylabel('Sx(f)');title('�����źŹ������ܶ�');
subplot(4,1,2);plot(w,abs(HW2(1:N)));
xlabel('��һ��Ƶ��f');ylabel('Hw(f)');title('ϵͳ�Ĺ��ʴ��亯��');
subplot(4,1,3);plot(w,abs(Sy(1:N)));
xlabel('��һ��Ƶ��f');ylabel('Sy(f)');title('����źŹ������ܶ�');
subplot(4,1,4);plot(t,Ry);
xlabel('ʱ���');ylabel('Ry(��)');title('����źŵ�����غ���');

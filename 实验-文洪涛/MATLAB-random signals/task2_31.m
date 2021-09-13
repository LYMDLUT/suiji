%% task2_3
%% ���û���
clc;
clear all;
close all;
%% ��������ź�����
N=500;
xn=rnd2(0,1,N);

%% ����˲���
%�弤��Ӧ
ht=fir1(100,[0.3 0.4]);                     %100�״�ͨ�˲��������ֽ�ֹƵ��Ϊ0.3��0.4
%���ݺ���
HW=fft(ht,2*N);                             %2N���˲���Ƶ����Ӧ��ϵͳ���亯����
%% ���������źŵ�����غ͹�����
%�����
Rx=xcorr(xn,'biased');                      %ֱ�ӷ����ư�����������غ���
% ������
Gx=abs(fft(xn,2*N).^2)/(2*N);               %����ͼ�����ư������Ĺ�����
%% ϵͳ���
Gw=abs(HW).^2;                              %ϵͳ�Ĺ��ʴ��亯��
Gy=Gx.*Gw;                                  %����źŵĹ�����
Ry=fftshift(ifft(Gy));                      %��IFFT������źŵ�����غ���
                                                   %����fftshift�����������λ
%% figure-�����ź�
w=(1:N)/N;                                  %�������ܶȺ�������
t=(-N:N-1)/N*(N/20000);                     %����غ�����������
figure,subplot(311)
plot(xn);
title('����ź�ʱ����')
subplot(312);plot(Rx)
title('��������غ���Rx')
subplot(313);plot(w,abs(Gx(1:N)));
xlabel('��һ��Ƶ��f');ylabel('Gx(f)');title('�����źŹ������ܶ�');
%% figure-ϵͳ����
figure
subplot(211),plot(ht)
title('�弤��Ӧ����ht')
subplot(212);plot(w,abs(Gw(1:N)));
xlabel('��һ��Ƶ��f');ylabel('H2(f)');title('ϵͳ�Ĺ��ʴ��亯��');

%% figure-�źŹ�ϵͳ
figure
subplot(411);plot(w,abs(Gx(1:N)));
xlabel('��һ��Ƶ��f');ylabel('Gx(f)');title('�����źŹ������ܶ�');
subplot(412);plot(w,abs(Gw(1:N)));
xlabel('��һ��Ƶ��f');ylabel('H2(f)');title('ϵͳ�Ĺ��ʴ��亯��');
subplot(413);plot(w,abs(Gy(1:N)));
xlabel('��һ��Ƶ��f');ylabel('Gy(f)');title('����źŵĹ������ܶ�');
subplot(414);plot(t,Ry);
xlabel('��һ��Ƶ��f');ylabel('Ry(f)');title('����źŵ�����غ���');
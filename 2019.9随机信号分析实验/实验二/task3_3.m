%% task3_3
%% ���û���
clear all
clc
close all
%% ��������ź�
N=10000;f0=10000;deltf=500;fs=22000;M=50;
X=NarrowBand(N,f0,deltf,fs,M);
X=X/sqrt(var(X));                       %��һ������
figure;subplot(2,1,1);plot(X);
title('խ���źŵ�ʱ����')
% ������
subplot(2,1,2);plot(periodogram(X));
title('խ���źŹ������ܶ�')       
%% ȡ��խ������źŵİ��硢��λ������ƽ��
[At, Ph, At2]=EnvelopPhase(X,f0,fs);
%% ʱ���μ�ֱ��ͼ
figure;subplot(321);plot(At);
title('������������');
subplot(323);plot(Ph);
title('��λ��������');
subplot(325);plot(At2);
title('����ƽ��ֵ��������');
qj1 =0:0.05:4;
subplot(322);hist(At,qj1);
title('��������ֵ�ķֲ�ֱ��ͼ��������');
qj2=-pi/2:0.05:pi/2;
subplot(324);hist(Ph,qj2);
title('��λ����ֵ�ķֲ�ֱ��ͼ�����ȣ�');
qj3=0:0.2:16;
subplot(326);hist(At2,qj3);
title('����ƽ��ֵ�ķֲ�ֱ��ͼ��ָ����');
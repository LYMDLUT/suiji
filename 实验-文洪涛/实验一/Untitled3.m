%% task1_3
%% ���û���
clear all;
close all;
clc;
%% ����N(1,2),N(3,4)
y1=rnd2(1,sqrt(2),10000);
y2=rnd2(3,2,10000);
%% ͳ����
zxg1 = zeros(1,10000);
zxg2 = zeros(1,10000);
hxg = zeros(1,10000);

[zxg1,n1]=ycorr(y1,y1,'coeff');
[zxg2,n2]=ycorr(y2,y2,'coeff');
[hxg,n3]=xcorr(y1,y2,'coeff');
 
subplot(311);plot(n1,zxg1)
title('N(1,2)����غ���');
subplot(312);plot(n2,zxg2)
title('N(3,4)����غ���');
subplot(313);plot(n3,hxg)
title('����غ���');
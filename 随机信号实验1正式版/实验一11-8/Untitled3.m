%% task1_3
%% ���û���
clear all;
close all;
clc;
num =10000;
% %% ����N(1,2),N(3,4)
y1=rnd1(1,sqrt(2),10000);
y2=rnd1(3,2,10000);
% %% ͳ����

% [x1,lags]=xcorr(y1,'coeff');
% [x2,lags]=xcorr(y2,'coeff');
[zxg1,n1]=ycorr(y1,y1,'coeff');
[zxg2,n2]=ycorr(y2,y2,'coeff');
[x12,lags]=xcorr(y1,y2,'coeff');
subplot(2,1,1);plot(n1,zxg1);
%ylim([0,1]);
[mx,indx]=max(zxg1);
title(['���ֵ��λ��',num2str(abs(indx-num))]);
hold on
subplot(2,1,2);plot(n2,zxg2);
[mx,indx]=max(zxg2);
title(['���ֵ��λ��',num2str(abs(indx-num))]);
suptitle('��·�źŵ������չʾ')
[mx,indx]=max(x12);
figure;plot(lags,x12)
title(['��·�źŵĻ����չʾ',num2str(abs(indx-num))])
% subplot(3,1,1);plot(n1,zxg1)
% title('N(1,2)����غ���');
% subplot(3,1,2);plot(n2,zxg2)
% title('N(3,4)����غ���');
% subplot(3,1,3);plot(n3,hxg)
% title('����غ���');
%% task1_3
%% 配置环境
clear all;
close all;
clc;
num =10000;
% %% 产生N(1,2),N(3,4)
y1=rnd1(1,sqrt(2),10000);
y2=rnd1(3,2,10000);
% %% 统计量

% [x1,lags]=xcorr(y1,'coeff');
% [x2,lags]=xcorr(y2,'coeff');
[zxg1,n1]=ycorr(y1,y1,'coeff');
[zxg2,n2]=ycorr(y2,y2,'coeff');
[x12,lags]=xcorr(y1,y2,'coeff');
subplot(2,1,1);plot(n1,zxg1);
%ylim([0,1]);
[mx,indx]=max(zxg1);
title(['最大值点位于',num2str(abs(indx-num))]);
hold on
subplot(2,1,2);plot(n2,zxg2);
[mx,indx]=max(zxg2);
title(['最大值点位于',num2str(abs(indx-num))]);
suptitle('两路信号的自相关展示')
[mx,indx]=max(x12);
figure;plot(lags,x12)
title(['两路信号的互相关展示',num2str(abs(indx-num))])
% subplot(3,1,1);plot(n1,zxg1)
% title('N(1,2)自相关函数');
% subplot(3,1,2);plot(n2,zxg2)
% title('N(3,4)自相关函数');
% subplot(3,1,3);plot(n3,hxg)
% title('互相关函数');
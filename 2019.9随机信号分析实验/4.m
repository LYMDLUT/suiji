clear all
close all
% clf
clc
[s,Fs1]=audioread('201746013_sound1.wav');
[sLag,FS2]=audioread('201746013_sound2.wav');
num=length(s);
subplot(2,1,1);plot(s)
title('����Դ�ź�')
hold on
subplot(2,1,2);plot(sLag,'r')

title('�źż����ӳ��ź�');
[x,lags]=xcorr(s,sLag,'coeff');
figure;plot(lags,x)
title('��·ͬԴ�źŵĻ���أ���ֵ�������');
[mx,indx] = max (x);
TLag = abs(num - indx);
t_all=num/8192;
t_lag=t_all*(TLag/num);
disp(['��������غ����������ӳٵ���Ϊ��',num2str(TLag),'��'])
disp(['��������غ����������ӳ�ʱ��Ϊ��',num2str(t_lag),'��'])
[x,lags]=xcorr(s,sLag,10000,'coeff');
figure;plot(lags,x)
title('��·ͬԴ�źŵĻ���أ���ֵ�������');
s_lag=sLag(1:TLag);
figure;plot(s_lag);
title('�ӳٶ��ź�');
alpha=0.05;
judge(s_lag,alpha)
%�ӳٶ��źž�ֵ
%mean(s_lag)
[y,xi]=ksdensity(s_lag,[0:0.01:1]);
plot(xi,y*0.01)
%% ��������ź�
N = 200;
f = 1000;
fs = 16000;
% ʱ��
sig = sin(2*pi*f/fs*(1:N));
figure(1),plot(sig)
title('�����ź�1000Hz��������16000Hz')

yy=myconv(sig,fs*(1:N));
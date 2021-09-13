%% 产生随机信号
N = 200;
f = 1000;
fs = 16000;
% 时域
sig = sin(2*pi*f/fs*(1:N));
figure(1),plot(sig)
title('正弦信号1000Hz，采样率16000Hz')

yy=myconv(sig,fs*(1:N));
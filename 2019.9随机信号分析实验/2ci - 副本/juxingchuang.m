N=1024;
fs=1000;
t=(0:N-1)/fs;
fai=random('unif',0,1,1,8)*2*pi;
xt=sin(2*pi*30*t+fai(1))+3*sin(2*pi*100*t+fai(2))+randn(1,N);
Nseg=256;
win=rectwin(256)';%注意符号
Sx1=abs(fft(win.*xt(1:256),Nseg).^2)/norm(win)^2;
Sx2=abs(fft(win.*xt(257:512),Nseg).^2)/norm(win)^2;
Sx3=abs(fft(win.*xt(513:768),Nseg).^2)/norm(win)^2;
Sx4=abs(fft(win.*xt(769:1024),Nseg).^2)/norm(win)^2;
Sx=10*log10((Sx1+Sx2+Sx3+Sx4)/4);
f=(0:Nseg/2-1)*fs/Nseg;
figure(8),plot(f,Sx(1:Nseg/2));grid on;   %!!GUIGUIGUIGUIGUIGUIGUIGUIGUI3
title('直接法加矩形窗平滑');
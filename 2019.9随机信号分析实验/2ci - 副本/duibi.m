clear;
N=1024;fs=1000;
t=(0:N-1)/fs;
fai=random('unif',0,1,1,8)*2*pi;
xln=random('norm',0,1,N,8);
for k =1:8
    xn(:,k)=sin(2*pi*30*t(:)+fai(k))+3*sin(2*pi*100*t(:)+fai(k))+xln(:,k);
    Sx(:,k)=periodogram(xn(:,k));
end
ESx=mean(Sx(1:N/2,:),2);
f=(0:N/2-1)*fs/N;
subplot(211);plot(f,10*log10(Sx(1:N/2,:)));

subplot(212);plot(f,10*log10(ESx));

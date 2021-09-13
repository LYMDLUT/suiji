clear;
Fs=1000;
n=0:1/Fs:1;
y=cos(2*pi*40*n)+3*cos(2*pi*100*n)+randn(size(n));
Nfft=1000;
window=hanning(100);   
noverlap=20;   
dflag='none';  
[Pxx,f]=psd(y,Nfft,Fs,window,noverlap);   
figure
plot(f,10*log10(Pxx));  
xlabel('frequency/Hz');ylabel('PSD/dB');
title('PSD-Welch method')
hold on;
[Pxx1,f1]=pwelch(y,window,noverlap,Nfft,Fs); 
plot(f1,10*log10(Pxx1),'r');  
function  [Ac As]=Lowfsignal(X,f0,fs)  
%产生低频过程Ac和As的样本
HX=imag(hilbert(X));
[M N]=size(X);
t=0:1/fs:((N-1)/fs);
Ac=X.*cos(2*pi*f0*t)+HX.*sin(2*pi*f0*t);
As=HX.*cos(2*pi*f0*t)-X.*sin(2*pi*f0*t);

return

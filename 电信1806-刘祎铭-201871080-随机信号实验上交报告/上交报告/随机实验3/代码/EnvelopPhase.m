function [At Ph A2]=EnvelopPhase(X,f0,fs)
HX=imag(hilbert(X));
[M N]=size(X);
t=0:1/fs:((N-1)/fs);
Ac=X.*cos(2*pi*f0*t)+HX.*sin(2*pi*f0*t);
As=HX.*cos(2*pi*f0*t)-X.*sin(2*pi*f0*t);
Ph=atan(As./Ac);
A2=Ac.^2+As.^2;
At=sqrt(A2);
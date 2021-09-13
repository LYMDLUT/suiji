function [ Data ] = data_process( Amp1,Pha1,Freq1,Amp2,Pha2,Freq2,Num,AmpN, Fs )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
t=(0:Num-1)/Fs;                       %ʱ������
% fai=random('unif',0,1,1,2)*2*pi;    %����2��[0��2pi]�ھ��������
fai=[Pha1 Pha2];
xn=Amp1*cos(2*pi*Freq1*t+fai(1))+Amp2*cos(2*pi*Freq2*t+fai(2))+AmpN*randn(1,Num);
Data.A(:,1) = 1:Num;
Data.A(:,2) = xn;

Sx=abs(fft(xn)).^2/Num;              %���ƹ�����
f=(0:Num/2-1)*Fs/Num;                   %Ƶ��������
Data.B(:,1) = f;
Data.B(:,2) = 10*log10(Sx(1:Num/2));


Nseg=floor(Num/4);
win=rectwin(Nseg)';%ע�����
Sx1=abs(fft(win.*xn(1:Nseg),Nseg).^2)/norm(win)^2;
Sx2=abs(fft(win.*xn((Nseg+1):2*Nseg),Nseg).^2)/norm(win)^2;
Sx3=abs(fft(win.*xn((2*Nseg+1):3*Nseg),Nseg).^2)/norm(win)^2;
Sx4=abs(fft(win.*xn((3*Nseg+1):4*Nseg),Nseg).^2)/norm(win)^2;
Sxa=10*log10((Sx1+Sx2+Sx3+Sx4)/4);
f=(0:Nseg/2-1)*Fs/Nseg;
Data.C(:,1) = f;
Data.C(:,2) = Sxa(1:Nseg/2);

win = [];f = [];Sx1 = [];Sx2 = [];Sx3 = [];Sx4 = [];Sx = [];
win=hanning(Nseg)';%ע�����
Sx1=abs(fft(win.*xn(1:Nseg),Nseg).^2)/norm(win)^2;
Sx2=abs(fft(win.*xn((Nseg+1):2*Nseg),Nseg).^2)/norm(win)^2;
Sx3=abs(fft(win.*xn((2*Nseg+1):3*Nseg),Nseg).^2)/norm(win)^2;
Sx4=abs(fft(win.*xn((3*Nseg+1):4*Nseg),Nseg).^2)/norm(win)^2;
Sx=10*log10((Sx1+Sx2+Sx3+Sx4)/4);
f=(0:(Nseg/2-1))*Fs/Nseg;
Data.D(:,1) = f;
Data.D(:,2) = Sx(1:Nseg/2);

Sx2 = [];
Sx2=periodogram(xn);
Data.E(:,1) = (0:(Num/2-1))*Fs/Num;
Data.E(:,2) = 10*log10(Sx2(1:Num/2));

f = [];Sx1 = [];
Rxx=xcorr(xn,'biased');                     %��������غ���Rxx
Sx1=abs(fft(Rxx));                          %��Rxx����FFT�õ�������
f=(0:(Num-1))*Fs/Num/2;                           %Ƶ��������
Data.F(:,1) = f;
Data.F(:,2) = 10*log10(Sx1(1:Num));

f = [];Sx2 = [];
window=hanning(Nseg);                       %������
noverlap=Nseg/2;                            %�ص�����Ϊ128
f=(0:Nseg/2)*Fs/Nseg;                       %Ƶ��������
Sx2=mypsd(xn,Nseg,Fs,window,noverlap,'none');  %psd�������ƹ�����
Data.G(:,1) = f;
Data.G(:,2) = 10*log10(Sx2);

Sx3 = [];
Sx3=pwelch(xn,window,Nseg/2,Nseg,Fs,'onesided')*Fs/2;
Data.H(:,1) = f;
Data.H(:,2) = 10*log10(Sx3);


end


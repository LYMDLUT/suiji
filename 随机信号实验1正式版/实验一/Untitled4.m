%% task1_4
%% ׼������
clear all;
close all;
clc;
%% ��ȡ����
[filename1,filepath1]=uigetfile('.wav');
audeofile1= strcat(filepath1,filename1); 
[y1,Fs1] = audioread(audeofile1);
[filename2,filepath2]=uigetfile('.wav');
audeofile2= strcat(filepath2,filename2); 
[y2,Fs2] = audioread(audeofile2);
num=length(y1);
disp(['�����ź�Ƶ��',num2str(Fs1),'Hz��']);
%% �ж��ӳ�
[x,lags]=xcorr(y1,y2,'coeff');
figure;plot(lags,x)
title('��·ͬԴ�źŵĻ���أ���ֵ�������');
[mx,indx] = max(x);
TLag = abs(num - indx);
disp(['��������غ����������ӳٵ���Ϊ��',num2str(TLag),'��'])
TsLag=TLag/Fs1*1000;
disp(['�����ӳ�ʱ��Ϊ��',num2str(TsLag),'ms��'])
%% ���в�������
noise=y2(1:TLag);
m = zeros(1,4);        %����[0 0 0 0]
for i = 1 : TLag
    m(1) = m(1) + noise(i);    % ��ֵ
    m(2) = m(2) + noise(i)^2;  % ���׾�
    m(3) = m(3) + noise(i)^3;  %����
    m(4) = m(4) + noise(i)^4;  %�Ľ�
end
m=m/TLag;
disp(['�������ݵ���������'])
disp(['��ֵ = ',num2str(m(1))] );
disp(['����ֵ = ',num2str(m(2))] );
disp(['����ԭ��� = ',num2str(m(3))] );
disp(['�Ľ�ԭ��� = ',num2str(m(4))] );
meanValue=mean(noise);
stdValue=std(noise);
disp(['���� = ',num2str(stdValue^2)] );
%% ��Ԥ��ֵ�Ա�
disp(['Ԥ���������ֵΪ��',num2str(0),',����Ϊ��',num2str(0.11)]);
meanErr=meanValue;
stdErr  = (stdValue^2 - 0.11)/(0.11)*100;
disp(['��ֵ�������Ϊ��',num2str(meanErr),' ����������Ϊ��',num2str(stdErr),' %'])
[f,xi]=ksdensity(noise);
figure,subplot(3,1,1),plot(xi,f);
title('����MATLAB����ksdensity���Ƶĸ����ܶ�');
%%
t=-3:1/1000:3;
y=1/sqrt(2*pi*0.1)*exp((-5)*t.^2);
[f,xi]=ksdensity(noise);
subplot(3,1,2),plot(xi,f);
title('Ԥ�����Ϊ0.11�ĸ�˹�ֲ����۸���ͼ');
suptitle('�������ݸ���ͼ�����۸��ʱȽ�');
%% ʹ�ø���Ҷ�任���жϸ�˹�ֲ�(1)
% Fs3=Fs1;
% f=fft(noise);
% a=abs(f/TLag);
% p1=a(1:TLag/2+1);
% p1(2:end-1)=2*p1(2:end-1);
% f1=Fs3*(0:(TLag/2))/TLag;
% subplot(3,1,3),plot(f1,p1);
%% ʹ�ø���Ҷ�任���жϸ�˹�ֲ�(2)
fs=Fs1;
N=2*Fs1;
n=0:N-1;
x=fft(noise,N);
m=abs(x);
n=-N/2:N/2-1;
f=n*fs/N;
subplot(3,1,3),plot(f,m);
%% ʹ�ü��������֤�����ķֲ�
% A=noise;
% alpha=0.05;
% [mu,sigma]=normfit(A);
% p1=normcdf(A,mu,sigma);
% [H1,s1]=kstest(A,[A,p1],alpha);
% if H1==0
%     disp('�����ݷ�����̬�ֲ���')
% else
%     disp('�����ݲ�������̬�ֲ���')
% end
%% ʹ��ģ�黯���������֤�����ķֲ�
p_judge(noise,0.05);

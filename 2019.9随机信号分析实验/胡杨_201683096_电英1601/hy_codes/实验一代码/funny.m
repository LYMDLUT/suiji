%% 1
a=[1:5];
b=3;
c=mod(a,b)
%% 2
c=ones
d=ones(5)%5*5�ĵ�λ��
d=ones(2,3)%2*3�ĸ���Ԫ�ص���1�ľ���
%% 3
tic
num=100;
for i=1:num
    for j=1:num
        C(j,i)=(i-1)*num+j
    end
end
toc
%% 4
clear all
close all
clc
num=1e3;
s1=randn(1,num);
s2=rand(1,num);

[x1,lags1]=xcorr(s1,'unbiased');
[x2,lags2]=xcorr(s2,'unbiased');
figure
subplot(211);plot(lags1*dt,x1,'b');
[~,indx]=max(x1);
title(['���ֵ��λ��',num2str(abs(indx-num))]);%%ȡindx-num �ľ���ֵ
subplot(212);plot(lags2*dt,x2,'r')
title(['���ֵ��λ��',num2str(abs(indx-num))]);
suptitle('���źŵ������')

%% 5
clear all
close all
clc

% ���ɵ�·�ź�
num=1e3;lag=40;%Ԥ�������ź��ӳ�Ϊ40�㣬���ź��ӳٳ�����������
s=randn(1,num);
%�������˹��
sLag=[randn(1,lag) s];
sLag(end-lag+1:end)=[];
disp(['�ź��ӳٴ��Ը�˹��������'])
% ��ʾ��·ͬԴ�ź�
subplot(211);plot(s)
title('ԭʼ�ź�')
hold on
subplot(212);plot(sLag,'r')
% title('�ӳ��źţ��ӳٴ���0���');
title('�ӳ��źţ��ӳٴ��Ը�˹��������');
suptitle('�źż����ӳ��ź�')
% ��·ͬԴ�ź����
[x,lags]=xcorr(s,sLag,'coeff');
figure;plot(lags,x)
title('��·ͬԴ�źŵĻ���أ���ֵ�������');
%��������ط�ֵ�õ��ӳٵ���
[mx,indx] = max (x);
TLag = abs(num - indx);
disp(['��������غ����������ӳٵ���Ϊ��',num2str(TLag),'��'])
%�Ŵ�ʱ��߶ȣ����ڹ۲�
[x,lags]=xcorr(s,sLag,'coeff');
figure;plot(lags,x)
axis([-50,0,-1,1.2])
title('��·ͬԴ�źŵĻ���أ���ֵ�������');
suptitle('�Ŵ�ʱ��߶�')


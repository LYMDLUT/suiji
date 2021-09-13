%% ָ���ֲ�������Ĳ�����ͳ�����Է����Լ����������
clear all
close all
clc
a=5;num=1e6;
x=rand(1,num);
s=-1/a*log(1-x);

%% չʾ���ݲ�У��
%% ����
figure,
subplot(221),plot(s)
title('ȫ����������')
subplot(222),plot(s(1:100))
title('ǰ100����������');
%% ����
subplot(223),plot(s,'.')
title('ȫ�����ݻ���')
subplot(224),plot(s(1:100),'*')
title('ǰ100�����ݻ���')
suptitle('ѧ����������ָ���ֲ������')
hold on
%% ����������ֲ�
[f,xi]=ksdensity(s)
figure,subplot(211),plot(xi,f);
title('���ÿ⺯��ksdensity���Ƶ�ָ���ֲ������ܶ�')
%% ����Ԥ��ָ���ֲ�E(a)����ͼ
t=0:0.01:max(s);
y=a*exp(-a*t);
subplot(212),plot(t,y);
title('�⺯��ָ���ֲ�E(a)���۸���')
suptitle('ѧ����������ָ���ֲ��ĸ��������۸��ʱȽ�')
hold on
%% ���������1~4��ԭ���
m=zeros(1,4);
for i=1:num;
    m(1)=m(1)+s(i);   
    m(2)=m(2)+s(i)^2;  
    m(3)=m(3)+s(i)^3; 
    m(4)=m(4)+s(i)^4;  
end
m=m/num;
disp(['�������ݵ���������'])
disp(['��ֵ=',num2str(m(1))] );
disp(['����ֵ=',num2str(m(2))] );
disp(['����ԭ���=',num2str(m(3))] );
disp(['�Ľ�ԭ���=',num2str(m(4))] );
%% ��֤����ֵ�����
meanValue = mean(s);
stdValue  = std(s);
disp('----------')
disp(['Ԥ���������ֵΪ',num2str(1/a),',��׼��Ϊ',num2str(sqrt(1/a^2))]);
disp(['�����������ֵΪ',num2str(meanValue),',��׼��Ϊ',num2str(stdValue)]);

meanErr=(meanValue - 1/a)/(1/a)*100;
stdErr=(stdValue - 1/a)/(1/a)*100;

disp(['������ֱ�Ϊ��',num2str(meanErr),'%,�ͣ�',num2str(stdErr),'%'])
disp('�����������ֱ��ͼ�͵ͽ׾��Ͽ�����������Ҫ��')


%% ʵ��һ֮4 ��غ������Ƽ��������
clear all
close all
clc
dt=0.1;
t=[0:dt:100];
num=1e3;
s1=randn(1,num);
s2=rand(1,num);
%% �����źŵ������
[x1,lags1]=xcorr(s1,'unbiased');
[x2,lags2]=xcorr(s2,'unbiased');
figure
subplot(211);plot(lags1*dt,x1,'b');
[~,indx]=max(x1);
title(['���ֵ��λ��',num2str(abs(indx-num))]);%%ȡindex-num �ľ���ֵ
subplot(212);plot(lags2*dt,x2,'r')
title(['���ֵ��λ��',num2str(abs(indx-num))]);
suptitle('���źŵ������')
%% ���ƻ���غ���
[x12,lags3]=xcorr(s1,s2,'unbiased');
figure;plot(lags3,x12)
axis([-1000,1000,-0.2,0.2])
title(['���źŵĻ����'])


%% ʵ��һ_5 ʱ���ӳٹ��Ƽ��������
clear all
close all
clc
%% ���ɵ�·�ź�
num=1e3;lag=40;%Ԥ�������ź��ӳ�Ϊ40�㣬���ź��ӳٳ�����������
s=randn(1,num);
%�������˹��
sLag=[randn(1,lag) s];
sLag(end-lag+1:end)=[];
disp(['�ź��ӳٴ��Ը�˹��������'])
%% ��ʾ��·ͬԴ�ź�
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
axis([-100,100,-1,1.2])
title('��·ͬԴ�źŵĻ���أ���ֵ�������');
suptitle('�Ŵ�ʱ��߶�')



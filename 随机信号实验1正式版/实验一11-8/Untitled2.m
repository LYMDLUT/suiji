%% task1_2
%% ���û���
clear all;
close all;
clc;
%% ������˹�������
m=3;
a=2;
num=10000;
s=rnd1(m,a,num);
y=rnd2(m,a,num);
%% ���ߺͻ���
% ����
figure,subplot(2,2,1),plot(s);
title('���ļ����ۼӷ�ȫ����������');
% ����
subplot(2,2,2),plot(s,'.');
title('���ļ����ۼӷ�ȫ�����ݻ���');
% ����
subplot(2,2,3),plot(y);
title('�任��ȫ����������');
% ����
subplot(2,2,4),plot(y,'.');
title('�任��ȫ�����ݻ���');

%% ��������ľ�ֵ������ֵ��һά����ԭ��ء�һά�Ľ�ԭ���
n=zeros(1,4);
for i=1:10000
    n(1)=n(1)+s(i);
    n(2)=n(2)+s(i)^2;
    n(3)=n(3)+s(i)^3;
    n(4)=n(4)+s(i)^4;
end
n=n/10000;
disp(['���ļ����ۼӷ��������ݵ���������'])
disp(['��ֵ = ',num2str(n(1))] );
disp(['����ֵ = ',num2str(n(2))] );
disp(['����ԭ��� = ',num2str(n(3))] );
disp(['�Ľ�ԭ��� = ',num2str(n(4))] );
m1=zeros(1,4);
for i=1:10000
    m1(1)=m1(1)+y(i);
    m1(2)=m1(2)+y(i)^2;
    m1(3)=m1(3)+y(i)^3;
    m1(4)=m1(4)+y(i)^4;
end
m1=m1/10000;
disp(['�任���������ݵ���������'])
disp(['��ֵ = ',num2str(m1(1))] );
disp(['����ֵ = ',num2str(m1(2))] );
disp(['����ԭ��� = ',num2str(m1(3))] );
disp(['�Ľ�ԭ��� = ',num2str(m1(4))] );
%% �����Сֵ
Max=max(s);disp(['���ļ����ۼӷ����ֵ',num2str(Max),'��']);
Min=min(s);disp(['���ļ����ۼӷ���Сֵ',num2str(Min),'��']);
Max1=max(y);disp(['�任�����ֵ',num2str(Max1),'��']);
Min1=min(y);disp(['�任����Сֵ',num2str(Min1),'��']);
%% 
disp('���ļ����ۼӷ�')
meanValue = mean(s);
stdValue  = std(s);
disp('----------')
disp(['Ԥ���������ֵΪ��',num2str(m),',��׼��Ϊ��',num2str(a)]);
disp(['�����������ֵΪ��',num2str(meanValue),',��׼��Ϊ��',num2str(stdValue)]);

meanErr = (meanValue - m)/(m)*100;
stdErr  = (stdValue - a)/(a)*100;

disp(['������ֱ�Ϊ��',num2str(meanErr),' %, �ͣ�',num2str(stdErr),' %'])
disp('�����������ֱ��ͼ�͵ͽ׾��Ͽ�����������Ҫ��')
%% ��֤��ֵ�ͷ���
disp('�任��')
meanValue = mean(y);
stdValue  = std(y);
disp('----------')
disp(['Ԥ���������ֵΪ��',num2str(m),',��׼��Ϊ��',num2str(a)]);
disp(['�����������ֵΪ��',num2str(meanValue),',��׼��Ϊ��',num2str(stdValue)]);

meanErr = (meanValue - m)/(m)*100;
stdErr  = (stdValue - a)/(a)*100;

disp(['������ֱ�Ϊ��',num2str(meanErr),' %, �ͣ�',num2str(stdErr),' %'])
disp('�����������ֱ��ͼ�͵ͽ׾��Ͽ�����������Ҫ��')
%% 
[zxg1,n1]=xcorr(s,'coeff');
[zxg2,n2]=xcorr(y,'coeff');
figure,subplot(2,1,1),plot(n1,zxg1);
title('���ļ����ۼӷ���˹���');
subplot(2,1,2),plot(n2,zxg2);
title('�任����˹���');
[f,xi]=ksdensity(s);
figure,subplot(3,1,1),plot(xi,f);
title('���ļ����ۼӷ�����MATLAB����ksdensity���Ƶĸ����ܶ�')
[f,xi]=ksdensity(y);
subplot(3,1,2),plot(xi,f);
title('�任������MATLAB����ksdensity���Ƶĸ����ܶ�')
xlim([-6,12]);
t=-50:1/100:50;
k=1/(sqrt(2*pi)*a)*exp(-(t-m).^2/(2*a*a));
subplot(3,1,3),plot(t,k);
title('Ԥ���N��m��a����˹�ֲ����۸���ͼ')
xlim([-6,12]);
suptitle('�Ա�����������ݸ���ͼ�����۸��ʱȽ�')
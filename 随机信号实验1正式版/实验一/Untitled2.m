%% task1_2
%% ���û���
clear all;
close all;
clc;
%% ������˹�������
m=3;
a=2;
num=10000;
s=rand(1,num);
y=rand(1,num);
%% ���ߺͻ���
% ����
figure,subplot(2,1,1),plot(s);
title('���ļ���ȫ����������');
% ����
subplot(2,1,2),plot(s,'.');
title('���ļ���ȫ�����ݻ���');
% ����
figure,subplot(2,1,1),plot(y);
title('�任��ȫ����������');
% ����
subplot(2,1,2),plot(y,'.');
title('�任��ȫ�����ݻ���');
%% ͳ����
n=zeros(1,4);
for i=1:10000
    n(1)=n(1)+s(i);
    n(2)=n(2)+s(i)^2;
    n(3)=n(3)+s(i)^3;
    n(4)=n(4)+s(i)^4;
end
n=n/10000;
m=zeros(1,4);
for i=1:10000
    m(1)=m(1)+y(i);
    m(2)=m(2)+y(i)^2;
    m(3)=m(3)+y(i)^3;
    m(4)=m(4)+y(i)^4;
end
m=m/10000;

Max=max(s);disp(['�Ա����ֵ',num2str(Max),'��']);
Min=min(s);disp(['�Ա���Сֵ',num2str(Min),'��']);
Max1=max(y);disp(['�������ֵ',num2str(Max1),'��']);
Min1=min(y);disp(['������Сֵ',num2str(Min1),'��']);
[zxg1,n1]=xcorr(s,y,'coeff');
%[zxg2,n2]=xcorr(y,'coeff');
figure,subplot(2,1,1),plot(n1,(zxg1-0.25)/0.8);
% title('���ļ��޸�˹���');
% subplot(2,1,2),plot(n2,zxg2);
% title('�任����˹���');
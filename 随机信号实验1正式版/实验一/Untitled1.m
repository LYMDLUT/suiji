%% task1_1
%% ���û���
clear all;
close all;
clc;
%% ���������
% ����
M=1048576;
b=1;
r=2045;
first=12357;
num=10000;
s=randuniform(M,b,r,first,num);%�Ա�
y=rand(1,num);%����
%% ���ߺͻ���
% ����
figure,subplot(2,1,1),plot(s)  %ȫ��
title('ȫ����������');
subplot(2,1,2),plot(s(1:100)) %ǰ100������
title('ǰ100����������');
% ����
figure,subplot(2,1,1),plot(s,'.')  %ȫ��
title('ȫ�����ݻ���');
subplot(2,1,2),plot(s(1:100),'*') %ǰ100������
title('ǰ100�����ݻ���');
%% ͳ����
%����׾�
n=zeros(1,4);
for i=1:10000
    n(1)=n(1)+s(i);
    n(2)=n(2)+s(i)^2;
    n(3)=n(3)+s(i)^3;
    n(4)=n(4)+s(i)^4;
end
n=n/10000;
disp(['�Ա�������ĸ��׾�',num2str(n),'��']);
%% �Ա�����׾�
m=zeros(1,4);
for i=1:10000
    m(1)=m(1)+y(i);
    m(2)=m(2)+y(i)^2;
    m(3)=m(3)+y(i)^3;
    m(4)=m(4)+y(i)^4;
end
m=m/10000;
disp(['����������ĸ��׾�',num2str(m),'��']);
%ֱ��ͼ
figure,subplot(2,1,1),hist(s);title('�Ա�������ķֲ�');
subplot(2,1,2),hist(s,100);
title('�Ա��������100�ݷֲ�');
figure,subplot(2,1,1),hist(y);title('����������ķֲ�');
subplot(2,1,2),hist(y,100);
title('�����������100�ݷֲ�');
Max=max(s);disp(['�Ա����ֵ',num2str(Max),'��']);
Min=min(s);disp(['�Ա���Сֵ',num2str(Min),'��']);
Max1=max(y);disp(['�������ֵ',num2str(Max1),'��']);
Min1=min(y);disp(['������Сֵ',num2str(Min1),'��']);
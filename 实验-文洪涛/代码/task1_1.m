%% task1_1
%% ���û���
clc;
clear all;
close all;
%% ���������
% ����
M=1048576;
b=2;
r=2103;
s=zeros(1,10000);
s(1)=12388;

for i=2:10000
    s(i)=mod(s(i-1)*r+b,M);
end

s=s/M;

%% ���ߺͻ���
% ����
figure
plot(s)
title('ȫ����������')
% ����
figure
plot(s,'.')
title('ȫ�����ݻ���')
%% ͳ����
%����׾�
n=zeros(1,4);
for i=1:4
    n(i)=mean(s.^i);
end
n
%ֱ��ͼ
figure
hist(s)
Max=max(s)
Min=min(s)
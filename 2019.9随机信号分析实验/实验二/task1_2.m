%% task1_2
%% ���û���
clc;
clear all;
close all;
%% ������˹�������
s=rnd2(3,2,10000);
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
n=zeros(1,4);
for i=1:4
    n(i)=mean(s.^i);
end
n

figure
hist(s,100)
Max=max(s)
Min=min(s)
function [s]= rnd1(m,a,num)
%% 
% �����ļ��޶��������ɸ�˹�����
% m����ֵ��a����׼�num�����ݵ���  
% ����һ·�����ľ��ȷֲ������
% M=1048576;
% b=1;
% r=2045;
% first=12357;
% x=randuniform(M,b,r,first,num*12);
x = rand(1,num*12);
y = reshape(x,12,num);
y1 = sum(y)-6;
% ���Ա任�����Ͼ�ֵ�ͱ�׼�������·��˹��
s = a*y1+m;
figure
hist(s,100);
title('��˹���ļ��޶���');



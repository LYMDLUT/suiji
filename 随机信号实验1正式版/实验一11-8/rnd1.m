function [s]= rnd1(m,a,num)
%% 
% �����ļ��޶��������ɸ�˹�����
% m����ֵ��a����׼�num�����ݵ���  
% ����һ·�����ľ��ȷֲ������

M=1048576;
b=1;
r=2045;
first=12357;
x=randuniform(M,b,r,first,num*12);
% x = rand(1,num*12);
y = reshape(x,12,num);
y1 = sum(y)-6;
% ���Ա任�����Ͼ�ֵ�ͱ�׼�������·��˹��
s = a*y1+m;
%% 
% s=zeros(1,num);
% x=randuniform(1048576,2045,1,12357,num*12);
% for i=1:num
% y=sum(x(1+12*(i-1):1+12*(i-1)+11)-1/2)/sqrt(12/12);
% s(i)=a*y+m;
% end


%%
figure
hist(s,100);
title('���ļ��޶����˹');



function [s]= rnd2(m,a,num);
% %% 
% % �����ļ��޶��������ɸ�˹�����
% % m����ֵ��a����׼�num�����ݵ���  
% % ����һ·�����ľ��ȷֲ������
% % x = rand(1,num*12);
% % figure
% % hist(x,100);
% % 12�����
% % y = reshape(x,12,num);
% y=rand(12,num);
% y1 = sum(y)-6;
% % ���Ա任�����Ͼ�ֵ�ͱ�׼�������·��˹��
% s = a*y1+m;
% figure
% hist(s,100);
% end
%% 
% x=rand(1,num);
% y=rand(1,num);
M=1048576;
b=1;
r=2045;
first1=12357;
first2=12359;
x=randuniform(M,b,r,first1,num);
y=randuniform(M,b,r,first2,num);
y1=sqrt((-2)*log(x)).*cos(2*pi*y);
s=a*y1+m;
figure
hist(s,100);
title('�任����˹');

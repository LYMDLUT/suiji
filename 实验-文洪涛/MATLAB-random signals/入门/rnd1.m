function [s1,s2] = rnd1(m,a,num)
% ���ɸ�˹�����
% mn����ֵ��a����׼�num�����ݵ���
num=100;
m=0;
a=1;
% ������·�����ľ��ȷֲ������
x1 = rand(1,num);
x2 = rand(1,num);

% �任
y1 = sqrt(-2*log(x1)).*cos(2*pi*x2);
y2 = sqrt(-2*log(x1)).*sin(2*pi*x2);

% ���Ա任�����Ͼ�ֵ�ͱ�׼�������·��˹��
s1 = a*y1+m;
s2 = a*y2+m;



%% task1_4
%% ���û���
clc;
clear all;
close all;
%% ����N(1,4),�ӳ��ź�
x=200;      %ƫ����
y1=rnd2(1,2,10000);
for i = x+1 : 10000
y2(i) = y1(i-x);
end
%% �����
% �Լ������غ�������
% hxg = zeros(1,10000);
% for j = 0 : 9899
%   for i = 1 : 9900-abs(j-5000)
%     hxg(j+1) =hxg(j+1)+ y1(i)*y2(i+abs(j-5000));
%   end
%   hxg(j+1)=hxg(j+1)/10000;
% end

[hxg,n]=xcorr(y1,y2,'coeff');
plot(n,hxg)
title('����غ���');
%% ��������ط�ֵ���ӳٵ���
[mx,indx] = max (hxg);
TLag = abs(10000 - indx);
disp(['��������غ����������ӳٵ���Ϊ��',num2str(TLag),'��'])
%% �Ŵ�ʱ��߶�
[hxg,lags]=xcorr(y1,y2,1000,'coeff');
figure;plot(lags,hxg)
title('�Ŵ�ʱ��߶ȵĻ����')
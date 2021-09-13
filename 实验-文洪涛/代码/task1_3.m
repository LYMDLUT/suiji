%% task1_3
%% ���û���
clc;
clear all;
close all;
%% ����N(1,2),N(3,4)
y1=rnd2(1,sqrt(2),10000);
y2=rnd2(3,2,10000);
%% ͳ����
zxg1 = zeros(1,10000);
zxg2 = zeros(1,10000);
hxg = zeros(1,10000);

%�Լ������غ�������
% for j = 0 : 9999
%   for i = 1 : 10000-abs(j-5000)
%      zxg1(j+1) =zxg1(j+1)+ y1(i)*y1(i+abs(j-5000));
%   end
%   zxg1(j+1)=zxg1(j+1)/10000;
% end
% 
% for j = 0 : 9999
%   for i = 1 : 10000-abs(j-5000)
%      zxg2(j+1) =zxg2(j+1)+ y2(i)*y2(i+abs(j-5000));
%   end
%   zxg2(j+1)=zxg2(j+1)/10000;
% end
% 
% for j = 0 : 9999
%   for i = 1 : 10000-abs(j-5000)
%     hxg(j+1) =hxg(j+1)+ y1(i)*y2(i+abs(j-5000));
%   end
%   hxg(j+1)=hxg(j+1)/10000;
% end


[zxg1,n1]=xcorr(y1,'coeff');
[zxg2,n2]=xcorr(y2,'coeff');
[hxg,n3]=xcorr(y1,y2,'coeff');

subplot(311);plot(n1,zxg1)
title('N(1,2)����غ���');
subplot(312);plot(n2,zxg2)
title('N(3,4)����غ���');
subplot(313);plot(n3,hxg)
title('����غ���');
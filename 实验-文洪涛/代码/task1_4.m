%% task1_4
%% 配置环境
clc;
clear all;
close all;
%% 产生N(1,4),延迟信号
x=200;      %偏移量
y1=rnd2(1,2,10000);
for i = x+1 : 10000
y2(i) = y1(i-x);
end
%% 互相关
% 自己编的相关函数计算
% hxg = zeros(1,10000);
% for j = 0 : 9899
%   for i = 1 : 9900-abs(j-5000)
%     hxg(j+1) =hxg(j+1)+ y1(i)*y2(i+abs(j-5000));
%   end
%   hxg(j+1)=hxg(j+1)/10000;
% end

[hxg,n]=xcorr(y1,y2,'coeff');
plot(n,hxg)
title('互相关函数');
%% 搜索互相关峰值得延迟点数
[mx,indx] = max (hxg);
TLag = abs(10000 - indx);
disp(['经计算相关函数，估计延迟点数为：',num2str(TLag),'。'])
%% 放大时间尺度
[hxg,lags]=xcorr(y1,y2,1000,'coeff');
figure;plot(lags,hxg)
title('放大时间尺度的互相关')
%% 1
a=[1:5];
b=3;
c=mod(a,b)
%% 2
c=ones
d=ones(5)%5*5的单位阵
d=ones(2,3)%2*3的各个元素等于1的矩阵
%% 3
tic
num=100;
for i=1:num
    for j=1:num
        C(j,i)=(i-1)*num+j
    end
end
toc
%% 4
clear all
close all
clc
num=1e3;
s1=randn(1,num);
s2=rand(1,num);

[x1,lags1]=xcorr(s1,'unbiased');
[x2,lags2]=xcorr(s2,'unbiased');
figure
subplot(211);plot(lags1*dt,x1,'b');
[~,indx]=max(x1);
title(['最大值点位于',num2str(abs(indx-num))]);%%取indx-num 的绝对值
subplot(212);plot(lags2*dt,x2,'r')
title(['最大值点位于',num2str(abs(indx-num))]);
suptitle('两信号的自相关')

%% 5
clear all
close all
clc

% 生成单路信号
num=1e3;lag=40;%预设两边信号延迟为40点，且信号延迟出以随机数填充
s=randn(1,num);
%补随机高斯数
sLag=[randn(1,lag) s];
sLag(end-lag+1:end)=[];
disp(['信号延迟处以高斯随机数填充'])
% 显示两路同源信号
subplot(211);plot(s)
title('原始信号')
hold on
subplot(212);plot(sLag,'r')
% title('延迟信号，延迟处以0填充');
title('延迟信号，延迟处以高斯随机数填充');
suptitle('信号及其延迟信号')
% 两路同源信号相关
[x,lags]=xcorr(s,sLag,'coeff');
figure;plot(lags,x)
title('两路同源信号的互相关，峰值处最相关');
%搜索互相关峰值得到延迟点数
[mx,indx] = max (x);
TLag = abs(num - indx);
disp(['经计算相关函数，估计延迟点数为：',num2str(TLag),'。'])
%放大时间尺度，便于观察
[x,lags]=xcorr(s,sLag,'coeff');
figure;plot(lags,x)
axis([-50,0,-1,1.2])
title('两路同源信号的互相关，峰值处最相关');
suptitle('放大时间尺度')


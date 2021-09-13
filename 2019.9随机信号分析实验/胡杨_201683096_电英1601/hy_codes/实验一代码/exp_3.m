%% 指数分布随机数的产生，统计特性分析以及计算机仿真
clear all
close all
clc
a=5;num=1e6;
x=rand(1,num);
s=-1/a*log(1-x);

%% 展示数据并校验
%% 画线
figure,
subplot(221),plot(s)
title('全部数据连线')
subplot(222),plot(s(1:100))
title('前100个数据连线');
%% 画点
subplot(223),plot(s,'.')
title('全部数据画点')
subplot(224),plot(s(1:100),'*')
title('前100个数据画点')
suptitle('学生代码生成指数分布随机数')
hold on
%% 估计随机数分布
[f,xi]=ksdensity(s)
figure,subplot(211),plot(xi,f);
title('利用库函数ksdensity估计的指数分布概率密度')
%% 对照预设指数分布E(a)概率图
t=0:0.01:max(s);
y=a*exp(-a*t);
subplot(212),plot(t,y);
title('库函数指数分布E(a)理论概率')
suptitle('学生代码生成指数分布的概率与理论概率比较')
hold on
%% 求随机数的1~4阶原点矩
m=zeros(1,4);
for i=1:num;
    m(1)=m(1)+s(i);   
    m(2)=m(2)+s(i)^2;  
    m(3)=m(3)+s(i)^3; 
    m(4)=m(4)+s(i)^4;  
end
m=m/num;
disp(['生成数据的数字特征'])
disp(['均值=',num2str(m(1))] );
disp(['均方值=',num2str(m(2))] );
disp(['三阶原点矩=',num2str(m(3))] );
disp(['四阶原点矩=',num2str(m(4))] );
%% 验证均方值和误差
meanValue = mean(s);
stdValue  = std(s);
disp('----------')
disp(['预设参数，均值为',num2str(1/a),',标准差为',num2str(sqrt(1/a^2))]);
disp(['计算参数，均值为',num2str(meanValue),',标准差为',num2str(stdValue)]);

meanErr=(meanValue - 1/a)/(1/a)*100;
stdErr=(stdValue - 1/a)/(1/a)*100;

disp(['相对误差分别为：',num2str(meanErr),'%,和：',num2str(stdErr),'%'])
disp('两者相近。从直方图和低阶矩上看，基本符合要求。')


%% 实验一之4 相关函数估计计算机仿真
clear all
close all
clc
dt=0.1;
t=[0:dt:100];
num=1e3;
s1=randn(1,num);
s2=rand(1,num);
%% 两个信号的自相关
[x1,lags1]=xcorr(s1,'unbiased');
[x2,lags2]=xcorr(s2,'unbiased');
figure
subplot(211);plot(lags1*dt,x1,'b');
[~,indx]=max(x1);
title(['最大值点位于',num2str(abs(indx-num))]);%%取index-num 的绝对值
subplot(212);plot(lags2*dt,x2,'r')
title(['最大值点位于',num2str(abs(indx-num))]);
suptitle('两信号的自相关')
%% 估计互相关函数
[x12,lags3]=xcorr(s1,s2,'unbiased');
figure;plot(lags3,x12)
axis([-1000,1000,-0.2,0.2])
title(['两信号的互相关'])


%% 实验一_5 时间延迟估计计算机仿真
clear all
close all
clc
%% 生成单路信号
num=1e3;lag=40;%预设两边信号延迟为40点，且信号延迟出以随机数填充
s=randn(1,num);
%补随机高斯数
sLag=[randn(1,lag) s];
sLag(end-lag+1:end)=[];
disp(['信号延迟处以高斯随机数填充'])
%% 显示两路同源信号
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
axis([-100,100,-1,1.2])
title('两路同源信号的互相关，峰值处最相关');
suptitle('放大时间尺度')



clear all
close all
clc
%% 生成指数分布随机数
a=5;
num=1e6;
x=rand(1,num);
s=-1/a*log(1-x);
%% 展示数据并校验
%% 画线
figure, subplot(221),plot(s)
title('全部数据连线')
subplot(222),plot(s(1:100))
title('前100个数据连线')
%% 画点
subplot(223),plot(s,'.')
title('全部数据画点')
subplot(224),plot(s(1:100),'*')
title('前100个数据画点')
suptitle('自编代码生成数据展示')
%% 画直方图
figure,subplot(221),hist(s)
title('n=10直方图')
subplot(222),hist(s,100)
title('n=100')
suptitle('中心极限定理生成高斯分布数据直方图展示')

%% 估计随机数的分布
[f,xi]=ksdensity(s);
figure,subplot(211),plot(xi,f);
title('利用matlab函数kedsensity估计的概率密度')
%% 对照预设的指数分布E(a)概率图
t=0:0.01:max(s);
y=a*exp(-a*t);
subplot(2,1,2),plot(t,y);
title('预设的指数分布E(a)理论概率图')
suptitle('中心极限定理生成数据概率图与理论概率比较')
%% 求随机数的1~4阶原点矩
m=zeros(1,4);
for i=1:num
    m(1)=m(1)+s(i);
    m(2)=m(2)+s(i)^2;
    m(3)=m(3)+s(i)^3;
    m(4)=m(4)+s(i)^4;
end
m=m/num;
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(m(1))]);
disp(['均方值 = ',num2str(m(2))]);
disp(['三阶原点矩 = ',num2str(m(3))]);
disp(['四阶原点矩 = ',num2str(m(4))]);
%% 验证均值和方差
meanValue = mean(s);
stdValue  = std(s);
disp('----------')
disp(['预设参数，均值为：',num2str(1/a),',标准差为：',num2str(sqrt(1/a^2))]);
disp(['计算参数，均值为：',num2str(meanValue),',标准差为：',num2str(stdValue)]);

meanErr = (meanValue - 1/a)/(1/a)*100;
stdErr  = (stdValue - 1/a)/(1/a)*100;

disp(['相对误差分别为：',num2str(meanErr),'%,和：',num2str(stdErr),'%'])
disp('两者相近。从直方图和低阶矩上看，基本符合要求。')
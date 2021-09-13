clear all
close all
clc
mn=3;
a=2;
num=100000;
[s1]=rnd2(mn,a,num);
%% 展示数据并校验
s=s1;
%% 画线
figure,
subplot(2,2,1),plot(s) 
title('所有数据连线')
subplot(2,2,2),plot(s(1:100)) 
title('前100个数据连线')
%% 画点
subplot(2,2,3),plot(s,'.')  %全部
title('全部数据画点')
subplot(2,2,4),plot(s(1:100),'*') %前100个数据
title('前100个数据画点')
suptitle('中心极限法生成数据展示')

%% 画直方图
figure,subplot(2,1,1),hist(s)
title('n=10直方图')

subplot(2,1,2),hist(s,100)
title('n=100直方图')

suptitle('中心极限法生成数据直方图展示')

[f,xi]=ksdensity(s);
figure,subplot(2,1,1),plot(xi,f);
title('利用MATLAB函数ksdensity估计的概率密度')

t=-50:1/100:50;
y=1/(sqrt(2*pi)*a)*exp(-(t-mn).^2/(2*a*a));
subplot(2,1,2),plot(t,y);
title('预设的N（mn，a）高斯分布理论概率图')

suptitle('自编代码生成数据概率图与理论概率比较')

m = zeros(1,4);        %生成[0 0 0 0]
for i = 1 : num
    m(1) = m(1) + s(i);    % 均值
    m(2) = m(2) + s(i)^2;  % 二阶矩
    m(3) = m(3) + s(i)^3;  %三阶
    m(4) = m(4) + s(i)^4;  %四阶
end
m=m/num;
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(m(1))] );
disp(['均方值 = ',num2str(m(2))] );
disp(['三阶原点矩 = ',num2str(m(3))] );
disp(['四阶原点矩 = ',num2str(m(4))] );


meanValue = mean(s);
stdValue  = std(s);
disp('----------')
disp(['预设参数，均值为：',num2str(mn),',标准差为：',num2str(a)]);
disp(['计算参数，均值为：',num2str(meanValue),',标准差为：',num2str(stdValue)]);

meanErr = (meanValue - mn)/(mn)*100;
stdErr  = (stdValue - a)/(a)*100;

disp(['相对误差分别为：',num2str(meanErr),' %, 和：',num2str(stdErr),' %'])
disp('两者相近。从直方图和低阶矩上看，基本符合要求。')


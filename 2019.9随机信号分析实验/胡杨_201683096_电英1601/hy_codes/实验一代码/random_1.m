clear all 
close all
clc
%% 分布随机数的产生%图1
num = 10000;
M=1048576;b = 1;r = 2045;first = 12357;
s=randuniform(M,b,r,first,num);
%
m = zeros(1,4);        
for i = 1 : num
    m(1) = m(1) + s(i);   
    m(2) = m(2) + s(i)^2; 
    m(3) = m(3) + s(i)^3;  
    m(4) = m(4) + s(i)^4;  
end
m=m/num;
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(m(1),3)] );
disp(['均方值 = ',num2str(m(2),3)] );
disp(['三阶原点矩 = ',num2str(m(3),3)] );
disp(['四阶原点矩 = ',num2str(m(4),3)] );
%
figure,
subplot(241),plot(s)
title('全部数据连线')
subplot(242),plot(s(1:100))
title('前100个数据连线')
subplot(243),plot(s,'.') 
title('全部数据画点')
subplot(244),plot(s(1:100),'*')
title('前100个数据画点')
%% 
disp('========以下对比Matlab库函数生成的数据========')

sm=rand(1,num);
m = zeros(1,4);        %生成[0 0 0 0]
for i = 1 : num
    m(1) = m(1) + sm(i);    % 均值
    m(2) = m(2) + sm(i)^2;  % 二阶矩
    m(3) = m(3) + sm(i)^3;  %三阶
    m(4) = m(4) + sm(i)^4;  %四阶
end
m=m/num;
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(m(1),3)] );
disp(['均方值 = ',num2str(m(2),3)] );
disp(['三阶原点矩 = ',num2str(m(3),3)] );
disp(['四阶原点矩 = ',num2str(m(4),3)] );
%% 对比
subplot(245),plot(sm)
title('全部数据连线')
subplot(246),plot(sm(1:100))
title('前100个数据连线')
%画点
subplot(247),plot(sm,'.')
title('全部数据画点')
subplot(248),
plot(sm(1:100),'*')
title('前100个数据画点')
suptitle('混合同余法生成(up)&matlab内置函数(down)的随机数对比图')



%% 画直方图%图2
figure,subplot(221),hist(s)
title('混合同余法直方图n=10')
subplot(222),hist(s,100)
title('混合同余法直方图n=100')

%对比
subplot(223),hist(sm)
title('库函数n=10')
subplot(224),hist(sm,100)
title('库函数n=100')
suptitle('混合同余法生成数据&MATLAB内置函数生成数据直方图展示')

%% 估计随机数的分布%图3
[f,xi]=ksdensity(s);
figure,subplot(2,1,1),plot(xi,f);
axis([0,1,0,1.5])
title('库函数ksdensity的理论概率密度')
%对比
t=0:0.01:1;%步长为0.01
subplot(2,1,2)
plot(t,ones(size(t)));
title('均匀分布的理论概率密度图')
suptitle('学生代码生成的数据概率密度与理论概率密度比较图')



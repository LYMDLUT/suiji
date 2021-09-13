%% 准备环境
clear all
close all
clc
%% 生成正弦信号样本
N = 20000;
f = 1000;
fs = 16000;
sinData = sin(2*pi*f/fs*(1:N));
figure(1),plot(sinData)
title('20000点正弦信号1000Hz，采样率16000Hz')
%% 设计hilbert滤波器
step = 30;
h = zeros(1,step);
for i = 1 : step
    ind = bitand(abs(i-step/2),1);
    if(ind == 1)
        h(i) = 2/pi/(i-step/2);
    end
end
% show h(n)
figure(2), stem(h)
axis([0 32 -1 1]);
title('时域冲激响应')
%% 频域传递函数
H = zeros(1,N);
for p = 1 : N
    if(p<= N/2)
        H(p) = -j;
    else
        H(p) = j;
    end
end
% show H(p)
figure, stem(imag(H))
title('频域冲激响应')
%% 1：时域变换卷积运算得到cos数据
cosData = conv(sinData,h,'same');
figure(1);plot(cosData,'r')
axis([0 100 -1.5 1.5]);
title('时域变换卷积运算得到cos数据')
%% 时域方法数据校验
[c,l]=xcorr(sinData,cosData,'coeff');
% figure,stem(l,c)
[m,indx] = max(c);
D = abs(indx - N) +1
%% 变换前后数据对比
figure;plot(sinData);hold on
plot([cosData(D:end) zeros(1,D-1)],'r')
axis([0 100 -1.5 1.5]);
title('变换前后数据对比')
legend('变换前','变换后')
%% 转换成弧度 找到周期
[C,I]=find(sinData==1);
T = I(2)-I(1)
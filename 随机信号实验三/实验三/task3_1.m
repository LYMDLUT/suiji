%% 准备环境
clear all
close all
clc
%% 生成正弦信号样本
% N=100点正弦信号1000Hz，采样率16000Hz
N = 20000;
f = 1000;
fs = 1600000;
sinData = sin(2*pi*f/fs*(1:N));
cosdata=cos(2*pi*f/fs*(1:N)-pi);
figure,plot(sinData)
title('100点正弦信号1000Hz，采样率16000Hz')
%axis([0 1000 -1 1]);
%% 设计hilbert滤波器
%时域冲激响应
step = 30000;
h = zeros(1,step);
for i = 1 : step
    ind = bitand(abs(i-step/2),1);
    if(ind == 1)
        h(i) = 2/pi/(i-step/2);
    end
end
% show h(n)
figure,subplot(2,1,1),stem(h)
title('时域冲激响应')
%频域传递函数
H = zeros(1,N);
for p = 1 : N
    if(p<= N/2)
        H(p) = -j;
    else
        H(p) = j;
    end
end
% show H(p)
subplot(2,1,2),stem(imag(H))
%axis([9975 10025 -1 1]);
title('频域冲激响应')

%% 1：时域变换卷积运算得到cos数据
%时域卷积
cosData = conv(sinData,h,'same');

k=cosData-cosdata;
figure,plot(k)

figure,subplot(2,1,1),plot(cosData,'r');hold on
plot(cosdata,'b');
xxx=[cosData',cosdata'];
[p,q]=chi2test(xxx);
%axis([0 1000 -1 1]);
title('时域变换卷积运算得到cos数据')

%% 确认相位差pi/2 自相关确定延迟点数D
[c,l]=xcorr(sinData,cosData,'coeff');
% figure,stem(l,c)
[m,indx] = max(c);
D = abs(indx - N) +1

%% 变换前后数据对比
subplot(2,1,2),plot(sinData);hold on
plot([cosData(D:end) zeros(1,D-1)],'r')
title('变换前后数据对比')
%axis([0 1000 -1 1]);
legend('变换前','变换后')

%% D转换成弧度 找到周期
[C,I]=find(sinData==1);
T = I(2)-I(1)

%%相位差
delta = D/T;
disp(['相位差为：',num2str(delta*2),'pi'])

%% 2：频域变换乘积得到cos数据
%域乘积后反变换
cosData = real(ifft(fft(sinData).*H));
% figure,plot(sinData);hold on
figure,subplot(2,1,1),plot(cosData,'r')
%axis([0 1000 -1 1]);
title('频域变换乘积得到cos数据')

%确认相位差pi/2 自相关确定延迟点数D
[c,l]=xcorr(sinData,cosData,'coeff');
% figure,stem(l,c);
[m,indx] = max(c);
D = abs(indx - N) ;

%变换前后数据对比
subplot(2,1,2),plot(sinData);hold on
plot([cosData(D:end) zeros(1,D-1)],'r')
title('变换前后数据对比')
%axis([0 1000 -1 1]);
legend('变换前','变换后')

%D转换成弧度 找到周期
[C,I]=find(sinData==1);
T = I(4)-I(3)

%相位差
delta = D/T;
disp(['相位差为：',num2str(delta*2),'pi'])

%% 3.对比内置函数 hilbert
cosData = imag(hilbert(sinData));
figure;subplot(2,1,1),plot(cosData,'r')
%axis([0 1000 -1 1]);
title('内置函数 hilbert变换数据')

%%确认相位差pi/2 自相关确定延迟点数D

[c,l]=xcorr(sinData,cosData,'coeff');
% figure,stem(l,c)
[m,indx] = max(c);
D = abs(indx - N)

%%变换前后数据对比
subplot(2,1,2),plot(sinData);hold on
plot([cosData(D:end) zeros(1,D-1)],'r')
title('变换前后数据对比')
%axis([0 1000 -1 1]);
legend('变换前','变换后')

%%D转换成弧度 找到周期
[C,I]=find(sinData==1);
T = I(2)-I(1)

%%相位差
delta = D/T;
disp(['相位差为：',num2str(delta*2),'pi'])


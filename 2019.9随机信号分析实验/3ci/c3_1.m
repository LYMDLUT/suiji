
% 时域冲激响应
NN=31;N1=(NN+1)/2;
h=zeros(1,NN);
for i=1:2:N1-1
    h(i)=2/pi/(i-N1);
end
for i=N1+1:2:NN
    h(i)=2/pi/(i-N1);
end
figure,subplot(211),stem(h);
title('时域冲激响应')


N = 20000;
f = 1000;
fs = 1600000;
% 频域传递函数
H = zeros(1,N);
for p = 1 : N
    if(p<= N/2)
        H(p) = -j;
    else
        H(p) = j;
    end
end
subplot(212),stem(imag(H))
title('频域冲激响应（虚部）')


% 时域
sig = sin(2*pi*f/fs*(1:N));
figure,plot(sig)
title('正弦信号1000Hz，采样率16000Hz')
% 频域
H_sig = fft(sig);

% 时域
% cosData = conv(sinData,h,'same');
hil_t = conv(sig,h,'same');
figure;plot(hil_t,'r')
title('时域变换卷积运算得到hilbert')
% 频域
hil_w = real(ifft(H_sig.*H));
figure,plot(hil_w,'r')
title('频域变换乘积得到hilbert')
% 内置函数
hil_h = imag(hilbert(sig));
figure;plot(hil_h,'r')
title('内置函数 hilbert变换数据')

% 时域校验
[c,l]=xcorr(sig,hil_t,'coeff');
[m,indx] = max(c);
D = abs(indx - N) %确认相位差pi/2 自相关确定延迟点数D
[C,I]=find(sig==1);
T = I(2)-I(1)       %D转换成弧度 找到周期
delta = D/T;
disp(['时域方法结果相位差为：',num2str(delta*2),'pi'])
% 频域校验
[c,l]=xcorr(sig,hil_w,'coeff');
[m,indx] = max(c);
D = abs(indx - N) 
[C,I]=find(sig==1);
T = I(2)-I(1)
delta = D/T;
disp(['频域方法结果相位差为：',num2str(delta*2),'pi'])
% 内置函数校验
[c,l]=xcorr(sig,hil_h,'coeff');
[m,indx] = max(c);
D = abs(indx - N) 
[C,I]=find(sig==1);
T = I(2)-I(1)
delta = D/T;
disp(['内置函数结果相位差为：',num2str(delta*2),'pi'])
function [c, lag] = ycorr ( x,y,option)
%YCORR 相关函数估计。
%   [C LAG] = YCORR(X,Y),
%   [C LAG] = YCORR(X,Y，OPTION),
%   OPTION可选，且为‘none’、‘coeff’、‘biased’、‘unbiased’之一,
%   X，Y是行向量，返值C是 2N-1长度的相关函数，N是X，Y
%   中最长者的长度。除了输入参数不同，其余与XCORR一致。
%   LAG =-(N-1):(N-1)给出C的标号

%   2016.11.1 aleko.

%规定输入有参数形式为（X，Y）或（X，Y，OPTION）
if (nargin ~=2 && nargin ~=3)
    disp('2 or 3 nargin needed.');
    c=0;lag=0;
    return
else
    if nargin == 2
        option ='none';
    end
end
%如果输入向量不等长，补0使等长
N = max(length(x),length(y));
X = [x zeros(1,N-length(x))];
Y = [y zeros(1,N-length(y))];
%default
if isequal(option,'none')
    c0 = sum(X.*Y);
    for m = 1:N-1
        cleft(m) =sum([X(m+1:end),zeros(1,m)].* Y);
        cright(m) =sum(X .* [Y(m+1:end),zeros(1,m)]);
    end
    c=[fliplr(cright) c0,cleft];
    lag = -(N-1):N-1;
    return;
end
%归一化，自相关结果与XCORR一致，互相关有微小差异，互相关不会归一化，无关
if isequal(option,'coeff')
    if ~isequal(x,y)
        disp('coeff for autocorelation only');
        c=0;lag=0;
        return
    end
    c0 = sum(X.*Y);
    for m = 1:N-1
        cleft(m) =sum([X(m+1:end),zeros(1,m)].* Y);
        cright(m) =sum(X .* [Y(m+1:end),zeros(1,m)]);
    end
    c=[fliplr(cright) c0,cleft]/c0;
    lag = -(N-1):N-1;
    return;
end
%有偏估计
if isequal(option,'biased')
    c0 = sum(X.*Y);
    for m = 1:N-1
        cleft(m) =sum([X(m+1:end),zeros(1,m)].* Y);
        cright(m) =sum(X .* [Y(m+1:end),zeros(1,m)]);
    end
    c=[fliplr(cright) c0,cleft]/N;
    lag = -(N-1):N-1;
    return;
end
%无偏估计
if isequal(option,'unbiased')
    c0 = sum(X.*Y)/N;
    for m = 1:N-1
        cleft(m) =sum([X(m+1:end),zeros(1,m)].* Y)/(N-m);
        cright(m) =sum(X .* [Y(m+1:end),zeros(1,m)])/(N-m);
    end
    c=[fliplr(cright) c0,cleft];
    lag = -(N-1):N-1;
    return;
end
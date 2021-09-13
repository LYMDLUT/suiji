function [c, lag] = ycorr ( x,y,option)
%YCORR ��غ������ơ�
%   [C LAG] = YCORR(X,Y),
%   [C LAG] = YCORR(X,Y��OPTION),
%   OPTION��ѡ����Ϊ��none������coeff������biased������unbiased��֮һ,
%   X��Y������������ֵC�� 2N-1���ȵ���غ�����N��X��Y
%   ����ߵĳ��ȡ��������������ͬ��������XCORRһ�¡�
%   LAG =-(N-1):(N-1)����C�ı��

%   2016.11.1 aleko.

%�涨�����в�����ʽΪ��X��Y����X��Y��OPTION��
if (nargin ~=2 && nargin ~=3)
    disp('2 or 3 nargin needed.');
    c=0;lag=0;
    return
else
    if nargin == 2
        option ='none';
    end
end
%��������������ȳ�����0ʹ�ȳ�
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
%��һ��������ؽ����XCORRһ�£��������΢С���죬����ز����һ�����޹�
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
%��ƫ����
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
%��ƫ����
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
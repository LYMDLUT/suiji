%% ׼������
clear all
close all
clc
%% ���������ź�����
N = 20000;
f = 1000;
fs = 16000;
sinData = sin(2*pi*f/fs*(1:N));
figure(1),plot(sinData)
title('20000�������ź�1000Hz��������16000Hz')
%% ���hilbert�˲���
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
title('ʱ��弤��Ӧ')
%% Ƶ�򴫵ݺ���
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
title('Ƶ��弤��Ӧ')
%% 1��ʱ��任�������õ�cos����
cosData = conv(sinData,h,'same');
figure(1);plot(cosData,'r')
axis([0 100 -1.5 1.5]);
title('ʱ��任�������õ�cos����')
%% ʱ�򷽷�����У��
[c,l]=xcorr(sinData,cosData,'coeff');
% figure,stem(l,c)
[m,indx] = max(c);
D = abs(indx - N) +1
%% �任ǰ�����ݶԱ�
figure;plot(sinData);hold on
plot([cosData(D:end) zeros(1,D-1)],'r')
axis([0 100 -1.5 1.5]);
title('�任ǰ�����ݶԱ�')
legend('�任ǰ','�任��')
%% ת���ɻ��� �ҵ�����
[C,I]=find(sinData==1);
T = I(2)-I(1)
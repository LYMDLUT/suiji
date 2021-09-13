%% ׼������
clear all
close all
clc
%% ���������ź�����
% N=100�������ź�1000Hz��������16000Hz
N = 20000;
f = 1000;
fs = 1600000;
sinData = sin(2*pi*f/fs*(1:N));
cosdata=cos(2*pi*f/fs*(1:N)-pi);
figure,plot(sinData)
title('100�������ź�1000Hz��������16000Hz')
%axis([0 1000 -1 1]);
%% ���hilbert�˲���
%ʱ��弤��Ӧ
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
title('ʱ��弤��Ӧ')
%Ƶ�򴫵ݺ���
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
title('Ƶ��弤��Ӧ')

%% 1��ʱ��任�������õ�cos����
%ʱ����
cosData = conv(sinData,h,'same');

k=cosData-cosdata;
figure,plot(k)

figure,subplot(2,1,1),plot(cosData,'r');hold on
plot(cosdata,'b');
xxx=[cosData',cosdata'];
[p,q]=chi2test(xxx);
%axis([0 1000 -1 1]);
title('ʱ��任�������õ�cos����')

%% ȷ����λ��pi/2 �����ȷ���ӳٵ���D
[c,l]=xcorr(sinData,cosData,'coeff');
% figure,stem(l,c)
[m,indx] = max(c);
D = abs(indx - N) +1

%% �任ǰ�����ݶԱ�
subplot(2,1,2),plot(sinData);hold on
plot([cosData(D:end) zeros(1,D-1)],'r')
title('�任ǰ�����ݶԱ�')
%axis([0 1000 -1 1]);
legend('�任ǰ','�任��')

%% Dת���ɻ��� �ҵ�����
[C,I]=find(sinData==1);
T = I(2)-I(1)

%%��λ��
delta = D/T;
disp(['��λ��Ϊ��',num2str(delta*2),'pi'])

%% 2��Ƶ��任�˻��õ�cos����
%��˻��󷴱任
cosData = real(ifft(fft(sinData).*H));
% figure,plot(sinData);hold on
figure,subplot(2,1,1),plot(cosData,'r')
%axis([0 1000 -1 1]);
title('Ƶ��任�˻��õ�cos����')

%ȷ����λ��pi/2 �����ȷ���ӳٵ���D
[c,l]=xcorr(sinData,cosData,'coeff');
% figure,stem(l,c);
[m,indx] = max(c);
D = abs(indx - N) ;

%�任ǰ�����ݶԱ�
subplot(2,1,2),plot(sinData);hold on
plot([cosData(D:end) zeros(1,D-1)],'r')
title('�任ǰ�����ݶԱ�')
%axis([0 1000 -1 1]);
legend('�任ǰ','�任��')

%Dת���ɻ��� �ҵ�����
[C,I]=find(sinData==1);
T = I(4)-I(3)

%��λ��
delta = D/T;
disp(['��λ��Ϊ��',num2str(delta*2),'pi'])

%% 3.�Ա����ú��� hilbert
cosData = imag(hilbert(sinData));
figure;subplot(2,1,1),plot(cosData,'r')
%axis([0 1000 -1 1]);
title('���ú��� hilbert�任����')

%%ȷ����λ��pi/2 �����ȷ���ӳٵ���D

[c,l]=xcorr(sinData,cosData,'coeff');
% figure,stem(l,c)
[m,indx] = max(c);
D = abs(indx - N)

%%�任ǰ�����ݶԱ�
subplot(2,1,2),plot(sinData);hold on
plot([cosData(D:end) zeros(1,D-1)],'r')
title('�任ǰ�����ݶԱ�')
%axis([0 1000 -1 1]);
legend('�任ǰ','�任��')

%%Dת���ɻ��� �ҵ�����
[C,I]=find(sinData==1);
T = I(2)-I(1)

%%��λ��
delta = D/T;
disp(['��λ��Ϊ��',num2str(delta*2),'pi'])


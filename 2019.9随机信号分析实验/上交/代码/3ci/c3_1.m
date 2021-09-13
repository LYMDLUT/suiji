
% ʱ��弤��Ӧ
NN=31;N1=(NN+1)/2;
h=zeros(1,NN);
for i=1:2:N1-1
    h(i)=2/pi/(i-N1);
end
for i=N1+1:2:NN
    h(i)=2/pi/(i-N1);
end
figure,subplot(211),stem(h);
title('ʱ��弤��Ӧ')


N = 20000;
f = 1000;
fs = 1600000;
% Ƶ�򴫵ݺ���
H = zeros(1,N);
for p = 1 : N
    if(p<= N/2)
        H(p) = -j;
    else
        H(p) = j;
    end
end
subplot(212),stem(imag(H))
title('Ƶ��弤��Ӧ���鲿��')


% ʱ��
sig = sin(2*pi*f/fs*(1:N));
figure,plot(sig)
title('�����ź�1000Hz��������16000Hz')
% Ƶ��
H_sig = fft(sig);

% ʱ��
% cosData = conv(sinData,h,'same');
hil_t = conv(sig,h,'same');
figure;plot(hil_t,'r')
title('ʱ��任�������õ�hilbert')
% Ƶ��
hil_w = real(ifft(H_sig.*H));
figure,plot(hil_w,'r')
title('Ƶ��任�˻��õ�hilbert')
% ���ú���
hil_h = imag(hilbert(sig));
figure;plot(hil_h,'r')
title('���ú��� hilbert�任����')

% ʱ��У��
[c,l]=xcorr(sig,hil_t,'coeff');
[m,indx] = max(c);
D = abs(indx - N) %ȷ����λ��pi/2 �����ȷ���ӳٵ���D
[C,I]=find(sig==1);
T = I(2)-I(1)       %Dת���ɻ��� �ҵ�����
delta = D/T;
disp(['ʱ�򷽷������λ��Ϊ��',num2str(delta*2),'pi'])
% Ƶ��У��
[c,l]=xcorr(sig,hil_w,'coeff');
[m,indx] = max(c);
D = abs(indx - N) 
[C,I]=find(sig==1);
T = I(2)-I(1)
delta = D/T;
disp(['Ƶ�򷽷������λ��Ϊ��',num2str(delta*2),'pi'])
% ���ú���У��
[c,l]=xcorr(sig,hil_h,'coeff');
[m,indx] = max(c);
D = abs(indx - N) 
[C,I]=find(sig==1);
T = I(2)-I(1)
delta = D/T;
disp(['���ú��������λ��Ϊ��',num2str(delta*2),'pi'])
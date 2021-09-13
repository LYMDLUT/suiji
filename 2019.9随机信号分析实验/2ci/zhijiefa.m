N=1024;fs=1000;                     %���г��ȺͲ���Ƶ��
t=(0:N-1)/fs;                       %ʱ������
fai=random('unif',0,1,1,2)*2*pi;    %����2��[0��2pi]�ھ��������
xn=cos(2*pi*30*t+fai(1))+3*cos(2*pi*100*t+fai(2))+randn(1,N);
                                    %�������������������                            
figure,plot(xn);                     %!!GUIGUIGUIGUIGUIGUIGUIGUIGUI1
title('����ź�ʱ����')
Sx1=abs(fft(xn)).^2/N;              %���ƹ�����
f=(0:N/2-1)*fs/N;                   %Ƶ��������
figure
subplot(211);
plot(f,10*log10(Sx1(1:N/2)));grid on; %��dB/Hz�������׵�λ����ͼ                                
xlabel('f��Hz��');
ylabel('Sx1(f)(dB/Hz)');
title('����ͼ�����ƹ�����');
Sx2=periodogram(xn);
subplot(212);
plot(f,10*log10(Sx2(1:N/2)));grid on;   
xlabel('f(Hz)');
ylabel('Sx2(f)(dB/Hz)');
title('periodogram�������ƹ�����');



N=500;                                      %��������N=500����Ӧʱ��25ms
xt=random('norm',0,1,1,N);                  %����1*N����˹�����
% ��ʾʱ����
figure,plot(xt);
title('����ź�ʱ����')
%�弤��Ӧ
ht=fir1(101,[0.3 0.4]);                     % 101�״�ͨ�˲��������ֽ�ֹƵ��Ϊ0.3��0.4
% ��ʾ�弤��Ӧ����ht
figure,plot(ht)
title('�弤��Ӧ����ht')
%���ݺ���
HW=fft(ht,2*N);                             %2N���˲���Ƶ����Ӧ��ϵͳ���亯����
% ��ʾ���ݺ���HW
figure,plot((1:N)/N,abs(HW(1:N)));
title('���ݺ���HW')
Rxx=xcorr(xt,'biased');                     %ֱ�ӷ����ư�����������غ���
% ��ʾ����غ���Rxx
figure,stem(Rxx)
title('��������غ���Rxx')
Sxx=abs(fft(xt,2*N).^2)/(2*N);              %����ͼ�����ư������Ĺ�����
HW2=abs(HW).^2;                             %ϵͳ�Ĺ��ʴ��亯��
Syy=Sxx.*HW2;                               %����źŵĹ�����
Ryy=fftshift(ifft(Syy));                    %��IFFT������źŵ�����غ���
                                                   %����fftshift�����������                                                   
w=(1:N)/N;                                  %�������ܶȺ�������
t=(-N:N-1)/N*(N/20000);                     %����غ�����������
subplot(4,1,1);plot(w,abs(Sxx(1:N)));       %�����źŹ������ܶ�
xlabel('��һ��Ƶ��f');ylabel('Sxx(f)');title('�����źŹ������ܶ�');
subplot(4,1,2);plot(w,abs(HW2(1:N)));       %ϵͳ�Ĺ��ʴ��亯��
xlabel('��һ��Ƶ��f');ylabel('H2(f)');title('ϵͳ�Ĺ��ʴ��亯��');
subplot(4,1,3);plot(w,abs(Syy(1:N)));       %����źŵĹ������ܶ�
xlabel('��һ��Ƶ��f');ylabel('Syy(f)');title('����źŵĹ������ܶ�');
subplot(4,1,4);plot(t,Ryy);                 %����źŵ�����غ���
xlabel('��һ��Ƶ��f');ylabel('Ryy(f)');title('����źŵ�����غ���');
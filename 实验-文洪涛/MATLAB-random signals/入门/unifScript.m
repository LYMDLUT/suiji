%% task1_1
%% ׼������
clear all
close all
clc
%% ���ȷֲ�������Ĳ���
% ���� 1000 ����
% function s = randuniform(M,b,r,first,num)
num = 1000;

M = 1048576;b = 1;r = 2045;first = 12357;
s = zeros(1,num);
s(1) = first;

for i = 2 : num
    s(i) = mod(s(i-1)*r+b,M);
end
s = s/M;


%% չʾ����
%% ���ߺͻ���
% ����
figure,
subplot(2,2,1),plot(s)  %ȫ��
title('ȫ����������')
subplot(2,2,2),plot(s(1:100)) %ǰ100������
title('ǰ100����������')

% ����
subplot(2,2,3),plot(s,'.')  %ȫ��
title('ȫ�����ݻ���')
subplot(2,2,4),plot(s(1:100),'*') %ǰ100������
title('ǰ100�����ݻ���')
suptitle('�Ա������������չʾ')
%% ��ֱ��ͼ
figure,subplot(2,1,1),hist(s)
title('��10�������ֱ��ͼ')

subplot(2,1,2),hist(s,100)
title('��100�������ֱ��ͼ')

suptitle('�Ա������������ֱ��ͼչʾ')

%% ����������ķֲ�
[f,xi]=ksdensity(s);
figure,subplot(2,1,1),plot(xi,f);
title('����MATLAB����ksdensity���Ƶĸ����ܶ�')

% Ԥ���[0 ,1]���ȷֲ�����ͼ
t=0:1/100:1;
subplot(2,1,2),plot(t,ones(size(t)));
title('Ԥ���[0 ,1]���ȷֲ����۸���ͼ')

suptitle('�Ա�����������ݸ���ͼ�����۸��ʱȽ�')

%% ��������ľ�ֵ������ֵ��һά����ԭ��ء�һά�Ľ�ԭ���

m = zeros(1,4);        %����[0 0 0 0]
for i = 1 : num
    m(1) = m(1) + s(i);    % ��ֵ
    m(2) = m(2) + s(i)^2;  % ���׾�
    m(3) = m(3) + s(i)^3;  %����
    m(4) = m(4) + s(i)^4;  %�Ľ�
end
m=m/num;
disp(['�������ݵ���������'])
disp(['��ֵ = ',num2str(m(1))] );
disp(['����ֵ = ',num2str(m(2))] );
disp(['����ԭ��� = ',num2str(m(3))] );
disp(['�Ľ�ԭ��� = ',num2str(m(4))] );

%% ====== �Աȣ�Matlab���ú������� ====== 
disp('========���¶Ա�Matlab�⺯�����ɵ�����========')
disp('========        �����������         ========')
% pause;
%% ���� num ������
sm = rand(1,num); 

%% չʾ����
%% ���ߺͻ���
% ����
figure,
subplot(2,2,1),plot(sm)  %ȫ��
title('ȫ����������')
subplot(2,2,2),plot(sm(1:100)) %ǰ100������
title('ǰ100����������')

% ����
subplot(2,2,3),plot(sm,'.')  %ȫ��
title('ȫ�����ݻ���')
subplot(2,2,4),plot(sm(1:100),'*') %ǰ100������
title('ǰ100�����ݻ���')

suptitle('MATLAB���ú�����������չʾ')
%% ��ֱ��ͼ
figure,
subplot(2,1,1),hist(sm)
title('��10�������ֱ��ͼ')

subplot(2,1,2),hist(sm,100)
title('��100�������ֱ��ͼ')
suptitle('MATLAB���ú�����������չʾ')
%% ����������ķֲ�
[f,xi]=ksdensity(sm);
figure,plot(xi,f);
title('����MATLAB����ksdensity���Ƶĸ����ܶ�')

suptitle('MATLAB���ú�����������չʾ')
%% ��������ľ�ֵ������ֵ��һά����ԭ��ء�һά�Ľ�ԭ���

m = zeros(1,4);        %����[0 0 0 0]
for i = 1 : num
    m(1) = m(1) + sm(i);    % ��ֵ
    m(2) = m(2) + sm(i)^2;  % ���׾�
    m(3) = m(3) + sm(i)^3;  %����
    m(4) = m(4) + sm(i)^4;  %�Ľ�
end
m=m/num;
disp(['�������ݵ���������'])
disp(['��ֵ = ',num2str(m(1))] );
disp(['����ֵ = ',num2str(m(2))] );
disp(['����ԭ��� = ',num2str(m(3))] );
disp(['�Ľ�ԭ��� = ',num2str(m(4))] );


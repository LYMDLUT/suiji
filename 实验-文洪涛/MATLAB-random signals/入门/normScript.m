%% ʵ�� I ֮2  ��˹�ֲ�������Ĳ�����ͳ�����Է��������������
%% ʵ�� I ֮2  ��˹�ֲ�������Ĳ�����ͳ�����Է��������������
% 2016.10.31 aleko
%% ׼������
clear all
close all
clc
% clf
%% ���ɸ�˹�ֲ������
mn=1;
a=10;
num=100000;

% % %�Ա�任�� rnd1�� mn����ֵ��a����׼�num�����ݵ���
% % [s1,s2] = rnd1(mn,a,num); 

%�Ա����ļ����ۼӷ�rnd2�� mn����ֵ��a����׼�num�����ݵ���
[s1] = rnd2(mn,a,num); 

%% չʾ���ݲ�У��
s=s1;

%% ����
figure,
subplot(2,2,1),plot(s)  %ȫ��
title('ȫ����������')
subplot(2,2,2),plot(s(1:100)) %ǰ100������
title('ǰ100����������')

%% ����
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

%% ����Ԥ���N��mn��a����˹�ֲ�����ͼ
t=-50:1/100:50;
y=1/(sqrt(2*pi)*a)*exp(-(t-mn).^2/(2*a*a));
subplot(2,1,2),plot(t,y);
title('Ԥ���N��mn��a����˹�ֲ����۸���ͼ')

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

%% ��֤��ֵ�ͷ���
meanValue = mean(s);
stdValue  = std(s);
disp('----------')
disp(['Ԥ���������ֵΪ��',num2str(mn),',��׼��Ϊ��',num2str(a)]);
disp(['�����������ֵΪ��',num2str(meanValue),',��׼��Ϊ��',num2str(stdValue)]);

meanErr = (meanValue - mn)/(mn)*100;
stdErr  = (stdValue - a)/(a)*100;

disp(['������ֱ�Ϊ��',num2str(meanErr),' %, �ͣ�',num2str(stdErr),' %'])
disp('�����������ֱ��ͼ�͵ͽ׾��Ͽ�����������Ҫ��')


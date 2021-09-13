clear all
close all
clc
%% ����ָ���ֲ������
a=5;
num=1e6;
x=rand(1,num);
s=-1/a*log(1-x);
%% չʾ���ݲ�У��
%% ����
figure, subplot(221),plot(s)
title('ȫ����������')
subplot(222),plot(s(1:100))
title('ǰ100����������')
%% ����
subplot(223),plot(s,'.')
title('ȫ�����ݻ���')
subplot(224),plot(s(1:100),'*')
title('ǰ100�����ݻ���')
suptitle('�Ա������������չʾ')
%% ��ֱ��ͼ
figure,subplot(221),hist(s)
title('n=10ֱ��ͼ')
subplot(222),hist(s,100)
title('n=100')
suptitle('���ļ��޶������ɸ�˹�ֲ�����ֱ��ͼչʾ')

%% ����������ķֲ�
[f,xi]=ksdensity(s);
figure,subplot(211),plot(xi,f);
title('����matlab����kedsensity���Ƶĸ����ܶ�')
%% ����Ԥ���ָ���ֲ�E(a)����ͼ
t=0:0.01:max(s);
y=a*exp(-a*t);
subplot(2,1,2),plot(t,y);
title('Ԥ���ָ���ֲ�E(a)���۸���ͼ')
suptitle('���ļ��޶����������ݸ���ͼ�����۸��ʱȽ�')
%% ���������1~4��ԭ���
m=zeros(1,4);
for i=1:num
    m(1)=m(1)+s(i);
    m(2)=m(2)+s(i)^2;
    m(3)=m(3)+s(i)^3;
    m(4)=m(4)+s(i)^4;
end
m=m/num;
disp(['�������ݵ���������'])
disp(['��ֵ = ',num2str(m(1))]);
disp(['����ֵ = ',num2str(m(2))]);
disp(['����ԭ��� = ',num2str(m(3))]);
disp(['�Ľ�ԭ��� = ',num2str(m(4))]);
%% ��֤��ֵ�ͷ���
meanValue = mean(s);
stdValue  = std(s);
disp('----------')
disp(['Ԥ���������ֵΪ��',num2str(1/a),',��׼��Ϊ��',num2str(sqrt(1/a^2))]);
disp(['�����������ֵΪ��',num2str(meanValue),',��׼��Ϊ��',num2str(stdValue)]);

meanErr = (meanValue - 1/a)/(1/a)*100;
stdErr  = (stdValue - 1/a)/(1/a)*100;

disp(['������ֱ�Ϊ��',num2str(meanErr),'%,�ͣ�',num2str(stdErr),'%'])
disp('�����������ֱ��ͼ�͵ͽ׾��Ͽ�����������Ҫ��')
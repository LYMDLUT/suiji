clear all 
close all
clc
%% �ֲ�������Ĳ���%ͼ1
num = 10000;
M=1048576;b = 1;r = 2045;first = 12357;
s=randuniform(M,b,r,first,num);
%
m = zeros(1,4);        
for i = 1 : num
    m(1) = m(1) + s(i);   
    m(2) = m(2) + s(i)^2; 
    m(3) = m(3) + s(i)^3;  
    m(4) = m(4) + s(i)^4;  
end
m=m/num;
disp(['�������ݵ���������'])
disp(['��ֵ = ',num2str(m(1),3)] );
disp(['����ֵ = ',num2str(m(2),3)] );
disp(['����ԭ��� = ',num2str(m(3),3)] );
disp(['�Ľ�ԭ��� = ',num2str(m(4),3)] );
%
figure,
subplot(241),plot(s)
title('ȫ����������')
subplot(242),plot(s(1:100))
title('ǰ100����������')
subplot(243),plot(s,'.') 
title('ȫ�����ݻ���')
subplot(244),plot(s(1:100),'*')
title('ǰ100�����ݻ���')
%% 
disp('========���¶Ա�Matlab�⺯�����ɵ�����========')

sm=rand(1,num);
m = zeros(1,4);        %����[0 0 0 0]
for i = 1 : num
    m(1) = m(1) + sm(i);    % ��ֵ
    m(2) = m(2) + sm(i)^2;  % ���׾�
    m(3) = m(3) + sm(i)^3;  %����
    m(4) = m(4) + sm(i)^4;  %�Ľ�
end
m=m/num;
disp(['�������ݵ���������'])
disp(['��ֵ = ',num2str(m(1),3)] );
disp(['����ֵ = ',num2str(m(2),3)] );
disp(['����ԭ��� = ',num2str(m(3),3)] );
disp(['�Ľ�ԭ��� = ',num2str(m(4),3)] );
%% �Ա�
subplot(245),plot(sm)
title('ȫ����������')
subplot(246),plot(sm(1:100))
title('ǰ100����������')
%����
subplot(247),plot(sm,'.')
title('ȫ�����ݻ���')
subplot(248),
plot(sm(1:100),'*')
title('ǰ100�����ݻ���')
suptitle('���ͬ�෨����(up)&matlab���ú���(down)��������Ա�ͼ')



%% ��ֱ��ͼ%ͼ2
figure,subplot(221),hist(s)
title('���ͬ�෨ֱ��ͼn=10')
subplot(222),hist(s,100)
title('���ͬ�෨ֱ��ͼn=100')

%�Ա�
subplot(223),hist(sm)
title('�⺯��n=10')
subplot(224),hist(sm,100)
title('�⺯��n=100')
suptitle('���ͬ�෨��������&MATLAB���ú�����������ֱ��ͼչʾ')

%% ����������ķֲ�%ͼ3
[f,xi]=ksdensity(s);
figure,subplot(2,1,1),plot(xi,f);
axis([0,1,0,1.5])
title('�⺯��ksdensity�����۸����ܶ�')
%�Ա�
t=0:0.01:1;%����Ϊ0.01
subplot(2,1,2)
plot(t,ones(size(t)));
title('���ȷֲ������۸����ܶ�ͼ')
suptitle('ѧ���������ɵ����ݸ����ܶ������۸����ܶȱȽ�ͼ')



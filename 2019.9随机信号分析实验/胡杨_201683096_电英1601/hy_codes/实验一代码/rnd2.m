function[s1]=rnd2(mn,a,num)%���ļ����ۼӷ�,mn��ʾ��ֵ��a��ʾ��׼�num��ʾ���ݵ���
[s1]=zeros(1,num);
for k=1:12
    x=rand(1,num);
    [s1]=[s1]+x;
end
[s1]=a^2*([s1]-6)+mn
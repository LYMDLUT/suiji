[data,fs]=audioread('201746013_sound1.wav');                %����ԭ��Ƶ
[data2,fs2]=audioread('201746013_sound2.wav');              %�����ӳٺ������Ƶ
figure(1),subplot(2,1,1),plot(data),title("ԭʼ��Ƶ����");
figure(1),subplot(2,1,2),plot(data2),title("�ӳ���Ƶ����");

zongdianshu=length(data);                                   %�����ܵ���
[huxiangguan,shijiancha]=xcorr(data2,data,'coeff');         %���㻥��غ���
figure(2),plot(shijiancha,huxiangguan),title("ԭʼ��Ƶ����ʱ��Ƶ����غ���");
%������غ�������

zuidazhi=max(huxiangguan);                                   %�ҵ�����غ��������ֵ

id=find(huxiangguan==zuidazhi);
yanchidianshu=shijiancha(id);                                %�ҵ�����غ������ֵ��Ӧ�ĺ����꣬

yanchishijian=yanchidianshu/fs;                              %���ϣ���������ӳ�ʱ�������

data3=data2(1:yanchidianshu);
figure(3),hist(data3),title("�ӳ�����ֱ��ͼ");
%������������ֱ��ͼ���۲�ֱ��ͼ����״����������Ϊ���ȷֲ�����������֤��

[h,p,s] = chi2gof(data3,'cdf',{@unifcdf,min(data3),max(data3)})
%���ÿ�������Ŷȼ��飬��h=0��˵������[min(x)��max(x)]�ϵľ��ȷֲ���

[data,fs]=audioread('201746013_sound1.wav');                %读入原音频
[data2,fs2]=audioread('201746013_sound2.wav');              %读入延迟后二等音频
figure(1),subplot(2,1,1),plot(data),title("原始音频波形");
figure(1),subplot(2,1,2),plot(data2),title("延迟音频波形");

zongdianshu=length(data);                                   %计算总点数
[huxiangguan,shijiancha]=xcorr(data2,data,'coeff');         %计算互相关函数
figure(2),plot(shijiancha,huxiangguan),title("原始音频及延时音频互相关函数");
%画互相关函数曲线

zuidazhi=max(huxiangguan);                                   %找到互相关函数的最大值

id=find(huxiangguan==zuidazhi);
yanchidianshu=shijiancha(id);                                %找到互相关函数最大值对应的横坐标，

yanchishijian=yanchidianshu/fs;                              %以上，完成了求延迟时间的任务

data3=data2(1:yanchidianshu);
figure(3),hist(data3),title("延迟噪声直方图");
%做出了噪声的直方图，观察直方图的形状，猜想噪声为均匀分布，下面来验证。

[h,p,s] = chi2gof(data3,'cdf',{@unifcdf,min(data3),max(data3)})
%利用卡方拟合优度检验，若h=0，说明服从[min(x)，max(x)]上的均匀分布。

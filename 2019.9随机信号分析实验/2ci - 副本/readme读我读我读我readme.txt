您好

我这个文件里除了这个读我的txt文件
还有八个m文件，
其中您只需要对四个文件中的输出的内容做GUI


另外四个文件中
duibi（对比）和xiangying（xiangying）是不需要做GUI的
mypsd.m和psdchk.m  这两个文件是matlab2016 自带的文件
有了他们就可以解决matlab2017以上版本无法调用psd函数来输出功率谱密度的问题

zhijiefa（直接法）、juxingchuang（矩形窗）、
hanningchuang（汉宁窗）、 jianjiefa（间接法）四个文件中
都有共同的输入信号


N=1024;fs=1000;                                                                                 %序列长度和采样频率
t=(0:N-1)/fs;                                                                                          %时间序列
fai=random('unif',0,1,1,2)*2*pi;                                                            %产生2个[0，2pi]内均匀随机数
xn=cos(2*pi*30*t+fai(1))+3*cos(2*pi*100*t+fai(2))+randn(1,N);        %产生含噪声的随机序列
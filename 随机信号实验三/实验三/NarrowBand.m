function  X=Narrowbandsignal(N,f0,deltf,fs,M)%产生窄带随机过程
N1=N-M;%N为要产生样本个数，deltf表示信号的带宽，f0随机过程单边功率谱的中心频率为f0
xt=random('norm',0,1,[1,N1]);%fs表示信号采样频率，M为产生宽带信号滤波器阶数
f1=f0*2/fs;%输出N个再带随机信号样本
df1=deltf/fs;%N-M个高斯随机数   %归一化中心频率  %归一化带宽
ht=fir1(M,[f1-df1 f1+df1]);%ht为带通滤波器的冲击响应，M为阶数
X=conv(xt,ht);%输出N个窄带随机信号样本采样
return

function  X=Narrowbandsignal(N,f0,deltf,fs,M)%产生窄带随机过程
N1=N-M;
xt=random('norm',0,1,[1,N1]);
f1=f0*2/fs;
df1=deltf/fs;
ht=fir1(M,[f1-df1 f1+df1]);
X=conv(xt,ht);
return

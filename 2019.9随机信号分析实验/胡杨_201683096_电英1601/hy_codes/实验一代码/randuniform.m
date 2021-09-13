
function s=randuniform(M,b,r,first,num)%产生num个
s=zeros(1,num);%生成均值为零的一维列向量
s(1)=first;%定义初值,后面,first=12357
for i=2:num
    s(i)=mod(s(i-1)*r+b,M);%混合同余法产生随机数
end
s=s/M;%为什么这里不直接写s=s(i)呢%索引超出矩阵维度。
%s=s(i)





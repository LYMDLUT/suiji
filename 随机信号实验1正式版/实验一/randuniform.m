function s=randuniform(M,b,r,first,num);

s=zeros(1,num);
s(1)=first;
for i=2:num
    s(i)=mod(s(i-1)*r+b,M);
end

s=s/M;
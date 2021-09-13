function y=myconv1(h,x) 
n=length(x);  
k=length(h);      %定义序列长度 
for m=1:1:(n-1)       
    A(m)=0;        
end
for m=n:1:n+k-1      
    A(m)=h(m-n+1); %给h序列添（n-1)个0 
end
B=hankel(A);       
for i=1:1:n      
    C(:,i)=B(:,i);  %抽取B矩阵中从第1列到第n列的矩阵 
end
D=fliplr(C);      %C矩阵左右翻转 
E=D';             %转置 y(n+k-1)=0; 
for a=1:1:n+k-1     
    for b=1:1:n          
        numble(b)=x(b)*E(b,a);         
        y(a)=numble(b)+y(a);     
    end
    numble=[0 0 0];   %清零 
end
function y=myconv1(h,x) 
n=length(x);  
k=length(h);      %�������г��� 
for m=1:1:(n-1)       
    A(m)=0;        
end
for m=n:1:n+k-1      
    A(m)=h(m-n+1); %��h������n-1)��0 
end
B=hankel(A);       
for i=1:1:n      
    C(:,i)=B(:,i);  %��ȡB�����дӵ�1�е���n�еľ��� 
end
D=fliplr(C);      %C�������ҷ�ת 
E=D';             %ת�� y(n+k-1)=0; 
for a=1:1:n+k-1     
    for b=1:1:n          
        numble(b)=x(b)*E(b,a);         
        y(a)=numble(b)+y(a);     
    end
    numble=[0 0 0];   %���� 
end
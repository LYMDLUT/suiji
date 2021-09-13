function [xr,xi]=GaussRandomNumbers_(N,Mean,Variance)%�Ա�任��
for n=1:N
    a=sqrt(2.0*log(rand()));
    b=2*pi*rand();
    xr(n)=Variance*a*cos(b)+Mean;
    xi(n)=Variance*a*cos(b)+Mean;
end